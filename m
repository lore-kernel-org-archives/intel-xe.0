Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC34E83837
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 21:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112F10E3F6;
	Mon, 16 Feb 2026 21:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBV+fb+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD75B10E3F6
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 21:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771277631; x=1802813631;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I0nIzC6qcG+gf2+5MwkyWW4x0VfsTOLHIHvH+uJfhhU=;
 b=kBV+fb+BNNUCLc10W8eDBhgC4B5J2cJokp/ztdRFnvnbYdVQB+wZq4Qr
 VsWwBhjKBAmH9NOQSLh2t9Rpt0HkH1klbn6GMUNkAE8xyibSnU5MSyKjp
 rUU2ZdttNqryq9+HLx8sBlhyiJqG0u67GrCbejGIsE3pie7zKI8P1FeNU
 oaEwkI/2Bd2CIG9CoClT7hlwvoMUSXRtR/IjqBzYwA1rIcRhahC/GA+rK
 TEPDHrtE4qcHINX3d7Ko2mX85lptA3eg2Jxp+KnPL+fH4/Q0nOPYsy/OZ
 fEdVjkrxM/ZruMfW6KWyUCvnXFw2nRlKa9ITPBBXtwEZkxLz4gAWHpYwX Q==;
X-CSE-ConnectionGUID: L69JBZkjSlyQuHGmbZUuNw==
X-CSE-MsgGUID: 5IQ23VAgSDOYfvEaOtWN6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72529663"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72529663"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 13:33:51 -0800
X-CSE-ConnectionGUID: kn2ilUkGQ0ax16Vtv8x88g==
X-CSE-MsgGUID: /zMbEI0hRgu3ZqudASpNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="244295069"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 13:33:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 13:33:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 13:33:49 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 13:33:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hw/Gy2zOJ8Vt2kEVjFXyh30vJ1lNSdnTMOQ8oPZBopgaHZ4LK8m82iOegmOogBqSXGQ0193vtYfq/H8r7RezgJxgM0Vy1HLO068qIvNSJxQ9+2sKiKuH1IrzRtGx1SMIcnayoPJBClQ5dX7Ny8jflT3fmHlwcSxcFbmoRKiahRsRV5tIOjidHqhQyocZpaqguN5k86+l0k5CTJ6Qox3OP1xJdXKqLFTkdTkISH5cowM2Y1V/MYROxUP2FhEKGxBI38dAGVHoTTqCuIGQ05VuC+NMRKm0nAv3gKUnqlqTFXn9E4gUHWH8sq70moONN8g03Okmg6njVRhXwPyaYxKk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1Xz0GAjsOgnc/k8gLCV4vcXDSluhdnzPn7BRJrPanA=;
 b=Vv81AlHOrGsQAUj7rQXqSC25H9JZesr2LV0tr3aa4uY0SCXK+m/lyFfiJ7K96I0ochRq+vf/5WDPDXaIK1GpslG+6Agfnnum4Xf2jCL3bug+IXmCnRwiCOF8YfwztgJ+ahDfQ3R3V0LMNShpHnHRnABdI+XvJjSDirCgRixOKIz4JEGI+NKd9fLQuxraydRoDvvUh/ghCBzkGnXsvKO+63lqRDfKDVr3kHEw0LrQyw9fMNug6hvKjgnSqJPyH86XfHx1mLKwABJx+ebUOyoswWoaTn1b9D+53HuEaO025LMwCDzQxDJrmnjDpBIdheFMEqEMxhR9qz/rc7y52lF2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB8991.namprd11.prod.outlook.com (2603:10b6:208:55e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 21:33:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 21:33:47 +0000
Message-ID: <4ed9ad5e-a3b5-411f-b0c9-cc3dc7df9ccb@intel.com>
Date: Mon, 16 Feb 2026 22:33:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Don't configure VFs if already wedged
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260216172659.520-1-michal.wajdeczko@intel.com>
 <aZNnVJyb7wJcH9nM@black.igk.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aZNnVJyb7wJcH9nM@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 916628c1-c8a4-4131-a6e7-08de6da31167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2d0M2RTSnplc2FhNVV4VlpnVmU4UVhOQ3U3UmtRb3BwcG0yY0hzOHZZd0xp?=
 =?utf-8?B?OGRhMVp2emtwcThIK0FCZWMyVlZ2VTVPMWtkSGZEK1FSSmdianB4SGNWamJ1?=
 =?utf-8?B?OURVc0VYOTJZZlEvVDFISjhIVVFrUkx0OHdUVk83Y3FVQ205NjZGZmRWMWpM?=
 =?utf-8?B?dmtGYlBZNUNxempBYUFtYmtMSHN6TzQzTDFDbk50elMwelJydEZoRnVrN05S?=
 =?utf-8?B?MDJVVkpGWTZ3ajNKcjBMUHhxWllLWnRxM3JxY2MrNWF5VlJFTkttSTRFb0Zv?=
 =?utf-8?B?b2JUY2t6SE50ZG8zeTRoNVorWmY2T2F1ckNVeU14eld6UWkvcFRnY1VjUXRN?=
 =?utf-8?B?WmhFSEFFcW1vdHRvYThZbXRlWnZYRlZCaVo1ckltVGJ5a1o0cWR6TnhhZzVk?=
 =?utf-8?B?elM1dnFUbGNSUHZlM21JaHdFTmdZUHU0ZG1sdC8xYzdHaEhKd25EdythSmFS?=
 =?utf-8?B?QWwxcWhleVJ2bDd0Y0IyVHZMSFdDaDJUWlBkek04VDc3b3FCYmxKb0FibWZm?=
 =?utf-8?B?aDUvMlBwUnJYZ0JxS2F1U1JMV2FUZmt3WWthN3VoZ01ONi92MURpdDAvS05J?=
 =?utf-8?B?N1gyWVJxR0s5RXFWRnlJOTJYWkdoOUNHL2tZSzYyOXhFejJWZStLR0dwdUNY?=
 =?utf-8?B?UHp5bjM1QWVIQjFwL0ZVU1hmbjYvTXFzS2o0NUxkcDBnQ3Zlb2tNRWRRWDcw?=
 =?utf-8?B?UVBaUDZEdXh2N2Q3a3F3ZVp5bFZKQlNoQ3hFQ0xzK0EzK3dqMW16MXh1cnhS?=
 =?utf-8?B?S3dQN2lWQ0ZCNGsrdGFDTEdSZE5WSWxoaElLNGg0ZVV1Nk9vbEw0OHdmSXk5?=
 =?utf-8?B?VDloZ3YyWUpPbzlBRzZMbUNuMjh0bC8vVUZBcXdWdjZjVjQzMzhsNHlUc0xH?=
 =?utf-8?B?WkhER203TUlPYmtYc1FoUzlrRkpQdUVTZnVwMGlOZEYreWttY3NJdFVON2xo?=
 =?utf-8?B?aHdHNWRZdUFvOTdOSEljM0E4N1FuVWY1cHNNYmRmTDdRbDEvdENPV3Q0c0Vl?=
 =?utf-8?B?NzdldXp1a2VaTUVIT3VteWkzaERtMzNpQ1VBbkl4dDVNb2lUM29zNUYxWjg2?=
 =?utf-8?B?emkrOEt3RTByNTcyc04wbGI0MnlDVUhRUG5QNy9nVStudVBwWUhrei9BUjJn?=
 =?utf-8?B?cUlMV294WEQ0bWVXR0ZFVFJveHNrLzJwZWhTRHdncS9tSWFVNTN4bWNXdXBO?=
 =?utf-8?B?eWNrSTVIWUdPVmhkVG9lSmFRVmplVHFwZVVyMTRwcldxTnhRMys2QXlkdi9v?=
 =?utf-8?B?THV3VkI2L1hRK0hPcHNSS2VCVWhSdnlWdEVTZFhxZmltNDB4NzgyNmJIdXAw?=
 =?utf-8?B?L25FN3J2Yy9mK0NHU3VjeW1HSUpuMlM3MGdEZzJhZWpOM3QycEZ5OHdjMmxo?=
 =?utf-8?B?RitFMnhsNDE2bU13d1RMd3p2YmhGZ3NpdjdVN2xGaFNUUk1YYVBzTjBrcjFz?=
 =?utf-8?B?c0c1SGpuMU9ZSUJ4a2JRNUtmajZzREJmbWpNenFWR1AwTnVURTNkUjljTC9D?=
 =?utf-8?B?eE8yL1g5NURVdkEzQ1VtWHd2MFJQMHJReFAwTzFxWGF6QmxXS1AvbVhDZ0Ey?=
 =?utf-8?B?Z2RTME1zVDlIZjcvbGdyeHhQNmZiQWVHdFpCak1xWWtKUVpVWENHZlNlVElL?=
 =?utf-8?B?Sm9STnAyNUZLVGtNRWJLN3p5SVg0eVIrVEpYalk3WGFXVm1LREdaakNlM1Qv?=
 =?utf-8?B?bmdrMlVUOVRIM2pUdXJzWjZ1dUpXUmhWZldOSnpHRVk3cmlWTGVLSllOaVh2?=
 =?utf-8?B?R1d4MHBNdGkxaDAwd0VIZWliQmI3a0tUN2FvQ1hLOW5lZUJWcG1tNTB0TFVu?=
 =?utf-8?B?cVo4anZpTThwUm1IdTVZZGRkN1RCRXA3V1hYa2RqUUl5UWUyNnZSRVJtaUts?=
 =?utf-8?B?aTVNOEs0V28yVzVSTnRJOXN2TFMrU1E5akVxQndhUjJZanUrcElDYS9BWHlD?=
 =?utf-8?B?MjltT05FdFZyWnFnYURpZVF3czJ4Wi9GVkVqbkhJcFkzK0lKZVJMQUpNUmpF?=
 =?utf-8?B?WTZSUS9OWnJ1OXpKSmgvaW1FbzNCZGFRMnc0WWNsaDNmaU52T3A2b1dzdTVo?=
 =?utf-8?B?N3pmK0ZDQWVjVENORjNjTFFRb1RhS1VOMm1CSUpHT1ptZTY4S05GMVNGUHBH?=
 =?utf-8?Q?D7tM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akVIMk1UdUgya1FLdDdlQllFVFd6WHk0ZTNmd1B1UTdWbmtSR0lsb2piUWp5?=
 =?utf-8?B?RzVSS0tzUmhYL245ckRFTnhDUThTTFcyRmdJamplNmZ5RlFFTk9kUzVtNnk5?=
 =?utf-8?B?RWI0RG0vMkxUckszb0NCY3VrdkgyQ2ExdnRnRFAvek1tYmUxU0JLM2ppcEFk?=
 =?utf-8?B?RTNCdE81RUU1TnN5MmRlL3haenhBVnZuamNvRlVacXF6Rks3OFc3K2Z6RGRp?=
 =?utf-8?B?czFSelFaYndtZHFzVnNXYVhwdWxsdkdnVXg2ZG82Z2w5QnY2Y2Q0eU90YWhE?=
 =?utf-8?B?MTZWcDNpMnFVcFU1TWthbjN5SXpBR0Y5YTZ0dGNydmlxMXhZZ0NETjE4ZUVL?=
 =?utf-8?B?K2JwWEduNlpPbVp5NnhsWXNROHk4NFBXbTA4QUExeE96QzlGa2puMzhybW0w?=
 =?utf-8?B?ZE5rWnYrcGEwbVV3WldMNUZrSk9oMEtleDJwUmVRVnF4OWJqOGtWeUd0MVdN?=
 =?utf-8?B?amhXTG82VmU0QVExdzNwMGdxKzBhMEQvVVFBYTd5aFVHRk9lbTU0a2VyWHFP?=
 =?utf-8?B?TVZEM2VuMkVIeVJlOThnbGhOdXM5Zk4yY0VUTDM0RkZPbjE1Umtobmc2eStX?=
 =?utf-8?B?ZFltMkJKTXNSN1J1ck4zdFUrUXc5ZTdManZ2OVlLNi8yTWVFZDJiMGsxbW8z?=
 =?utf-8?B?OEtrRkMraDlhWG1MWlhiR3ZQMVJ2c3ZaWnE4R1pBNXNEVlhTUElxU3pJQk90?=
 =?utf-8?B?UVcyWVlZVGxPbHBVeWVBa2Q0NDlVelBUMTFJbERUajNMZkp6ZjFwNTZKN2Fn?=
 =?utf-8?B?SW41VERTbkI1cWdWODVmOGxWOGNFOWFBUHFUeU5hNlIxOHUvNzJIQ2ZkY3pu?=
 =?utf-8?B?dlJyWDAxQ0FKTFR0T3B1SVlIVjA3ZFhyMnNKcyt4SmMvdUhyUmpDMFpoY3dI?=
 =?utf-8?B?RHlmSjFJcXNKamdZUGZ5OUN5TkN2TitDUjVpcGhaejdEdTF6WmZWazBaRnNO?=
 =?utf-8?B?cTdadE9CdHlldEdmSEJXWVRqKzl2TmtibXVMbytUYzNJbHJvZk12R0F4MkZT?=
 =?utf-8?B?Vk9nN2drelJUMlBuZE9jelFBVU9lelpLbWVNd0RTTVEwU3UvckR5ZHZQVk5O?=
 =?utf-8?B?czRhUVgwWEdUeEVXK0p4ME05cDc5d29BQmk4YXhxMTd5cmZVbDlKeWpjRzB1?=
 =?utf-8?B?SzQwQk01dytWc2w3TXEyR0VCWS91SC94eWJ2L2YyTFdPNURldElLV2MxTUxk?=
 =?utf-8?B?WGRYMjg3ZnFiOEFHT2xTdTIzMzZZdUhrbHdMRTNRcHU2UHpNK0pwbnhNSUZz?=
 =?utf-8?B?MW5VMGdtOUpaeGxLV001TkErV3NOQnZHTnRqSk1tcC9EUVRuNkxRbi82K2pJ?=
 =?utf-8?B?emppd2o3dFlPU082MDEyVnZOd0wwY0JQL2h5a2xERWdtaHk3ZHFmbG5pdzlm?=
 =?utf-8?B?UFJOYzR4RWpRd3RNVERFK0hVb3VFK251RnpPVU1qU2pIYjV4YmNaOUpZSnNk?=
 =?utf-8?B?eTRyNjdIVGR0bWM1TXR3dmM2cmIwRUErUnUySXkwTjhJUjNldWxaa2xQbmhY?=
 =?utf-8?B?Q1dGOS9rcnNndUZseGVHaFRUc0RwMjloR2Y3WmIrak9SNndLUTVuTkxUNlhX?=
 =?utf-8?B?SG9aeFNkTnRoS1lMVDBHblBBb1c1ZWxqRzVIL0ZQNjhCM1lyTUUxMjNjWVV6?=
 =?utf-8?B?OG9TTFRZV1pBUW0xSG5TdWJqSmF2Ykxwd0JPeTVIZzJIRk1ib0lHVmdpVVZH?=
 =?utf-8?B?Z1kwakJZMGlUMitQTUt3dllyUEkva1c5Mi9mL1M1SVp2WExNZStiSUlEWHc3?=
 =?utf-8?B?TUVoQTVaSTZrYkdHOVo2Z1QvVUR5ZW5qSTNEckR4aXBjUStxbUNZQXd5TGdW?=
 =?utf-8?B?NEp5ZFdYajk5ZmJGK2paS1M3dzZGckMrREpDdlRrdmh3T3N1dENoN0YwYkhi?=
 =?utf-8?B?TklEM28xenFZNitZZVRRRnpscWVYRUo1VmM0eGh3VnFsRmpQOGZlMXpNNnVj?=
 =?utf-8?B?QmdTNWRiSmUyaWhNMFhOamg1OXg1MitsZU1DOGh1TXBVck5TWVdCR01oSEl0?=
 =?utf-8?B?R0tYam5YSklCclF3R2p4a2hwaElWbTF5bUZUbEZIRGFxTTJaTFRMeGxJUjZQ?=
 =?utf-8?B?ZGpBZVhLKzdxSVpvT2JmN2ZOQXFEVUxNcEtzZFM2ak95bXBidnppZEJYUTB4?=
 =?utf-8?B?VnRMK2pRWXYyY09GQmJiSmxkZ1JJdGZNdnN5cGNQU3c2T3BySzl4bk9XNG05?=
 =?utf-8?B?M25TOXl0TlpKUThYemVabFZweDhxaGVKTzRzRnhPN2laUWtRRG9KdlR1K3Zu?=
 =?utf-8?B?TnF0S2NCK2NCUnpiL21iSVFQdCtZVmZIT1Q5ZEl1dVJxNGRkRnRvK3A5dmNG?=
 =?utf-8?B?UUFZQ2V0VTZTbW5JdHZCMS95MmwwZlI2VUZwelRnbmQzVmV2RmRaa1lvcjdE?=
 =?utf-8?Q?3eqyod7WLAMLCizA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 916628c1-c8a4-4131-a6e7-08de6da31167
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 21:33:47.4385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a91BRCbDjGrCrGknaH4etD9ygfKjYht7cPyJWCnYa7tZc/R5P3ANAy/JMMURSHioKs+hl3r0oSJhQphBZBKgpvpU/tQIoTUczTMicN925+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8991
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



On 2/16/2026 7:52 PM, Raag Jadav wrote:
> On Mon, Feb 16, 2026 at 06:26:59PM +0100, Michal Wajdeczko wrote:
>> If driver has already declared device being in the wedged state,
>> there is no point in attempting to enable or disable VFs.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci_sriov.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index 3fd22034f03e..ddc081f55657 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -232,6 +232,9 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>>  	if (num_vfs && pci_num_vf(pdev))
>>  		return -EBUSY;
>>  
>> +	if (xe_device_wedged(xe))
>> +		return -EHOSTDOWN;
> 
> I thought -EHOSTDOWN was used in client/server world. Rather make it
> consistent with ioctl returns? i.e. -ECANCELED.

I just realized that I already did that in other place ;)

    160 int xe_sriov_pf_wait_ready(struct xe_device *xe)
    161 {
    162         struct xe_gt *gt;
    163         unsigned int id;
    164         int err;
    165
    166         if (xe_device_wedged(xe))
    167                 return -ECANCELED;

> 
> Raag
> 
>>  	guard(xe_pm_runtime)(xe);
>>  	if (num_vfs > 0)
>>  		return pf_enable_vfs(xe, num_vfs);
>> -- 
>> 2.47.1
>>

