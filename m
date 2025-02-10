Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4CCC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 10:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1F710E169;
	Mon, 10 Feb 2025 10:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2Ra4JuR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93C10E169
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739182812; x=1770718812;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ju35/sFcA8PYpbkrn2RRKaLFqN48r7EXXER7mQSlF8M=;
 b=V2Ra4JuRs0Vmei9gjktZpMub+CHPdslkwseXwSn7H+xUU6RH8oOrppu+
 X1mzNE3wJYSd+i/UNPrTOzknKcPt2Z9EmFCV1XWV7rOuq1Vo1Q2rF4mrj
 dGz0KiOPOp7/G9Sm1MVzDCbtfOQeHftCu1/3lvmakSYcCI/xw8LDP4Wo6
 QaYRluG3Osk1aj+GcrxHtl0yxxmq2H8mXBX7pKnbW/YB8aIxyG4DBk9Jt
 0V+f8mj9PSTOleCsldHrldAZliMy3tImHWwKwe+ypYWLnMjnNBmdhUMmc
 y+5fzrZnhk52G3qVtYJ7FobE+FsS44DqIF48vIxuXRycXN3VoMQ1jH4hV g==;
X-CSE-ConnectionGUID: Zod6DHm3RyKQmYQDetC1Tg==
X-CSE-MsgGUID: 6AL17D5RRDaknusCU6Podg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="42598024"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="42598024"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:20:12 -0800
X-CSE-ConnectionGUID: V5TTJ5l2SSS/iTYwvWo88A==
X-CSE-MsgGUID: P1YwkWjOToev6JnVYT7cPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113031255"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 02:20:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 02:20:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 02:20:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 02:20:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhppE3lfw3AaTupNrFU1DlX0Ddde7FvhPHjVZz7UFOuNqksu1/v2FJTvdcfX3Dy0SVghWTmQpMSmiO9l4+3JQXHV2XJfz3uZdjrhjj6kglyisftm6iQowyA8q4ssxTstgpinDmhaBdiB4AIQvtlAOU7hvL8eIGA0KseeQ2upv+u60t1RYYca7tHyqFuge7zhTi5W3+3LbD5DbtGWUdK/J9mZw5BhIwf0Cf5uyoiq7NzY7HXRs+A+jfYiz42GAlp/xadDsEEv1LxuV7xFVRTOht/nAjgCR8zVjW9BjKEziST/XN25nw0o9FCka4WNSNLizqJQbJmzacfb48XkOXij+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0aSYt5s7n+cVykcd1EIlkd9HmXVl/oaveilYSQpnjo=;
 b=R+sviyCokxW+IrBSaBRvCrXLsU48sh012o3Dhnei517wQtgRUKBx3cdJ4Zk0U6ViGclJh4lQyQOZcSUBz623q1NYdK7b8SK5tuHvbKxlBXO8NDCKXDF3OpsRS6GbZAzkXRo9OVnWljA7JGQq7Jjcla/fWtejSc7SbUCt30k8F+uGd1apjz75Syf/UgV6Osw8HPzkxffB+tJa43+vceCtcqPbAPqSZBlIGIydPeTbOjz4UzhXOWMT0VEcVPz9ST7H3q22dWZDOhQRknq9sucxAUsCOmlpHcUEK03z97cJJNF+FZqORdXC+R6lMARKr4PhyrKWOxq0hskYcm6bs80+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 10:20:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 10:20:08 +0000
Message-ID: <31dcd451-70b1-4142-aad0-2cea371f8d2d@intel.com>
Date: Mon, 10 Feb 2025 15:50:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-6-riana.tauro@intel.com>
 <ad580886-537b-4026-bc64-781efb182148@intel.com>
 <8ae02a6c-4459-43f6-8db9-95bb9a7cf898@intel.com>
 <71fed9a8-b8e2-4a38-bf2c-c328eb2d4673@intel.com>
 <Z6aXw52sdI+3KnyT@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z6aXw52sdI+3KnyT@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 19516edd-73a1-485c-a3fc-08dd49bc7e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWZNMjhhdnBkeU1WS01Tay9aSVEwS2RmNkV4N29TcHhVbWtRQ1FsT1ZDU0ZQ?=
 =?utf-8?B?S3BLNU8xYURMOTArdHE4MTh1bTV0YVhDOFQwcnJtTmpRdlkzaFJLSFZPL3FQ?=
 =?utf-8?B?RXA2UXd2SlNUUWw2VTE4SXlXTGhLMUdJYWNBM0V4QVNleVE1ZFVpWnpoL1NH?=
 =?utf-8?B?dkhuMk1wRllKT2lnT3c2T2Q5R2VHTHlscjEzNnBjYm4yb0RkN1F6ajFtSXBh?=
 =?utf-8?B?Mm9PVGhsQVVuTkdnVGJMNFBiSy9aRVl5dWU0WThrS1lHdjlOYm0rOUhVVVBZ?=
 =?utf-8?B?elZ2eXlBdm1vcjVyMHJSMnorYk8xNi95d0dqNW5TbUZGa0tMTDBtVldTam9k?=
 =?utf-8?B?OExxUlNQUC8ybkFnNGtSZDFCeXNOYWRBOW9ld0NvZTlRZC83RTZkWCt5alhV?=
 =?utf-8?B?MCtwdDNIRVpnS0N3YVo3U3R0Z2FGOHdrVUFpeGJJOTArbDdOTDEzU1NwZzZS?=
 =?utf-8?B?ZThVYXRIbWE4U1AwaUovWEp0djZjOE9FekYzbUxJUE8xVWFSdyt2VnY5NUVa?=
 =?utf-8?B?MGJlb1JMUzNmQ2I4NW1hZmQ5KzIzczBaRE0xSWZBd2ttVjRSS1ZkY3RLOSs2?=
 =?utf-8?B?ZlkvbjdLU2VhTU8zTkRDUmhkeGxXdm9TbE1rSzEyTGtlRVhpTFRTc0ZOM0h2?=
 =?utf-8?B?aE9wdDY3NGNuTDk4Ti9NMllLNndNV3l6MVYzR1pQSFRaOUZSWnYvcjdHQWdM?=
 =?utf-8?B?WTRNOFJNVnRhckwxTEUwcWY1K2YwVVgwK3ZRMHhHKy91Q2dScmJMaHZ2bEhY?=
 =?utf-8?B?akRXMjhJSExNNStMVjVING4wanoxZzJyUGltTVpwaloxM2grREQwNFZsWnhH?=
 =?utf-8?B?ZTVXWjhialNobXRaelJPV0FIaTFnU1Q5eWQ3Z2xHQ3ZReUtuVk02WnVMaUpC?=
 =?utf-8?B?c2tBOFY4akdYZUVxaldiRGlKZmVaUlBHZ2xGVUN1MnNaNDNFNTBUVmNxM2Z3?=
 =?utf-8?B?UFo3SUpMNTZ0M1p5L2txS3R1U0tya0JrMHk2OWpQZWFUc2pFR01QdmRvVHoy?=
 =?utf-8?B?blg3QjdkWXJoQmRmRnl5OEpUWlpFVzlxQ2xzc1prM1RUV1diend2cUhONTZW?=
 =?utf-8?B?dElTamtGUGlNK1V2RUtJRUpVTlNpc04xa3F0WG0wSG9LamxKelp3bEl4a2pt?=
 =?utf-8?B?RlJEMm1wL0ZjOHROVEM5MFNURU5kRTZWb1JOZUVVemdrZkFlUHJXcUlHRFJp?=
 =?utf-8?B?ODVuNWRhV24zRExSeWE4Q1FpbnJmNWlBNGVRMkZIMVVZY01UaTlRZlNZU2Vo?=
 =?utf-8?B?cVlmZUN0OEhtR1FWMWZtdnlzbFRyL0o2ZXp6VGVoMUFJRnRwMW00amF0K2xh?=
 =?utf-8?B?ZmFWeTVWZUljQUc2dmRrVjhTWnZxbWUyZEVycklmYTlrVC95ak1kaFRkeDVv?=
 =?utf-8?B?QXdMajBGdFo5dktSZHpBNXd1WklJY25QUllELzFaaWRaYkdEVG54WVNCaElE?=
 =?utf-8?B?T2JLOHZkQWRqR3crcDNkYVJYT05aR1QxS3NVY3F5WjJVaHZlSGJXS2pqbjVa?=
 =?utf-8?B?NWZleFg0NDNScUNPQjNHeXRYSTZZMlk4aVR5M0sxOCtXQXF0QklmR0YycU5I?=
 =?utf-8?B?SjZHcGJMcVoyQzF6dXFZSUhxSG5oejQwbUlhejlWTUFNbTFlRW8wVEJ6VjMw?=
 =?utf-8?B?czI1VHRuMmJtVlRnVUpJa2dlVnJtSlZ5ck5ldWpLL05rSExOWFhSWGF3UTlV?=
 =?utf-8?B?OVA3UmhCbmNjNkpweC9kOHZpRUc1L0VqYW45d2h1ZmtFT1dhdm9hM1hzNDhu?=
 =?utf-8?B?TlZKQzNMSldTaHVEcDFSYjczczBNR0NRZXdmbTkvRHZLU2thajZ5UkxJWDdX?=
 =?utf-8?B?MGcvR1c5dnFPRDFpRm9BYml2dzFDWkxyZWxBQ2R6TDZNNksrZUZERmJFL3F1?=
 =?utf-8?Q?EErnSjohogy00?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnBEZjIvNkZ6OFpXZTgvcFNWSjFSUytBclJRVko1RmxOcHZ1bzRQYTN0SFQz?=
 =?utf-8?B?dHZyRmVQRVpBUmpCN2IzNnJhMjhvUHUxa2VhY2NRQWVDc3NXS0I0K3pKcnZ3?=
 =?utf-8?B?TVczZS84TXMya3FqaFJxS2lFMHgra3g3UTBMWkhqZ1QxenozaDVRdU4xM0ZT?=
 =?utf-8?B?K3ArRG1zaHl2UlFzMUE1aC93UXhSUDFVOWpzZEwxRUx5MUduRmhKd1NTZ1Vu?=
 =?utf-8?B?cHE4aHRPa1VyMmNTNmhQd29HaWlTbmx2R2VvZ09JREFNOGFVZG9kWHlQVzNO?=
 =?utf-8?B?UUdLSzUrZnJuQ2poV0FtYnJWVHNhem5Jc25aTnd6QmcxSmg1L0o0WE5PUmFo?=
 =?utf-8?B?L0FpQkIvMUJ3MEI3SFhXNS90Qzd2R05UcFRlb0tNTzdLeVY2K3lXSklIb1Ru?=
 =?utf-8?B?NklHc0xGQTl1VHFEVFRzMDM0b0J6T0xpYVFhcGdueHZQVWFBcjZKVDBsSXRm?=
 =?utf-8?B?R05FcEtodUJlcEJMVEJCYXgxdHo3SGxGcFpUZHdBRTV0czRwY0xsM3VRcUdE?=
 =?utf-8?B?ODIzdzZTVUJrTS9OT0gvNld5cEV2eXp6cjlNMEZkYXRNQmdSQS9TKzY4ZGp4?=
 =?utf-8?B?R2p1eFU4bHhDSkI5K3RIZDFmcTJBWEdDTG11Y3FZZXdtQVZsZStnSHlTNDJ2?=
 =?utf-8?B?dEZtb3plcXVGOHI0a2cvRVhPVmc3REVzeEswUk1zajNhdm5TM0tyTHdBem81?=
 =?utf-8?B?SUY3Q2JUMVlHakcrV0Rva0NKaDN5dHYyczFvR202Z2lMZmFVQWhyQXF3MVd4?=
 =?utf-8?B?djZxRGZ2c2E1cmFvRkZKcy9IVVBEYjN1K0NXS1lINDNPOFJjdDhwbzN5b2hC?=
 =?utf-8?B?YWZ4cG1sQ09oOWQybVdNMXpJaHUvYlkzZHh4aSsxdzNNclBxOU1LQ1puK0c4?=
 =?utf-8?B?R1ZDWjVpZWZ6aE9Pd2h0T1B3Q1VKUHo2OXRBSzcyWWZDYUxBa2xXTXFIZHRk?=
 =?utf-8?B?ZlZRaUFHWitZZHZhZW1NK1U2cllkNFpkdHpFMXlqQ2dZQzFrTnpTeFBFRHJL?=
 =?utf-8?B?NzFQNWRUWGNhUnlRTTlJYytpSU5mVHg3VnE5dTZaTXBWZ2FwQWdkd2IvbDZW?=
 =?utf-8?B?MlRsZFYvMDU3TTVpb0tjLzNwUk9Jc1VKa3YvdDYzOTBSM0k2ZFlBZTU3Yjhr?=
 =?utf-8?B?dklYZzFxU3FMUDBoVWZnZXB4eGFDYmJtOUJtVmU2ZENCT1M5a3A3eW92NHda?=
 =?utf-8?B?SUdIOFc5dmRScU1kek9keThpZzU2VksxMDVsQ3hsL2xmMEtoTjRSSmFwdE1S?=
 =?utf-8?B?eld4dHNBTGdEdDVHUWtTM0dwQVFjRXlFblhMQzhDYXNoRUd5WWhKanVNOGt6?=
 =?utf-8?B?Zkx4ZmxZZjhCa3I3Qk5WL2wrQkpOeFZnUjZ5U2VtSDFBaFZPWGJGUmpUbHRh?=
 =?utf-8?B?WERBbnBOSEpsbEdBMXJSUyszM1FmbWZxY2MwY1FPamRlekZjWkhjS1J2SVNN?=
 =?utf-8?B?dFRmdFV0Uk84VWJwNTNjV3FMT2c4YjRMZko5L3BYcjFVTkxtelQydnI2ZGg5?=
 =?utf-8?B?b2RrZ2FHUG1FZmx1S1JNYWxiYkJPdEZSYVpHclRZcUQ3cFFTdGNIbjBVQXhv?=
 =?utf-8?B?RXhtZDdrTWM0UEovcC9uZmNwZjluNnd3dzRBeVdHTFZTZVlLREp5VWNhVVQ3?=
 =?utf-8?B?WEpFUGYxd3h5ckV2Ynd0Y3R6SkRLN3RjRS9ab0hXYmR3NWVNZUMwVC9NZmpp?=
 =?utf-8?B?VlFRY2NWK2VRTFFTMWUyNHJVSnhlTkFaYmRma21QeVhLQlRIVDE1Q2JJcXpJ?=
 =?utf-8?B?U0FlakhiRjVadVRYNzlSSFlvVXpybDJJZFNweDVoc1pTQTNsM3hlbk5vUUh3?=
 =?utf-8?B?cEN4WUtBTGs5YWd6MnE4cU95TUgrajJOZjg2Vko2bkhkMnM2eUJRMGNuREtR?=
 =?utf-8?B?WlYyb1FLMmtkNFdXWjBROUVzZ0lWZHVlZy92Mmk3OVp1NlA5U3NXNGxVc25u?=
 =?utf-8?B?R2tyVC8xVWNVbXBZWTdpcFZ4RXpSTUQzbHBaSWZha2FIRzNaa1dUdEl4YmM4?=
 =?utf-8?B?bzY0VGZCYVJRdkpSWklLZURYQmNTK3ljQnRKWWdpM3MxR2UwczFuaEZWNGlG?=
 =?utf-8?B?elczK0NNTWFsT085RWx6N3Exb2UvcTdRRU90TlRMZjVuZGZYd0gzcTByWTd3?=
 =?utf-8?Q?ehnw/m2TTJ5opm4NFzFaTCT/4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19516edd-73a1-485c-a3fc-08dd49bc7e4e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 10:20:08.2091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFxuXN1RQhX5eORcP94SsIhaRVk075B4zAdosRsRFgpQ+0486KTqZRuhjgEHKJegtqZ1+8hBujmUPLYxbvOFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 2/8/2025 5:01 AM, Umesh Nerlige Ramappa wrote:
> On Fri, Feb 07, 2025 at 12:21:24PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 07-02-2025 11:48, Riana Tauro wrote:
>>>
>>> Hi Himal
>>>
>>> On 2/7/2025 8:39 AM, Ghimiray, Himal Prasad wrote:
>>>>
>>>>
>>>> On 06-02-2025 16:13, Riana Tauro wrote:
>>>>> When the engine events are created, acquire GT forcewake to read gpm
>>>>> timestamp required for the events and release on event destroy. This
>>>>> cannot be done during read due to the raw spinlock held my pmu.
>>>>>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_pmu.c       | 47 ++++++++++++++++++++++++++ 
>>>>> +++--
>>>>>   drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
>>>>>   2 files changed, 53 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> index 06a1c72a3838..5b5fe4424aba 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> @@ -7,6 +7,7 @@
>>>>>   #include <linux/device.h>
>>>>>   #include "xe_device.h"
>>>>> +#include "xe_force_wake.h"
>>>>>   #include "xe_gt_idle.h"
>>>>>   #include "xe_guc_engine_activity.h"
>>>>>   #include "xe_hw_engine.h"
>>>>> @@ -102,6 +103,36 @@ static struct xe_hw_engine 
>>>>> *event_to_hwe(struct perf_event *event)
>>>>>       return hwe;
>>>>>   }
>>>>> +static bool is_engine_event(u64 config)
>>>>> +{
>>>>> +    unsigned int event_id = config_to_event_id(config);
>>>>> +
>>>>> +    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>>> +        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>>> +}
>>>>> +
>>>>> +static void event_gt_forcewake(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>>> pmu.base);
>>>>> +    u64 config = event->attr.config;
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    struct xe_gt *gt;
>>>>> +    unsigned int fw_ref;
>>>>> +
>>>>> +    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>>> +    if (!gt || !is_engine_event(config))
>>>>> +        return;
>>>>> +
>>>>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>> +    if (!fw_ref)
>>>>> +        return;
>>>>> +
>>>>> +    if (!pmu->fw_ref)
>>>>> +        pmu->fw_ref = fw_ref;
>>>>> +
>>>>> +    pmu->fw_count++;
>>>>> +}
>>>>> +
>>>>>   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>>>                   unsigned int id)
>>>>>   {
>>>>> @@ -144,6 +175,13 @@ static bool event_param_valid(struct 
>>>>> perf_event *event)
>>>>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>>>>   {
>>>>>       struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>>> pmu.base);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    struct xe_gt *gt;
>>>>> +
>>>>> +    if (pmu->fw_count--) {
>>>>> +        gt = xe_device_get_gt(xe, config_to_gt_id(event- 
>>>>> >attr.config));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>>> +    }
>>>>
>>>>
>>>> Considering that fw->lock will be acquired and released multiple 
>>>> times during the put operation, this might create an overhead.
>>>>
>>>> How about implementing a _put function that can take the number of 
>>>> refcounts to decrement as an input parameter, similar to 
>>>> xe_force_wake_put_many?
>>> Could you give more details on your suggestion? Would put_many just 
>>> decrement the count? But wouldn't that still require a lock? Multiple 
>>> event_destroys can call the function at the same time right?
>>
>> I was thinking about putting all refcounts at the end of last event 
>> destroy in case of multiple pmu's.
>>
>>>
>>>
>>> One thing that can be done is to take forcewake on first count and 
>>> release it when the last event is destroyed in cases of multiple
>>> pmu being used
> 
> Unless there is a measured inefficiency, I would recommend not 
> refcounting this in PMU. If a forcewake is already taken, the code in 
> forcewake_get is just handling increments and not really accessing MMIO, 
> so we should be okay here.
> 
> Also, pmu->fw_count is not required, since the force_wake_get logic 
> should be already handling that. We should just call get and put and 
> this should be good enough.

I added the counting because if forcewake get fails then destroy won't 
know if it has to call xe_force_wake_put (multiple perf opened). If 
there is count and ref set, then can be called based on that.

If we can return -ENOTSUPPORTED if forcewake get fails for engine 
events, then the above will work

Thanks
Riana

> 
> Thanks,
> Umesh
> 
>>
>> This sounds even better.
>>
>>>>
>>>> If the overhead has already been considered and found to be 
>>>> acceptable, I am fine with avoiding unnecessary modifications to 
>>>> this patch.
>>> This is the first rev for this patch. Open to suggestions
>>>
>>> Background for this patch: force_wake is needed to read the timestamp
>>> register required for engine events.Cannot take it while reading the 
>>> register from pmu_read due to a lockdep splat (PROVE_RAW_LOCK_NESTING).
>>>
>>> The suggestion was to take forcewake throughout the duration of event 
>>> being read
>>>
>>> Thanks
>>> Riana
>>>>
>>>>
>>>>>       drm_WARN_ON(&xe->drm, event->parent);
>>>>>       xe_pm_runtime_put(xe);
>>>>> @@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct 
>>>>> perf_event *event)
>>>>>       if (!event->parent) {
>>>>>           drm_dev_get(&xe->drm);
>>>>>           xe_pm_runtime_get(xe);
>>>>> +        event_gt_forcewake(event);
>>>>>           event->destroy = xe_pmu_event_destroy;
>>>>>       }
>>>>>       return 0;
>>>>>   }
>>>>> -static u64 read_engine_events(struct perf_event *event)
>>>>> +static u64 read_engine_events(struct perf_event *event, u64 prev)
>>>>>   {
>>>>>       struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>>> pmu.base);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>>       struct xe_hw_engine *hwe;
>>>>>       u64 val = 0;
>>>>> +    if (!pmu->fw_count)
>>>>> +        return prev;
>>>>> +
>>>>>       hwe = event_to_hwe(event);
>>>>>       if (!hwe)
>>>>>           drm_warn(&xe->drm, "unknown pmu engine\n");
>>>>> @@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct 
>>>>> perf_event *event, u64 prev)
>>>>>           return xe_gt_idle_residency_msec(&gt->gtidle);
>>>>>       case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>       case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>> -        return read_engine_events(event);
>>>>> +        return read_engine_events(event, prev);
>>>>>       }
>>>>>       return 0;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/ 
>>>>> xe/ xe_pmu_types.h
>>>>> index f5ba4d56622c..134b3400b19c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> @@ -30,6 +30,14 @@ struct xe_pmu {
>>>>>        * @name: Name as registered with perf core.
>>>>>        */
>>>>>       const char *name;
>>>>> +    /**
>>>>> +     * @fw_ref: force_wake ref
>>>>> +     */
>>>>> +    unsigned int fw_ref;
>>>>> +    /**
>>>>> +     * @fw_count: force_wake count
>>>>> +     */
>>>>> +    unsigned int fw_count;
>>>>>       /**
>>>>>        * @supported_events: Bitmap of supported events, indexed by 
>>>>> event id
>>>>>        */
>>>>
>>>
>>

