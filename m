Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABB7C3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 18:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB03810E708;
	Tue, 25 Jun 2024 18:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rgh70d50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B8410E189
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719338486; x=1750874486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PjuMOnf6oaWthOaixJtVoegoCHEXWKM+NkPktiBxMBg=;
 b=Rgh70d503P4+qjoDjMZdNwuyvWL2bIP6Q8ARqB/fSns9mJmYZ/0DyYTk
 wArRU6SEgOYHTbBi2cARqIk8NSIAUyM67D+MEfYnux8mK2eVMEdnsUjwK
 H0KRII5ubV8DJCJbFrnNfBQDlOmVtpjfHRZo268x84APtSdeZH4JepE2X
 QrHF/c7dX9YUpP+kMe+CJnAghzEqVUWeP3+pV6nDY+l/jTVxcs9V1sWHI
 LW9Z/yHPgYXXrbGy50OMIP6Aj6MlUvs9DxfvftjwBjJjWdrKl5QP79KRJ
 RTALJ+aB5+K3AmMfJ7lI5x34MkYDDqQA6TuXigywKYao55q0HN7rFxxRH A==;
X-CSE-ConnectionGUID: SJBdJUVoRyi+p63qUSQmcQ==
X-CSE-MsgGUID: JDF+nufoRx2hzBtOdZzPyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27516460"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="27516460"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 11:01:25 -0700
X-CSE-ConnectionGUID: CrYETOrfSymWS7hVGo+o+Q==
X-CSE-MsgGUID: IL1v22uATDaCvzP0iae3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="81264333"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 11:01:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 11:01:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 11:01:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 11:01:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 11:01:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6Cyc1w31oZSbVRzyZcIUALCOUuv16vsugXufmsWYgufvSBLFWmax0qBf89zCf+iob+6k8OGvPfs2Aed5KKwRepqSSfI+qVcNp9Pn6ayI/gRc5pgnxgNw8jbqYA4VAVEceLfGESEcKfC1hmWcaDF5oRdpaJlM/iVXAG8ypYd6GBCh0KYcCz+O6DIestSeinlUUxb2eJ/Tqez8E/tzLmJqbjFtMhTTxUly79Io6ma2t6alh1iahGESGCQpwkfRjEa4mUS+klnYRtGk4KKey18O9YrS+0vEIyYIC4sa2ShRnndXYSm65RJYXNJgWkxQDdEqQqRNCps9g/76ElITpLH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ntd7S/xDIKF/IrhpYKFmNCaNrB5nxnNlyA88SRtyQ0=;
 b=UbmOdMqq+r9+TrArce8or50aG4PFgvoo1Begq40LFekMKueUxq4AKckt9W9+CvxIQBmM8+iwcKf3LxJKNiUUprCfSyxb5oqhq9IcRLhYy14Gubk8WMtZLSfC3C9NBU2v3Zh5r+z3PjE1CeGSlFxN3/1rVt19qMu08HU6nZ0RrFfw/q2lac+SsB5/ivYsVYrK5FyWDr0/xrskHPnZDPt8lEOrLZo4dl+6IF+YFKyi9VFEBdNHXziHiACCr/lu3Ayl3hn9tIeq9bJcUqxXD2tg/UefxvKD7pCy/WLteD1AKo3IXbQoqqf3blzrmTFNwQ3sl+q3lEP3owPAkNdK4g9T+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Tue, 25 Jun
 2024 18:01:18 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 18:01:18 +0000
Message-ID: <dee9dcb9-7935-4f8e-a92e-6ad53bde9294@intel.com>
Date: Tue, 25 Jun 2024 11:01:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Skip attempt to start GuC PC if VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20240622094253.1081-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240622094253.1081-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::15) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: dd435f36-be4f-461f-6a5f-08dc9540d018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHpSQWpMb0Y5aFEyQTZQK2NlSGp6ZDJkeDVIejVRM0dVVUhDT0trUlpwV3Ru?=
 =?utf-8?B?cEFyOHZsODR3WlRON1czcE9yYitqeFJWQmxqbDJqZnRIbUVPYTNORnFXclUr?=
 =?utf-8?B?OHg5T01sdEo0V2Y0UlZsYVFvelZmdWl3azVTZEt0d2xmcWoyYm9aOFcwRW5Y?=
 =?utf-8?B?YkVTUmVZTmNPMjRKZHNmYUlkbVlmdW9WSGRFd2xUYkZzVndVM2ZKOGM0RGNC?=
 =?utf-8?B?Qld4aTBHcThtTUxEM3ZXMFFxYTZ0eUZCSC8zWjdzenpRREk5VmtRcllRN2cy?=
 =?utf-8?B?cWE0bzVucVpJMzlYcDhZbUZLMXZ1UXIrNXdYUG1MOHd2aXNFc1N0bmtNWkdy?=
 =?utf-8?B?MHk2R3lTVXF5VmR2ZTg5QUt3c2lQOVlicnpUT1piYWRWSUR0Z0gweUNiejZx?=
 =?utf-8?B?aGxjWmRLL3l6TTVZOWtKVDhwOWVRdTFlMHc4ZHk5UkFNY2k3MnkzYjQxZ1F6?=
 =?utf-8?B?VFhxNFdUYUZDMGdRN09vNmJ0WmZ3djVGczR2c0JsckFadzBQdzNURE0yaGRP?=
 =?utf-8?B?bFRhQXZrV3BvY3FaYU8xc2hxUW94by8ydjBIdXJlaUJCMzlDb0JCV2tUa1ZR?=
 =?utf-8?B?bXNpTzZjZFpaeWhhT0NWR3JLOW1aRFpSdE1TNWNVdmlyNUZJWlA2aHk2Uk5i?=
 =?utf-8?B?WnVvNHlHaWhuSnNxaVErRHpwUEdybUN3bDFYaEhGekdSVGVVL3AzelJGT2lB?=
 =?utf-8?B?MXBDbDQxblNhWmx6S0ljWDJxSGRHZTZhQkVyL1diZVp3bnFGUUkvd1FEQ3Jp?=
 =?utf-8?B?U3V5Qzk5V0kvS3JYZG5tTnI1cE9SNll3MmxNbFBtMDFJclFQNk9ESzVVTXdN?=
 =?utf-8?B?V2tLWnlNWGxwbzVoeHJTZTRhMjNXSnpSbHBMRFZVMVVpMGlmaEp2L1JkRjNL?=
 =?utf-8?B?SlRUbWNCQndjeWZ5UDRhSElXcUExUjBUd1pteTNWdmNuWFFnQlBRVmtUUitE?=
 =?utf-8?B?OFA3QkIvQk55UDJSNlNpM296c1ZodjZ5V3kva0crNXNmM3NZZ0t1OFVLajhB?=
 =?utf-8?B?RGVzazhDSnNGcWtyT09IZEV1Mm4xVWx5eVRNa1phK3lBckgzWEFWaERMaElY?=
 =?utf-8?B?bEtkbVliR3ExRGRWd3JOd2lwQkhhOEw2RGoyaXk3MXlwWXY4dkYrTm5sVDhm?=
 =?utf-8?B?UFlMZ2htdmhGcmxmR0cvYTRtZTVlWlBxbXNZdmdqRjJ4SFFqdzRXcENEeXFj?=
 =?utf-8?B?ZGJobVFVWi9pOFozUEhvZ0YvVHdqWXBEQ1BhZGg5SlZHRkUrOVljT1JVQktF?=
 =?utf-8?B?a0M0QWRMRFU4OUdxSkZZUEMzeTE5dFYwS0JxRWlVV2ZXejJnSHNORjhtcHV1?=
 =?utf-8?B?bndncVR5TmFjTi94TlYrM2k1WnVtajNWcjZpRi8zYU4wZzY2L1lQRGZTMlQ2?=
 =?utf-8?B?NEZ6bTNCRys4QVYzekhTWFhqT293MThSdkJLVDJsN2ZmVlNUZEVGQ29BcUs3?=
 =?utf-8?B?MVZDRjRQTmdZWjZlejA0ei9hUHdKTVNvS3FlRnFMM1VjZmRIUDlxOExUMUtZ?=
 =?utf-8?B?b3hzMFJPSmIwQW9mZ3N2ODhLVk40TitHNk8yWThkd09oTUkyNms0VVZZc1lG?=
 =?utf-8?B?SCtwenh2c01SRHRVSXdzRzF4M2NNbWp1V29xYWZMZitjV2dXZG9JcXEyamlx?=
 =?utf-8?B?d0lSa1RzemQ2TDYrTWphUXJIeUt4QjB1VGtVNU1UVGpqMTlzSzh4YzRGYlZn?=
 =?utf-8?B?TXNzcVlaTjdlaThmdHVqUDBaYUVPY3IvTFFuNzl4SmoxOVkybU1NcjE1elZF?=
 =?utf-8?Q?eyD2OUG/a9S8Km5myv3C3Pw9zB9DeSWfjm52In6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2w0b3RZcHVqRWNvU295T2ZxUnhVQVd1dDRNZVZRampNM1lseWZXM21GZHRQ?=
 =?utf-8?B?V2MxbVMwWmp0WjJ0TXBMcmtLRm4wc09RaTJPbzNNYTlxMVZ6MFVlN2JkdkFq?=
 =?utf-8?B?VnpCMXp2RDZ2ZGN2NXZidzNxVE9YMForZENQWllVQTdwa0hnaDFFTTNnK2xF?=
 =?utf-8?B?czVHUWlLQVBQKzZxejB5UGRxSHRJRVduMlBkT1FUc1QzdzJ2bUVSek5kVE1F?=
 =?utf-8?B?VFJCNGx4R3hzWlRoWXdUYTgwV1JUVTMwL2xxNTRzWFNxdTM2bFZWUllXY1kw?=
 =?utf-8?B?cHo5dDgyN0NSMEtyVmJ0ZzRZRWphbjVaYTVtVUFUZGdiL2dvSlpCMUsxYTln?=
 =?utf-8?B?WUliRWJUVGZ3VGh1WEFORFpzY0V3b3NpZDdpYWhoS3JnSkJrQUJNWTl0T2p4?=
 =?utf-8?B?RWpMWGdId24vdE5pTlhIWWE5dWN5eVJ3M1lqczkxUmFaVTQrTlEyeU1iMktY?=
 =?utf-8?B?b1V3bTM0TVlXN2tyN2crTVZMMlZqY203Q1JGMkRkSzFWMFdsL285R2dpTTIr?=
 =?utf-8?B?WEtjdnVjQTRoYmlNZlR0cnRwK2JuMS9HaFpUMzN1YjdxWXp1cG5nZlE5VlZ4?=
 =?utf-8?B?NStlVUR2YUJVdVV6c3NHNUVIU28zV3d6bW02enUyRGY5dDFTZ1VwQnB1Rm5j?=
 =?utf-8?B?WDB2bHF0RThIYmpTSnArVzBrVUVOdWlzZW45aXRGRUp2TjB4bDJ2Z3BkbSs4?=
 =?utf-8?B?WXRJckhJMEtVVGdVY2dIRm1RVW5NWWpaRmNscFZTSG1qYXFSNWM2aTd1RFVI?=
 =?utf-8?B?d3MyK283Z1UvRXhidGoyN0pNTCt3SlpkandXMUtyME9CNDJ6WFB4YUF6dHV3?=
 =?utf-8?B?Yzdac0h6RFU2cXorNnk1cEVnWW42TnY0ZUl1d3luVXdNWFFVM0xJN3JZMzhQ?=
 =?utf-8?B?VjN0cnVkVStSMlpsNVRXb2w4d1luS2E2NnE0YjFyc0RqNmZwcXdrcGhTMVow?=
 =?utf-8?B?ZW5LVjZLU0d0NW9GelhxQk5ZMGFhQlhWOG1jYVNKUVZ5aW1GVng4MHV5bEts?=
 =?utf-8?B?R28xb2Mwc1l3R09qQkMvbHlhT1BCbjV3NE5FMFNRRDVZU0poVVc0dy9mbEJO?=
 =?utf-8?B?Skx1T3hyQ1VYc1JiVmlOU1I2b0I0SnhDZVhPQWt0OXIvcjBmdGc5WUhmRG1B?=
 =?utf-8?B?ZE9JN05WMSs5cFFCMWJkZTlsMS9DN045VUhRV0pPZkRFaTYwUC9IYy9vT3VJ?=
 =?utf-8?B?SjBubG9rUWhobmZIbUlyNEN4WStqRGUyWFlQYWk1UnJHNWRPWlhvYzNaajR2?=
 =?utf-8?B?RWJ5Q1ZEUmJKMFI0aXJOL1dpeEU4aVZ6bnVNZzk3Ri9PWGV5NTdZRjBvbU9D?=
 =?utf-8?B?SGhHZ2U1bGNpL2dwcjRkd3EvRisxbHd1dUp6ZTJ4bEs3N1ZldTRWRVlDNEtv?=
 =?utf-8?B?bE1UNWxaS0FQSCt1eUR5VU45SWtyVlRUU2tQYktEZzZGM2IxdkhCR0FHbWVL?=
 =?utf-8?B?emFSMVNRSE5LTXhDT2NPdjJFSlNUaGw1Ni9QS3B5alA1K2xRMWVaaStlOXFk?=
 =?utf-8?B?b1U5d081WU91VmJsakRYNnlMMHE1SGRuRnV5eGllUVBOVGttOGJYSk83cUo1?=
 =?utf-8?B?UTRZdSthWFJGb2krZWtMZDVheVJ4cmNLSjBjWnRuMWV4RE82cGdZM2s1UjdF?=
 =?utf-8?B?QkVNK3ZKblRLc29xSmVjZzBRdWxTVnphaytWWWgyeDBrK2JzbEFvU0cvdUZ0?=
 =?utf-8?B?M0tuUUh2RDhOTS9hWWxMM3NHaisyRmhPSVhwT3BYZDFYTzl0R2RBZ0hJTHox?=
 =?utf-8?B?Y2RueEpIdXNXSU1hR2VIQVZUYVdSdDY4VFJ5OXV4dHpHdHltSm4wV2ZvcmZV?=
 =?utf-8?B?aEZ1R0NxQURBWUNVNFBaSXpjRXFrVWZlaTdoSkVyV0ZoMmlKaHhHQzFkUjBi?=
 =?utf-8?B?c1ZXWkZEQUI3T0o2ZWhrMkZKdXUzVkRRcXVTeDA3cjhMWW82bXZHZktvT29S?=
 =?utf-8?B?eDc4Y00yOG1NOUJKYlhFRmNyQ09MeWs4MFdlKy9weG5Ub2lRcU9rbUUydVoz?=
 =?utf-8?B?ZERjY1dJbWladzIwMDBxSVlkS3dSVVpWOGJTOEtyd0IrUk5yaFBXbVdpWWhq?=
 =?utf-8?B?OHFkdzNhUHNYbWFuOC8rTVBkMDNaQXlzMENVN0hmS0ROS3VDZm90Y2tJZ0tk?=
 =?utf-8?B?TjZiMXdHVk9YV2ZOd0Z3OENwVFp4WWZWQXZlUitGZWZpaWlpTFNCUHNQakdI?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd435f36-be4f-461f-6a5f-08dc9540d018
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 18:01:18.2973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3lpZ/RE8Y8fsHmp9R5uusTRu7qawHDgQWZ+iXy/sXsCgOAoK8e+yjNhZ+oHfY+ixIYla/aVsP7vHl7TdI1jEY3XqRuPo1qsL7qGXvRayHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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


On 6/22/2024 2:42 AM, Michal Wajdeczko wrote:
> We have already marked the GuC PC feature as not applicable for
> VF devices, but we missed the fact that there may be still some
> privileged activities performed by this component, who does much
> more than its name suggests.
>
> Explicitly skip xe_guc_pc_start() if running as a VF driver and
> use a GT oriented message to report any error.
>
> v2: also skip xe_guc_pc_stop (Vinay)

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 172b65a50e31..eb655cee19f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1113,7 +1113,13 @@ void xe_guc_reset_wait(struct xe_guc *guc)
>   
>   void xe_guc_stop_prepare(struct xe_guc *guc)
>   {
> -	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
> +	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
> +		int err;
> +
> +		err = xe_guc_pc_stop(&guc->pc);
> +		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
> +			   ERR_PTR(err));
> +	}
>   }
>   
>   void xe_guc_stop(struct xe_guc *guc)
> @@ -1125,10 +1131,13 @@ void xe_guc_stop(struct xe_guc *guc)
>   
>   int xe_guc_start(struct xe_guc *guc)
>   {
> -	int ret;
> +	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
> +		int err;
>   
> -	ret = xe_guc_pc_start(&guc->pc);
> -	XE_WARN_ON(ret);
> +		err = xe_guc_pc_start(&guc->pc);
> +		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
> +			   ERR_PTR(err));
> +	}
>   
>   	return xe_guc_submit_start(guc);
>   }
