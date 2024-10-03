Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC38CF8573
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 09:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD110E090;
	Thu,  3 Oct 2024 09:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdjMcQnt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8834910E090
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727949268; x=1759485268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yXgGvaG+xBSzAn7H8/6YgEMz/+vgmmCIN584w0nTgWM=;
 b=AdjMcQntBbUNX78UK0w5QdfBHUioQLZk3J/1xAQjVMbr7IV0TWQYSeaD
 fLNFrOY+rZEiVqqdquibggVasEt8ANfPCnGRob8j0kuvdtbmNOSn4oiIJ
 v96kMWXUyi36q4cI5ZnL4z++95/GAjGCjld1hvyoRa27hVtqGu1NOKCG0
 ksxv75X/RbHf4Uqg2CDeN5jKaeHL07sg9sa3LZW0868YJNxTgLw02Y2o9
 UqncFwjjbYh8F+5bu+BgWrdaNLqHYq/4Vb9nUW3rWO5NGFeJ6PBToOAZL
 RUv+wvyK8cW1nc+eKYg0kZzyOabz2EBMrq6lwvvCbm8ozldNkKdGGYNOR Q==;
X-CSE-ConnectionGUID: tQXzJbyGRfGM6OHs8wBoPg==
X-CSE-MsgGUID: djTZ44+MT/ij8P71irslJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27022780"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27022780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:54:28 -0700
X-CSE-ConnectionGUID: f7N2A8R8S7mV7SYi6Xcaow==
X-CSE-MsgGUID: vDceI/kWQSGGgZf9FbXB4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="78715446"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 02:54:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 02:54:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 02:54:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 02:54:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 02:54:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 02:54:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3G4z/Ts5CefQEifwfib4fIy9NjzQx1r7NqI6PcOqNIWi15VbU1hUwsiFclhmXVG+uqn37nNdvkX8UDZGj1Ij+6gZzMCinDgmDpWuDRxgrQP5oLTSh2uupyvELfpL2Nu10ITxLsvtmN2Z6iNOd9fucg6Ak1/eLbDGksZkVBQ32eyNPyb+jVvrUixwUJzVzExVedIBDb1uTh+w1Dpnj4LRWz+1tx58lJmP7lEijISKKAN4sW5xcAmliFYoESufdGJbwxDz0Wo5SsW8S+HJIU4K6YxQIjK98pH04gvVK4WWddTv0Id2i9On0Knp2E0m6YrMlPm+MtiG7E7R2oyQuCKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/f9IFnwjm8rAKJiCdWvLWrm+GeFixgeU4bPzQFemXw=;
 b=VSdo5H7/mnV49PC3afbfYlH85alCQSoJU5rJijMpicmlnpfAJPk/SUI4rcEu+8wY3de4lBc8a93Rpuo2p4ZMgzQLOjxr951TRN5iP4B3NbnM7eeNVs9/lgn/8dAxQprKGrRyHwZxDVO6Cf64aIDicSvHQi/gaaMrVJ1L8gWw2AhyVQoTqR+0JDYIkqTJAOo7VIA03CMUPsssezcsymqL5zSLJ4FwMdqiSrvG9sPlo4CVE5qe9QtZLeVXcOumQe9wiM6y821Teu3h3Rpo8c6p9ZE+PTGSP+gWEf9JidHwns5B2waAV5yykekyFHrIDldkRyqsyvt0vYeUZzI8ewHBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 09:54:19 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 09:54:19 +0000
Message-ID: <ab52e413-3dc4-494c-b50c-5456c81502eb@intel.com>
Date: Thu, 3 Oct 2024 15:24:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h
 resp times out
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <vinay.belgaumkar@intel.com>,
 <vivi.rodrigo@intel.com>
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
 <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
 <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
 <Zv1S++mT0UuQEFNZ@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Zv1S++mT0UuQEFNZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d06e24a-b4c5-4d2c-2c6f-08dce391597d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REJZYWRnekZHOTc3c3BTNFNuclRtREswMTY1SEZEaldYL3FyT2Q0WStTVE8y?=
 =?utf-8?B?ck5lSFVoN1VMenFud01MN3JlbmkxVC9vZ2NYNm1pTDIrWS9DaGFJQVJyc0o3?=
 =?utf-8?B?d0gyY0l1M1JMUExyU2FXN3NRWGxvOHlmZDZsbDZaRHZDYWZ6b2dZWC9ybHVM?=
 =?utf-8?B?WnVkVm9lR2JadC9OUk5qYWowOGZXRlYrL1NRKzhvK2ZiVDFNbG1qdXZkMWd0?=
 =?utf-8?B?d1MrdC9VUnN3aXhWUm8zR2ExdkY4aTAzcnM1Umo1WUFrVnJUSzE3YjBjWnFn?=
 =?utf-8?B?RjBSSmhaVTVQcVB4bGxZQ2lwRkFFTnNCTVFZRS8vOVJaTUJTZ2lwYVJXTVhx?=
 =?utf-8?B?VnoxbzgrSmthU0VQS1lvVmVBMWFDWHR4KzJtenQrMVdzUm9rVUI3UG9KeUtP?=
 =?utf-8?B?WjRmN1g4MG5sdGVjRU5ONmU4aEhWUm02eHVvaWZRTDBWYlM0T3RGSmJSSU00?=
 =?utf-8?B?YlR4MC9Xa1I3ZENldlZoM2M2K0ZBM3RiTEhZTEFTV1VPQXVHMW9HMGNNSFNj?=
 =?utf-8?B?U1FoR3VqZ3BzbWVpWlRXNlBkQXNicUYzTU44MEVlTksvSlV3a3lzSmhXOWUz?=
 =?utf-8?B?U0hvMzNxdW04QmxnemhJMUdlNVhZQUlCeXpRZXRYa3JNM2xyYlF0L1VyNkVo?=
 =?utf-8?B?cUgycHpJYXVmVW93NnBsQmRQTDl5VjVmc0JhVFFJUzEwOXpVMTE5cnFWSHRj?=
 =?utf-8?B?c2hOOW9aYmxiRi9VRFFHUjFtWVBxRkJkcFJkL3JqTjF6OUx2T3pLZ1RKVWp1?=
 =?utf-8?B?OHgrMG9LQXNFazY3eVJSWmdrNWcxbVVNeXRpc3hYYWpZenJvYlp4SmRHVUtJ?=
 =?utf-8?B?bHBmWFlYcGcrQUt5QXVXTHhpV0N6dE84aEFmUUdwRHJnbXFSdHpFWE9sdGRt?=
 =?utf-8?B?cStSSWNBTFUrWDhBSHJJc2hMbDlyWkNjclpmcGRhdHA3c0JpRTBjWWRqNlQ3?=
 =?utf-8?B?SHFPWFlGenBHZjcyMDZ0TUdBdHVqU2NjUzBmSFZ5aTQ3Yk5KOE9uaWpYQWdO?=
 =?utf-8?B?YmFOL211anZaUlhSU0dXZEJZVGVjN1lxaFpEN3pOUWhXMmhPb0hrUE95QmMy?=
 =?utf-8?B?VXlMWUZRQitRZ0M3M2hWZHRlOUg5UDZ1TzhCaWFQK2xsWDNIM1Z6K1N5bmNl?=
 =?utf-8?B?UUFEN25LbGRVeTFrM3lqVk9hSm1XTCtBV0xmY21lcmhzWjgxWUwxOEJzSC81?=
 =?utf-8?B?aHZ5ZHNyMzlmcW55NDlqNE1tbk1DNE8yaGZDWVNKTXduQitnS09LRHRrQ0Qx?=
 =?utf-8?B?NUh0bFdmSEVqOWFySjZHcmhHNmMyM3RMZ0pha1htYlhrbmtDd0NsdlFaQnlO?=
 =?utf-8?B?SGoyVDdtaW44ZUVoSUc1QmpPYk5rcXVld2cwckoyeUt5Z2tOem10RUd4cmE0?=
 =?utf-8?B?VmhBTEtNTjhsdjJYTVk2Q3NhM0J5WG9HUlZYR0ZGbG94TFpaSjRvcVkwbjhM?=
 =?utf-8?B?cExoRnpyR0NBNXRldGpnNHBzNGN0TXEzcHBiK0FTTVJHb2pIcEJ0dnE3WW8r?=
 =?utf-8?B?Wk8rd0pQSFh3R011UWMxbHN5WGxmWlZzczN0M3pZSU1FQmxwdWxyY2hqTHpa?=
 =?utf-8?B?aWJWbStmaWUzck8zSmdYYlF0bVorUmFhSWRoSzRVbU1LQmZ2WE5vUjhsS0Vj?=
 =?utf-8?Q?nzBmCEi9MTPk/3mfRqSMIZj58fwAU1DTVmL0uR/h+A48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1FRdUtFWHQrMWFVMkE1elZ3ejVYNmkyZTZGRFM5QVpLZnFnM3czODQ2d1Zk?=
 =?utf-8?B?VHpPQkNFL3BtTldTN1doVDFvOEdqSnpmVXN2dUYzdmhMZ29lRVJ4cDBiZmk2?=
 =?utf-8?B?Q2hnczh5Q1YwTmc4REpYSW5zOXlMOGF2VVJ5M25hN0lCYmRQT25PSW1uZDE1?=
 =?utf-8?B?ZThnblFsYUVaZ0ZpVldQVWJaeDRqdU1nUWgyYnZnSTB1K0l3dFpvWFZuVEtY?=
 =?utf-8?B?RytFd2k3bElOclZMcTNGc1Zja2oyaFNKMndaNlZ6bk11SEo4TE5mTFVIQWdL?=
 =?utf-8?B?N1p0Qi9qN0pxRWs1SlVKejYzT25SdjU2TzJaR21sUVdtTjlCYm4xVjN0blh1?=
 =?utf-8?B?MysvcXFmWmpXSUVFdnZ3QThiS0UvcFhmakdDOUp5YkdzM0U3dmxBSHdCTEtk?=
 =?utf-8?B?RzdnS0FOVFlkZ2hIUjFkbC8vbkxoc3lSU2dTSFh1WEowREZpOWRHNmxVdUZM?=
 =?utf-8?B?M2ZHdVk3OFo1eU9tdlNHcmYwVGVqUERNZzdqRTJteHoxcUJVSm9ZUXhMRWlz?=
 =?utf-8?B?aVFzYVh0cWR3MmdxeURoWUlaRE9QUFpCSkpJM1d0anNMY29jbldzNkxyTjFZ?=
 =?utf-8?B?eDRWOHBiUlNFY0ZjSXlnUTN4YXBPbkdiSmpRQUMwemtxOXA0ZG1jVVhHVUQr?=
 =?utf-8?B?SDRiN090R08xLzRPbWxGdVhwcFlsYzZLQjNnbmFqYW1pOENsSlFaU1l3TkQ2?=
 =?utf-8?B?ZGpUeGhwSnhIVWZRelRIZDdWQzZlVUtNUEp3aTNQNlF6NFlMczhnMUlPUUVp?=
 =?utf-8?B?T01rcFlUWktTRDhVajJ3bHpUcGI2MUJIVC9QYjlyN0FjdW04c2IrTEdiK014?=
 =?utf-8?B?UWZESjFuZ2VWVm80cFkvQXlOZXF4YzdzZHFuY1FlN1VjYXd0MUVuaXRlTmo4?=
 =?utf-8?B?VktoVTAraTRCUm9XMmtvKy9XZEZvcTRQRVhSMk1tNEFMNkRnbGw4ZmRQR1Rw?=
 =?utf-8?B?cDN3bVE3ckRFWXQySVdvaGJvTkd4U1AzTTVXdWNteU1WK1d3QU9sK29TNFJI?=
 =?utf-8?B?M3prY0QzMHZzWGZmQTlXSlAwNVl1akxjZWhIeStpUkk0d1lBZTVoYm14cmFC?=
 =?utf-8?B?NjRkdWpUSTRpejVUL05QM0g4a3lMV28wUm4xN1NvQXJXZGw2UVRPS0dhOTY2?=
 =?utf-8?B?ZVBSS1lCMFl6elFGRlpGOCtpbzJGek1nMTZuZFBXTVhRUy9mTC9oWHI1NEdJ?=
 =?utf-8?B?a0gvbFE4MzhMZytzMjV6S2NZVy9ubi9mZ0VFYVBkSEdNOTRxOFVqczNzZVJl?=
 =?utf-8?B?cE1CVEY3TlgrblZwYzJkVlhxRk1uNmthbG5JYTdRR0ZCcktzd0hDdTJGTmxY?=
 =?utf-8?B?K0RlNEZGU2NVb3hPcURqYm1uSGhwN20rVHpVMkdRTTNFTWEyTE54R29TNTE5?=
 =?utf-8?B?RU5KdWZZMktCK0RDZndoUndITkZkZjQrbDdMa1MxaVA2c3orNnkrcEV6MGhF?=
 =?utf-8?B?clhSNVgxTTFianJaTWZHNnE5TzNYQ3k5SjJnZlFLYklheTFJOGdkSHhVWkxT?=
 =?utf-8?B?UFFvQTl3UTFnUkJ2TkxycStIdjFEVk5OTE5MSVIyNllidmxDVFlEQjFzOEZC?=
 =?utf-8?B?eGEwRER5bmJVOTZwM0ZuQkN2R0VXL2ZnRmxKRUxZL2NPSnBmRHBjamFjVUR5?=
 =?utf-8?B?NFFlWE9Dd3ljejlhbmlMMjZNZkxuZU9LSzFodWNhQWdBa29JWjkyenZ4SUxY?=
 =?utf-8?B?c2ZsbFZvcnFrU2ovMXBSdWZBUHVRaGM2cHpNZThMM1BSOS9FTjJNNmw5NHcv?=
 =?utf-8?B?N1V2S3JTTlpzRkR6RTRJZkErM2xSQ1IzMHU1Q0dKYng2ckFiZHoxZ2YwZDdn?=
 =?utf-8?B?SlYrdWszUG0vN3dGRytwRXhhODNRbDdld0Y4QTE4RndiOStUUlF4RHFxeUls?=
 =?utf-8?B?SEhVWjBNaXFQYmU4QjJHbDg0dk5GeUNGQ0g4NitvbHJlSXJ5ejFUS2tiL0xq?=
 =?utf-8?B?NFA3TXFFWmF2c2pJTWFqUGxLYXBSTDVScUY1eUlTQ0xHM242blc5RVdUaVgy?=
 =?utf-8?B?M0ZhZHBka0o5c2pHMGNPQzdpNUFUWXlocDFwY1Jwdm94azEzK25rYmtPV2Mw?=
 =?utf-8?B?NHlNYW4yUzJrbGRVM3VtTVJGa3Q3NkE1d3JnaS9yTGpZK1Z4Vmk1S2lJWDVZ?=
 =?utf-8?B?L0l3N2FSOCtlRmY1TUgwRnFyRDZ3dEpzbE9KUm90MzRwb01Ecm5RR3M5a05X?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d06e24a-b4c5-4d2c-2c6f-08dce391597d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 09:54:19.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0Qb7xjUMD8ykOXN0/sNyrehaL2yorYiBYR9LfsC6BapKpAl7pTcUEo1bfw7lJFmc4/06JcoBm4zEj9V4lGnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
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



On 02-10-2024 19:34, Matthew Brost wrote:
> On Tue, Oct 01, 2024 at 01:41:15PM +0530, Nilawar, Badal wrote:
>>
>>
>> On 28-09-2024 02:57, Matthew Brost wrote:
>>> On Sat, Sep 28, 2024 at 12:54:28AM +0530, Badal Nilawar wrote:
>>>> It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
>>>> queued, but it didn't get opportunity to execute and timeout occurred.
>>>> To address this the g2h_worker is being flushed.
>>>>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index 4b95f75b1546..4a5d7f85d1a0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>>    	}
>>>>    	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>>> +
>>>> +	/*
>>>> +	 * It is observed that for above GuC CT request G2H IRQ triggered
>>>
>>> Where is this observed. 1 second is a long to wait for a worker...
>>
>> Please see this log.
>>
> 
> Logs are good but explaining the test case is also helpful so I don't
> have reverse engineer things. Also having platform information would be
> helpful too. So what is the test case here and what platform?

Sorry, my bad, I should have added issue id in commit message.
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620.

This issue is reported on LNL for xe_gt_freq@freq_reset_multiple test 
and xe_pm@* tests during resume flow.

>   
>> [  176.602482] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
>> GuC PC status query
>> [  176.603019] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>> GT[0]
>> [  176.603449] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
>> running GT[0]
>> [  176.604379] xe 0000:00:02.0: [drm:xe_guc_pc_get_max_freq [xe]] GT0: GT[0]
>> GuC PC status query
>> [  176.605464] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>> GT[0]
>> [  176.605821] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
>> running GT[0]
>> [  176.716699] xe 0000:00:02.0: [drm] GT0: trying reset
> 
> This looks we are doing a GT reset and this is causing problems. This
> patch is likely papering over an issue with our GT flows. So this patch
> doesn't seem correct to me. Let's try to figure what is going wrong in
> the reset flow.

This is seen for slpc query after "reset done" as well.

>> [  176.716718] xe 0000:00:02.0: [drm] GT0: GuC PC status query    //GuC PC
>> check request
>> [  176.717648] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>> GT[0]  // IRQ
>> [  177.728637] xe 0000:00:02.0: [drm] *ERROR* GT0: Timed out wait for G2H,
>> fence 1311, action 3003  //Timeout
>> [  177.737637] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC PC query task state
>> failed: -ETIME
>> [  177.745644] xe 0000:00:02.0: [drm] GT0: reset queued
> 
> Here this is almost 1 second after 'trying reset' which I'm unsure how
> that could happen looking at the source code upstream.
> 'xe_uc_reset_prepare' is called between 'trying reset' and 'reset
> queued' but that doesn't wait anywhere rather resolves to the below
> function:
> 
> 1769 int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> 1770 {
> 1771         int ret;
> 1772
> 1773         /*
> 1774          * Using an atomic here rather than submission_state.lock as this
> 1775          * function can be called while holding the CT lock (engine reset
> 1776          * failure). submission_state.lock needs the CT lock to resubmit jobs.
> 1777          * Atomic is not ideal, but it works to prevent against concurrent reset
> 1778          * and releasing any TDRs waiting on guc->submission_state.stopped.
> 1779          */
> 1780         ret = atomic_fetch_or(1, &guc->submission_state.stopped);
> 1781         smp_wmb();
> 1782         wake_up_all(&guc->ct.wq);
> 1783
> 1784         return ret;
> 1785 }

And CT is not disabled yet, so SLPC query will go through.

> 
> If this log from an internal repo or something? This looks like some
> sort of circular dependency where a GT reset starts and the G2H handler
> doesn't get queued because the CT channel is disabled, the G2H times
> out, and reset stalls waiting for the timeout.

This log is captured on LNL, with debug prints added, by running 
xe_gt_freq@freq_reset_multiple.

If CT channel is disabled then we will not see "G2H fence (1311) not 
found!".

During xe pm resume flow this is seen during guc_pc_start->pc_init_freqs().


> 
>> [  177.849081] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
>> GuC PC status query
>> [  177.849659] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>> GT[0]
>> [  178.632672] xe 0000:00:02.0: [drm] GT0: reset started
>> [  178.632639] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
>> running GT[0] // Worker ran
>> [  178.632897] xe 0000:00:02.0: [drm] GT0: G2H fence (1311) not found!
>>
>>>
>>>> +	 * and g2h_worker queued, but it didn't get opportunity to execute
>>>> +	 * and timeout occurred. To address the g2h_worker is being flushed.
>>>> +	 */
>>>> +	if (!ret) {
>>>> +		flush_work(&ct->g2h_worker);
>>>> +		ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>>
>>> If this is needed I wouldn't wait 1 second, if the flush worked
>>> 'g2h_fence.done' should immediately be signaled. Maybe wait 1 MS?
>>
>> In config HZ is set to 250, which is 4 ms I think.
>>
> 
> HZ should always be one second [1].
> 
> [1] https://www.oreilly.com/library/view/linux-device-drivers/9781785280009/4041820a-bbe4-4502-8ef9-d1913e133332.xhtml#:~:text=In%20other%20words%2C%20HZ%20represents,incremented%20HZ%20times%20every%20second.
> 
>> CONFIG_HZ_250=y
>> # CONFIG_HZ_300 is not set
>> # CONFIG_HZ_1000 is not set
>> CONFIG_HZ=250
>>
> 
> I'm little confused how this Kconfig works [2] but I don't think
> actually changes the time of HZ rather it changes how many jiffies are
> in one second.
> 
> [2] https://lwn.net/Articles/56378/

Oh ok, Thanks for clarification.

Regards,
Badal

> 
> Matt
> 
>> Regards,
>> Badal
>>
>>>
>>> Matt
>>>
>>>> +	}
>>>> +
>>>>    	if (!ret) {
>>>>    		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
>>>>    			  g2h_fence.seqno, action[0]);
>>>> -- 
>>>> 2.34.1
>>>>
>>

