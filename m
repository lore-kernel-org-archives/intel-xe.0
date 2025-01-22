Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09622C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C084610E762;
	Wed, 22 Jan 2025 21:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBukIZ04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5C510E761
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737580192; x=1769116192;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FxdkZp84TpzHZ/ue0T38lFY4HHwo+aCx007XhG1Y43E=;
 b=WBukIZ04Gq1mzYpEtMnHAnUq7fqVWwZOBKKFWIY7n66H5UmOA3YFZAeY
 aA365KpDi/bIO8/FmUpWPJFsYX17ehC4YwzJmEf0kgN6iOeT7B1cnoT1c
 nONkd+CVeHLJUyMrwl4cuwohFov9IlD7AQ+BR1WG3RfVWgfz99p1DWQb3
 YumEfz9wEMOE0ekT4dLO06qoWalU8zI9yqF8vjGGZ5HdBOXZZK7mLtw7b
 Vb28EcCB4enrU4aSCDoxP/YUkRIb+MppsGFU74xtT5l5rKwOjzI80/Zhm
 TUHhTXkRpHeC6XG+Cq28IyXljnCzT8wI4YoF6AgN4LIeiD8TbEWVl9xBj A==;
X-CSE-ConnectionGUID: N0vD0kLuTiSCd3GlOz5TOw==
X-CSE-MsgGUID: 73STL1onSuqyfi7mimd46g==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="63409398"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="63409398"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:09:52 -0800
X-CSE-ConnectionGUID: uEhApCYCSRupTy4ngP0qxA==
X-CSE-MsgGUID: ny4XANbOS+qWW0Nej3FNvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="138109685"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 13:09:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 13:09:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 13:09:51 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 13:09:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQsQY2mNBrw/QwG4pK31vyjsjRu7+YGL3cmNn6YY5Gw7z8QO+w5zDWM8Ngfdh6Y59zI+npgGwSE1tcp0VnZSKfIw3+Am01BBT5/jjY8Ma7OQOlROmrcWex7JTSXtux22jNOmDKBuQzszdVpQzqo6LTn+H8VYekEY7S8MRFuJ1zmJV4t7MMHbQvrwOtsoIU3gWf7gw5n+I3zJeoTzJrGM+yVWaH6qCakLWE3sjf1aHB5eqxBJUv0Sd66KWaM8yU5s+aTpEJytHH+8EUKT7zFVKmxWHAFf7WFCDN7GV9EMO81OUP7S2v39rJNzBv8AbN05nLpdAbz/dRRUnXZ0njK15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRXQ2tNFb9stkdc+8sqbis1no43olQErmOm7Xpd3T+I=;
 b=mI5eyOXLlI6JVeLepxn62WJtDIfxLBdCYzYziV5FdKMIGnsdcbOMAdb/OWwv/F4tJwqoUebeyxfhgPBqkttHLNZWHMju4k+xzafNH5W2rxvdA95h9VZYZblTye9DsnbB4M76wNjOdrdaHR2lLvw6nStAUvU2iboWAlmr/Gqe4H20888X6b65gk6JCoINJOt7ryjDdJI2JVEbCOiXA+rS0/rdSrt2XnHs3GyQKhLaMCKythgtDqhNuWMMchSOhyeWb1o5Tn0mh+Wh+uwmZ849zFgbv3SmiUWhiVkQsaIQWPiw86hGeoYnmaSErP04JDF+rlzz68LJnZqouGnELYpU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 21:09:05 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 21:09:05 +0000
Message-ID: <afe8b57c-4eb1-4c2c-90a4-52fab482ed89@intel.com>
Date: Wed, 22 Jan 2025 13:09:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
To: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
 <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
 <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
 <qj6jh2z7qncr73nesmsdjaa46rxnm34tf4slp6y4ctv4w2dzv2@lttsv323fanu>
 <789cbf9a-fbd8-44e8-a528-22a6c098189e@intel.com>
 <zkjzktceuth45bignihe2vy5j3durxymlur5ama4npxjtraetp@2cta2iw2pq7r>
 <b33cc2e2-d29a-4325-a92f-529ba55efc09@intel.com>
 <b5lvicq2uiplspkfzbx6im5c2bwt6xzajedqpvn4uyqns4sjvm@guonfjgyryju>
 <2e2d831f-6b1f-457c-8166-ce8362182a55@intel.com>
 <fd81f8850ce77cd3f2a1769bf0187d6e851fbceb.camel@intel.com>
 <b4b250ac8dbe7ba53c62da206d4eff7a40ac2b86.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <b4b250ac8dbe7ba53c62da206d4eff7a40ac2b86.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:907:1::33) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0cf0d1-507d-481d-34ee-08dd3b29012f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TllOUUJDaXRKcW96R0JQclNpWmFSdlM4NUdIZm1IcmhVbElwY1lhQ1FZcys1?=
 =?utf-8?B?dElyZjBxeEVrbm4wc09NVmJFNWJDM3Jvdi9tekQzS2NqbFRGR3M4ZENNTDg2?=
 =?utf-8?B?UnozeC9GdHNJdVBwU2x6VlpOcFliR2lFRFhERHR3dWJ0QW90RlhyeUpHNk5L?=
 =?utf-8?B?OE00RmovQVBWd3kxWXdMUUI0cG5JNG43cTFCK09jazFITjk2WjRieXljaGo1?=
 =?utf-8?B?eVBSZU5pU1NLNUNVSHJ3QU9WVWo3WUpDUUx6L1lXY25wQXJxQ0pSMmNEbnF2?=
 =?utf-8?B?TVowY2ZvNkFuSFFRbjVjQVBCR3VvZWtVQjRPbUhRbFVRMEJ1My9pVDdsaC96?=
 =?utf-8?B?L2gwdVZsakF1QUg5TS9Pb1gzUWZiM1NFNldyWXoxbCtMRnVKd1RWY1lCVzli?=
 =?utf-8?B?aGs0ajM2d2FlVDNoeW44Ty9GRkF0cmNvV0ZMeWZFTmtFaSs2ZklrbzMxM0E3?=
 =?utf-8?B?WFhiT2o2dGNRVjU3LzJUaENuZ3J5RnZMWDRhL25TNmhEK3BwUXVNa1pnZVRk?=
 =?utf-8?B?NVBjNTh0dzVXSnA5UXZlZlhXQUpTdkcrbmxCNGcrUVcvcUp0OGhVRGhVSFJZ?=
 =?utf-8?B?TzVCWHhPeHFDRWxCM2FpSS9tNC83VkxzNlhBdjBWa3I0WXgxeVdxc0IrRDFh?=
 =?utf-8?B?VW5BdXZqTHpWTktPY1gwdXpqMGo2Vk82VVBoTFhZc3dUVDYxcmd3YkpmOVNa?=
 =?utf-8?B?YzlOTGE5VytwT1lwRU9VbW1oOFdsV3hYalFDdU1EYndJeVVyNGQ1SnRXTG1Y?=
 =?utf-8?B?NTVwT1p5UmN6N3RZVmxERmFBL3V2NXcrbFZ1alB0TjJwWHozWWFLekxWMVVD?=
 =?utf-8?B?dHdvc0poSDJwUHRJd3Q2YlUyb2V0ZitXZGtRTStlWEVZU2pZZFlFUEMwOGFt?=
 =?utf-8?B?cFZmNXJoU3BseTB2bXdCWkNsdWlUaDZJSktMWFYvTktJWnBGUDc2OWpUa0ZU?=
 =?utf-8?B?UDhEM3RBNWo5aXA3QWh0WWFqK3ZoZS90aEw0QmUvNnlnSytUYVJUUk0yQzZ4?=
 =?utf-8?B?cENYVk5UYmNUV0VmME1uNmdmcHpFOFFQRWZSajRJMmtzS1FzSUJmUHFOQjNy?=
 =?utf-8?B?ZTVNMkVWY2xnSmVRSVhjcHV3V1BMUDVoLzFkRTNvOTI5THIzRXBSNnJhV3pT?=
 =?utf-8?B?aEhSSnZsRHZnNHQ5aWM2Z1lpK1pPbkVLL0owV3JqZVJvQUdBOHAvKy9EbGdp?=
 =?utf-8?B?RTZlWWZ4MkpTVEFBWEdKb1VWWjVvR0N2bXVFeDZuT2FhKzZUV3Z6c0FwRzM5?=
 =?utf-8?B?Q0lhd3RjUVVyRGZTR2toYVJSR09wc21VVStuQ29YL1NlTnVwNHI3RENlZ0VF?=
 =?utf-8?B?eVJpQmExcGlEVGRtYlhSTmx6YTZJaS9MOWs3bmpPVzViV2ZmSXlnOCs2UU5D?=
 =?utf-8?B?WHBtazhvSlNJZVU1MDMyZE9zU0xad3JOVWNsck9jS05OcFZ5aXlBMzUzZTNO?=
 =?utf-8?B?UlVaQXZxNzFMNkRGVE1KMStFOXhtV3lMcmVHd2w0Q1RwQkdlRTg2VVAzdkYv?=
 =?utf-8?B?YjFkK0xXQWtDUUpvdlpKVnhvRXErVlloZWY0Rk1PZHJIUVRzbUtSQm1CQmtB?=
 =?utf-8?B?K0FjZndRWktsR3J1b1pxV0lKc2sybUxWbnN0Tm9vQndrRHYvN2Y4QWtaRVM3?=
 =?utf-8?B?YW1FYkt0dHJCVGF1cUI0VXNPblFTMlltTGJaV1VyQlkzL3RFcUdmT3JlT0d5?=
 =?utf-8?B?TXY5S0RpVTZlRnJoYktDYTZpaDkxS2x4N3ZBcWNDV2lHVGNsWXAwUFZrRkF1?=
 =?utf-8?B?MUhiU1VpRUxrWDNFK1Z3TWZsZzBnUVNNTVpueVl6dkhmNlFBMXVQa1NNcEpy?=
 =?utf-8?B?b01vY0JaVWs1TUwrU3VMdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2Ywa3R4N3hZeEFWRXphNmtrZVpvMEZrYnk3SDc5SUZab2dEWnlpbzFTWThV?=
 =?utf-8?B?NjlzUWZnalllL2VtQkxLalVxanAxcHF4VFRRWmczV053SXYyQzJyVkI1dVJG?=
 =?utf-8?B?MlNVVGlLdHlkdWJZem85UE92S29RSlVyVUtHRm9lN0QyTHFHTWR2SnRMZjcv?=
 =?utf-8?B?L0NoWWdpbWdMTVlBR3V0QVhlZldMckQ1VDdlejhsVjJCaWgxNTA1NmVZZ1pn?=
 =?utf-8?B?UXE1UzkyMHUyeUczQVhQa3hzM2RQcm5sUzhBK29NYW5wRVAwNUkvL2owMW5w?=
 =?utf-8?B?aU1SeXJ0Ym1taHZXSVB6WnF3TCt4MjIyc1puY1NPcHkwck91VTJFWU16YXFh?=
 =?utf-8?B?V0RIbm5lUVNMRWVzam9pcVNUcU9Jc3JDNU9NU081WCtLRm04SkdaQjZTTkFI?=
 =?utf-8?B?S3l2SEYzWXhCMktYK1Y1dHhnbm5CVGdaQzh3MXdSNXp0SzMrNnE1M3IxRmsr?=
 =?utf-8?B?YWE3TVRNamRhb1dLbFZ5Ly9vUjV1REhaR3FpWFNKaHpIZFRDMGhMbmwrZ2Fk?=
 =?utf-8?B?VzN2TGhlQi9WRXcrb1dnZmppR3lvcWlRTE9hQlJWVjBjNGYwbFBJT0E1bk1v?=
 =?utf-8?B?T2hlT0RjdmFOM2FqZ0s3eEJTcVhrQjlZbEN2VnVOMjd3UjJiZlpuSnZ0ZDVW?=
 =?utf-8?B?MkhmbDNEVU1HU2ZmSWZ5VkFJa05LWjB0QllBU3pUNmdFRlg4Q1NCbmdIclIw?=
 =?utf-8?B?ZFNmdHBOQ2JFcTFOTHg5cnlCNlNkZHczc2NKMGVad0N0THpVVk80UGxhS3lL?=
 =?utf-8?B?OWxoc0psamw0UWFrQ29oRktkd3FyWld4OHZFN1p3Y1JtSmdremFVR1VyVkJJ?=
 =?utf-8?B?NlBDOHRwUGhmQitxckRUdlJOZUQ4bWJoQUZkanJOVENnQUtjQTBjYzNoMC9K?=
 =?utf-8?B?RW9jTHU4Z3JXS1pFUjZFSG9zV3RhMGN0Um9rVWdhS3FBWnU3Y1kzSmFtUkgw?=
 =?utf-8?B?VHVSZ1NBYnI5T3N1bGRaNXVqWGNXTXRJS2VKQzkvWmF0MVpvVmljSC9Ed2t5?=
 =?utf-8?B?dXFVbi90NUE5NGtNR3ljVWlIbG0vdDgyM294WFdJNlQwcEoySW8yWmNITkt1?=
 =?utf-8?B?VG4ybzhCbFFTcWVGbjdiNk9vcHMvMkZabGJEcjFTcVNwNFZ5N3VFTWF0Wjhw?=
 =?utf-8?B?OFFlS0d0T0d2OHZXODZMM2VUVDBqS0JHUlRXSlpvdEVoazFCUnZqMjd2RWdF?=
 =?utf-8?B?MmlrelhFajVRVG56ak9ncjh4eDl3Y3VlczNGcjdoazkzeXBDM2dhNFpJSGxj?=
 =?utf-8?B?cDVwYVU2WmZDeDR2Qm4zL0tZbjFkZWlMWlVPUFJkTStrSCtEVWhXQ1FxMi9v?=
 =?utf-8?B?Q0k4K3ZEdGR3TExBKy9BUDF0Tmc3WmhlSHFYYjhhajgyTHpmTWFEanEvNmxH?=
 =?utf-8?B?aHAwWjlZZHdEc0ZQSk9SMFRROUFCakM3RmFBaVZ2eFFVWEY1SHphTlVmdU1m?=
 =?utf-8?B?aG1iYW5WdXBFamJlYWZxTzJ6bUgxWjJDVnphMXpzamFNTWJGVExzZHFmVDdJ?=
 =?utf-8?B?djRTblFMUVFoV3AvWVZ2dCtBS3ZYOTRyRExYR0dCNnY1dVovdDdWbWl1Wk1X?=
 =?utf-8?B?dmI2aW5YUUtzZ3VsM21jVnNQbk44WkdaT0NRZGgzWCtVVGJBWDk3NTQ2N0Q1?=
 =?utf-8?B?M05iZmg1WStHNmdWS08wZmN4WUdkdnByMVNzK1VnbUVqZEZXQkxGMG9UODRs?=
 =?utf-8?B?eEdEc05KbEhNSytyMXl6QVoyc21hWFVYVytGemdHUlRCa3FPblE2OVd0M0ts?=
 =?utf-8?B?allUbTNSUlVzTWNhQkpQU0ozM0FWRzZ3bGpQcjhHMTZZTTRNTHVFT1p2Mm1O?=
 =?utf-8?B?ZnlBTTV5Vk0wTVVRQ1pVTkV5UkNkQU9GeVF5TktOQjgxL0F6VklKMGwydHJQ?=
 =?utf-8?B?R2thVElHcVk5MGpVc2pFYVNtMlJNV1BhQ3haWkY3aDFOenZjWFd5RE0rRGZH?=
 =?utf-8?B?dXJoRHZDM0NGT0dJYmNqRmNSdjdBY2c0VGJzMEVBVlRkOHQ2cjlVSC9hcXB3?=
 =?utf-8?B?NGNwZ0xvMTVUR3htRkVWMTh3cGNFU2ZILzY0c3ZkZDdwb3lnTHMxaS9WR2FU?=
 =?utf-8?B?RElWWGVCZkRKd1dGMVgwaW1LWmo3U1NCRk40akJ1NkdlbU8yOG9UT3pvMUpE?=
 =?utf-8?B?QUM2TVRtMDVoTnova2YxRmwxb2VTRVpwV0UwU3JFcTlzL2RyZTc0TTRqMG00?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0cf0d1-507d-481d-34ee-08dd3b29012f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 21:09:05.8078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfTcg9BUWaKjNsnukKU8o/btgaMYuCPMSl9TOmVtvhDX9Rksb4Q88Hzqgv2TZslDO+bgeHMOTLiBX9N0gNFa6h3soMERZZGePyxnbRmbHEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
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

On 1/22/2025 10:29, Souza, Jose wrote:
> On Wed, 2025-01-22 at 08:59 -0800, José Roberto de Souza wrote:
>> On Wed, 2025-01-22 at 08:45 -0800, John Harrison wrote:
>>> On 1/9/2025 14:43, Lucas De Marchi wrote:
>>>> On Thu, Jan 09, 2025 at 12:40:51PM -0800, John Harrison wrote:
>>>>> On 1/9/2025 07:39, Lucas De Marchi wrote:
>>>>>> On Wed, Jan 08, 2025 at 03:59:58PM -0800, John Harrison wrote:
>>>>>>> On 1/8/2025 14:11, Lucas De Marchi wrote:
>>>>>>>> +Jose
>>>>>>>> +Rodrigo
>>>>>>>>
>>>>>>>> On Wed, Jan 08, 2025 at 12:14:49PM -0800, John Harrison wrote:
>>>>>>>>> On 1/7/2025 13:10, Lucas De Marchi wrote:
>>>>>>>>>> On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>>>>>>>>>>> Change to disable asci85 GuC logging only when output to
>>>>>>>>>>> devcoredump
>>>>>>>>>>> (was temporarily disabled for all code paths).
>>>>>>>>>>>
>>>>>>>>>>> v2: Ignore only for devcoredump case (not dmesg output).
>>>>>>>>>>> v3: Rebase to resolve parent tag mismatch.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>>>>>>> ---
>>>>>>>>>>> drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>>>>>>>>>>> include/drm/drm_print.h             | 2 ++
>>>>>>>>>>> 2 files changed, 7 insertions(+), 3 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>>>> index 6980304c8903..8e5d1f9866a7 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>>>> @@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct
>>>>>>>>>>> drm_printer *p, const char *prefix,
>>>>>>>>>>>       * Splitting blobs across multiple lines is not compatible
>>>>>>>>>>> with the mesa
>>>>>>>>>>>       * debug decoder tool. Note that even dropping the explicit
>>>>>>>>>>> '\n' below
>>>>>>>>>>>       * doesn't help because the GuC log is so big some
>>>>>>>>>>> underlying implementation
>>>>>>>>>>> -     * still splits the lines at 512K characters. So just bail
>>>>>>>>>>> completely for
>>>>>>>>>>> -     * the moment.
>>>>>>>>>>> +     * still splits the lines at 512K characters.
>>>>>>>>>> did we investigate where this is done and how we can overcome it? I
>>>>>>>>> Yes. And the comment could be updated as part of this patch to
>>>>>>>>> make it clearer...
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>       * Splitting blobs across multiple lines is not compatible
>>>>>>>>> with the mesa
>>>>>>>>>       * debug decoder tool. Note that even dropping the explicit
>>>>>>>>> line wrapping
>>>>>>>>>       * below doesn't help because the GuC log can be so big it
>>>>>>>>> needs to be split
>>>>>>>>>       * into multiple 2MB chunks, each of which must be printed
>>>>>>>>> individually and
>>>>>>>>>       * therefore will be a separate line.
>>>>>>>> so there's no "underlying implemenation that splits like at 512K
>>>>>>>> chars"?
>>>>>>>> Nowe it's something else: a 2MB chunk because of what?
>>>>>>> The GuC log is captured in multiple 2MB chunks because we can't
>>>>>>> kmalloc a full 16MB block at a single time irrespective of memory
>>>>>>> fragmentation - the kmalloc function aborts with a page size error
>>>>>>> above 8MB, I recall. Might even have been 4MB? The 2MB chunks
>>>>>>> become approx 512K characters of ASCII85 output (when mostly full
>>>>>>> of zeros). Because each chunk is a separate bo object the memory is
>>>>>>> not contiguous so each must be printed with a separate call to
>>>>>>> xe_print_blob_ascii85(). If xe_print_blob_ascii85() includes a
>>>>>>> terminating line feed at the end of the print then that means
>>>>>>> multiple lines for the GuC log.
>>>>>> now it makes sense... and contradicts what was said earlier about the
>>>>>> "underlying implementation still splits the lines at 512K characters".
>>>>>> It's this very function that is splitting it.
>>>>> The initial comment was written before the situation was fully
>>>>> understood because it was a quick hack to get the mesa debug tool
>>>>> working again.
>>>>>
>>>>> The split is a combination of the helper function adding a linefeed
>>>>> to the end of the output and the GuC log being so large it must be
>>>>> split into multiple malloc buffers. But it is not related to the 800
>>>>> character line wrapping within the helper's output.
>>> @Lucas, are you happy with the above now? If the patch is updated with
>>> the comment as above can we get it merged? We currently have no access
>>> to GuC logs via debugfs which makes debugging issues difficult. Multiple
>>> people have already complained about this not working.
>
> I thought it was agreed that the line break were not necessary and was being added because of the way GuC log output code was written, so why it is
> still being used?
As per earlier comments, removing the line breaks requires doing hacky 
things and/or having messy interfaces in the kernel. Being understood is 
not the same thing as saying removing it is the perfect solution.

Whereas supporting wrapped lines is defensive programming. It makes the 
tool more robust for when core dump files arrive from random end users 
that have passed them through who knows what text editor or email tool.

>
> In my opinion this patch is changing a struct that is used by all drm drivers, not sure if we can change without an ack from a drm maintainer.
>
> Also would be nice if GuC log follow the same pattern as other binaries in devcoredump like:
>
>
> [HWCTX].length: 0x1000
> [HWCTX].data: xxxxx
>
> [200000].length: 0x40000
> [200000].data: xxxxx
I'm not seeing how that helps.

The size above is the decoded size. That does not tell you anything 
about the amount of ASCII85 data because the encoding is variable 
length. The ASCII85 spec includes basic run length encoding of zero 
filled data. So the amount of ASCII data is not a simple function of the 
input buffer size.

>
> And again we should avoid break the Mesa parser as much as possible, customers open bugs and attach it. And soon the same devcoredump will be used to
> replay the batch buffer and all the context that cause the GPU hang in simulator and real HW.
Avoiding breaks is not the same thing as not allowing improvements.

>
>>>
>>>>>>>> I don't really want to keep updating this instead of fixing it.
>>>>>>>>
>>>>>>>>> The dump helper could be updated to never add any line feeds, not
>>>>>>>>> even
>>>>>>>> when you say "dump helper", what exactly are you talking about?
>>>>>>>> xe_print_blob_ascii85(), __xe_devcoredump_read(),
>>>>>>>> __drm_puts_coredump()
>>>>>>>> or what?
>>>>>>> xe_print_blob_ascii85
>>>>>>>
>>>>>>>> If it's about xe_print_blob_ascii85(), I think this would be the
>>>>>>>> first step:
>>>>>>>> drop the \n you are adding. AFAICS calling the print function in
>>>>>>>> chunks
>>>>>>>> of 800B would be fine, just don't add any \n. If that still adds \n
>>>>>>>> somewhere, we can check how to drop it or you then may have a pretty
>>>>>>>> solid argument to adapt the mesa tool with a newline
>>>>>>>> continuar char and send them the MR.
>>>>>>> As above, the chunking is at the next level out. So dropping the
>>>>>>> 800 byte \n won't help with the GuC log still being split into
>>>>>>> multiple lines. You have to either move the terminating \n outside
>>>>>>> of the helper and into the callers or add a bool parameter to
>>>>>>> enable/disable it. Either of which is just messy.
>>>>>> If the caller knows it's calling the function multiple times to
>>>>>> continue
>>>>>> previous data, it's not unreasonable to have an arg to terminate it or
>>>>>> not. It's for example what python does with its 'end' arg to the
>>>>>> print()
>>>>>> function.
>>>>> Just because someone else does it does not make it clean or the best
>>>>> solution.
>>>>>
>>>>>>> Or extend the helper to take an array/list of pointers in a
>>>>>>> scatter/gather fashion.
>>>>>>>
>>>>>>> And if you drop the 800B \n then you break the dmesg output
>>>>>>> facility. Which means we can't get logs out from CI panic type
>>>>>>> situations.
>>>>>> Or that we should have another way to get a devcoredump. I don't think
>>>>>> we are going to print the devcoredump to dmesg when the kernel panics.
>>>>>> We may print it when we fail to probe, but the cpu should still be very
>>>>>> much alive - we tie the devcoredump lifecycle to the lifecycle of the
>>>>>> device, so we don't have an opportunity to get that data.
>>>>>>
>>>>>> The workaround you add is to dump the whole thing to dmesg, but we
>>>>>> could
>>>>>> dump it somewhere else like a debugfs that is tied to the module
>>>>>> lifecycle.
>>>>> The point is to get usable logs out of CI. There are multiple
>>>>> situations in which CI fails to save logs. By 'panic' I was more
>>>>> meaning situations where we have very rare bugs that can't be hit
>>>>> locally and for which CI is not providing useful logs. I.e. we are in
>>>>> a panic about how to debug it and dumping via dmesg is the only
>>>>> viable option.
>>>>>
>>>>>> The dmesg (kmsg) format already contains other things you have to
>>>>>> ignore
>>>>>> to extract the message:
>>>>>>
>>>>>>   * /dev/kmsg exports the structured data in the following line
>>>>>> format:            *
>>>>>> "<level>,<sequnum>,<timestamp>,<contflag>[,additional_values, ...
>>>>>> ];<message text>\n"
>>>>>>
>>>>>> so you will always have to preprocess it, ignore lines that don't
>>>>>> belong
>>>>>> to the log, etc.
>>>>> I never said this was not the case. The GuC log decoding tool already
>>>>> copes with myriad different dmesg, syslog, serial console, etc.
>>>>> output formats.
>>>>>
>>>>>> And if you print it correctly, you can even make use of the LOG_CONT to
>>>>>> mark the new line as continuation of the previous one.
>>>>> Reconstructing split lines has never been a problem for GuC decoder
>>>>> tool. It is only the mesa tool that has a problem with line feeds.
>>>>>
>>>>>>>>> at the end. And then the burden would be on the callers to add
>>>>>>>>> line feeds as appropriate. That seems extremely messy, though.
>>>>>>>>> And it will break the dmesg output facility. That does need the
>>>>>>>>> line wrapping at ~800 characters which can't be done from outside
>>>>>>>>> the helper.
>>>>>>>>>
>>>>>>>>>> understand having to split it into multiple calls, but not
>>>>>>>>>> something
>>>>>>>>>> adding a \n. particularly for the functions dealing with
>>>>>>>>>> seq_file and
>>>>>>>>>> devcoredump.
>>>>>>>>>>
>>>>>>>>>>> +     *
>>>>>>>>>>> +     * Only disable from devcoredump output.
>>>>>>>>>>>       */
>>>>>>>>>>> -    return;
>>>>>>>>>>> +    if (p->coredump)
>>>>>>>>>> but we do want the guc log to be inside the devcoredump, so
>>>>>>>>>> rather than
>>>>>>>>>> adding more workarounds, can we fix it ?
>>>>>>>>> The simplest fix is your suggestion of adding an extra white
>>>>>>>>> space character at the end of the line in the helper function and
>>>>>>>>> updating the mesa tool to support multi-line output. That seems
>>>>>>>>> like it should be a trivial update to the mesa tool and it keeps
>>>>>>>>> the KMD side simple and consistent across all potential output
>>>>>>>>> methods. But Jose seemed absolutely dead set against any updates
>>>>>>>>> to the mesa tool at all :(.
>>>>>>>>>
>>>>>>>>> The more complex fix is Joonas' idea of using an official
>>>>>>>>> structured output format of some sort - TOML, YAML, JSON or
>>>>>>>>> whatever. Something
>>>>>>>> it actually doesn't fix this particular issue. It fixes others,
>>>>>>>> but not
>>>>>>>> this one.
>>>>>>> If we do it properly then it fixes everything. The format library
>>>>>>> would have helper functions that the devcoredump code can call to
>>>>>> but we are *NOT* going to export a library for that. You are just
>>>>>> shifting the problem to "we have only one userspace that is our own
>>>>>> library, deal with it".
>>>>> No. By library, I mean libjson or libyaml or whatever. The whole
>>>>> point of using an externally defined file format is that you can use
>>>>> an externally written library to read that format. Whatever userspace
>>>>> tool only has to worry about processing data/value pairs or whatever
>>>>> you get from the library's read interface, it no longer has to worry
>>>>> about file formats, character encodings, line wraps, etc. All that is
>>>>> handled by the third party library / file format definition.
>>>>>
>>>>>>> print integers, bools, strings and BLOBs. The debugfs/sysfs output
>>>>>>> would just stream the encoded output exactly as is. The dmesg
>>>>>>> output layer would add the 800 character line wrapping in a way
>>>>>>> that the dmesg decoder can undo before passing to the decoder library.
>>>>>>>
>>>>>>>>      "Guc Log": "<encoded data .........."
>>>>>>>>
>>>>>>>> if you need to split lines, you still need something to do do it in
>>>>>>>> whatever format you choose. One json I remember working on in the
>>>>>>>> past
>>>>>>>> that embeds the binary is the .apj format... example:
>>>>>>>> https://firmware.ardupilot.org/Copter/2024-12/2024-12-02-13:12/CubeBlack/arducopter.apj
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>      {
>>>>>>>>          "board_id": 9,
>>>>>>>>          "magic": "APJFWv1",
>>>>>>>>          "description": "Firmware for a STM32F427xx board",
>>>>>>>>          "image": "eNqUvAlcU1faMH5u7k1yCQGCICCgBoIaRW0EtVSxhg ...
>>>>>>>>
>>>>>>>> here "image" is base64-encoded  afair. But in your case, just
>>>>>>>> printing
>>>>>>>> the json to dmesg wouldn't work because of needing to split the line.
>>>>>>>> It wouldn't fix the kind of bugs we had in the past too: in json it
>>>>>>>> would be the equivalent of adding a field to the wrong object and
>>>>>>>> then
>>>>>>>> move it elsewhere. An application trying to read that object in the
>>>>>>>> previous place would be broken regardless.
>>>>>>>>
>>>>>>>> toml is more for configuration and yaml isn't a good one for this
>>>>>>>> case
>>>>>>>> as it further relies on indentation. I wouldn't oppose to use
>>>>>>>> json, but
>>>>>>>> don't expect to have dmesg to magically work because of that.
>>>>>>> TOML basically says 'use base64 and print it as a string'. And it
>>>>>>> supports multi-line strings, so the reader would have to drop
>>>>>>> newlines within a base64 object before doing the base64 decode. Or
>>>>>>> just use a base64 decoder that ignores whitespace.
>>>>>>>
>>>>>>> YAML seems to make even more explicit. From the 1.2.2 spec page:
>>>>>>>      picture: !!binary |
>>>>>>>       R0lGODlhDAAMAIQAAP//9/X
>>>>>>       ^ space here for line continuation, as I mentioned.
>>>>>>
>>>>>>>       17unp5WZmZgAAAOfn515eXv
>>>>>>>       Pz7Y6OjuDg4J+fn5OTk6enp
>>>>>>>       56enmleECcgggoBADs=
>>>>>>>
>>>>>>> So the userland reader just gets binary data straight out of the
>>>>>>> decoder library with no processing required.
>>>>>> A decoder library that we are *NOT* going to write.
>>>>> As above, the decoder library is definitely not written by us. It is
>>>>> libyaml or some such.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> So let's fix the issue at hand and let the talk about xe's coredump
>>>>>>>> format for a later time.
>>>>>>> The issue at hand is that we have two fundamentally conflicting
>>>>>>> requirements. DMesg output requires line wrapping but the mesa tool
>>>>>>> has been coded in such a way that it breaks when given wrapped
>>>>>>> lines. There is nothing we can do about dmesg but making the mesa
>>>>>>> tool's parser more robust does not seem difficult.
>>>>>>>
>>>>>>> Switching to an externally defined encoding scheme that internally
>>>>>>> manages binary objects and supports wrapped lines would fix all
>>>>>>> issues and guarantee future compatibility.
>>>>>>>
>>>>>>> Note that line wrapping is not the only problem with the current
>>>>>>> mesa tool. Unless it has been updated since? The tool breaks if the
>>>>>>> context information is not part of the "GuC Communication
>>>>>>> Transport" section. Which is totally incorrect. Context state is
>>>>>>> very definitely not part
>>>>>> We reverted it because it's not ok to just move it to the "correct"
>>>>>> place and break the users. If it's in the incorrect place and we know
>>>>>> there's this parser already using it incorrectly, we can treat as a bug
>>>>>> in the kernel and adjust the userspace (it'd be considered a bug there
>>>>>> too and backported to their earlier releases).  What we don't do is
>>>>>> simply merge the fix and break userspace.
>>>>> Can we not repeat old arguments? No-one realised that that change
>>>>> would break userspace. Or if they did, there was confusion over what
>>>>> exactly had or had not been tested and was causing a problem.
>>>>> Certainly it was not an intentional "merge and everyone be damned".
>>>>>
>>>>> My point was that there are multiple issues here. Line feeds is only
>>>>> one. But using a structured file format would prevent both of the
>>>>> problems we have currently hit.
>>>>>
>>>>>> Send the fix to the mesa tool if you want to change this in the kernel.
>>>>> When I can finally work out how to build mesa (it seems to require
>>>>> libraries that are newer than any Ubuntu release has access to!?) and
>>>> https://docs.mesa3d.org/install.html has the docs for that.
>>> Pretty sure that's what I was following last time.
>>>
>>>> For ubuntu, in our internal docs we document to install deps with:
>>>>
>>>>      sudo apt build-dep mesa
>>>>
>>>> You can disable stuff you don't use. Our internal docs have this useful
>>>> set of args:
>>>>
>>>>      meson setup \
>>>>          -Dprefix=/usr \
>>>>          -Dgallium-rusticl=false \
>>>>          -Dgallium-drivers=iris \
>>>>          -Dvulkan-drivers=intel \
>>>>          build
>>>>
>>>> I think you are probably talking about the llvm dep, that can be
>>>> workarounded by the setup flags above.
>>> I don't recall what the specific problem was last time. It looks like I
>>> have managed to get everything installed this time. However, the build
>>> does not appear to include the aubinator program. Nothing in
>>> src/intel/tools appears to get built at all. And I can't find any
>>> mention of how to build or use it in the Mesa docs or elsewhere.
>> Add -Dtools=intel to build it.
And how does one use it? Are there any regression tests that one can run 
to verify operation?

John.

>>
>>>
>>>>> have spent time learning yet another code base and how the tool is
>>>>> implemented...
>>>>>
>>>>>> And as I said, for this particular change it doesn't matter if it's a
>>>>>> custom format, json, toml or whatever... the bug would still be the
>>>>>> same.
>>>>> Ideally not. Part of moving to a structured file format would be
>>>>> ensuring that the structure of the data is correct.
>>>>>
>>>>>>> of the GuC CT layer. That absolutely needs to be fixed. And
>>>>>>> generally, anything we can do to make the decoding more robust and
>>>>>>> future proof would be a very good thing.
>>>>>>>
>>>>>>> Note that the devcoredump content is highly dependent upon the
>>>>>>> internal workings of the driver. It is going to change over time.
>>>>>>> So the more robust the decoder, the better chance it has of not
>>>>>>> breaking when some new piece of data is added to the dump or an
>>>>>>> existing item removed or modified.
>>>>>>>
>>>>>>>>> that ideally supports binary data and compression natively and
>>>>>>>>> has a helper library that can be included in the kernel source
>>>>>>>>> tree. That
>>>>>>>> oh no, we'd need to define the schema - there are plenty of json
>>>>>>>> libraries
>>>>>>>> in multiple languages for users to choose from  and that would be
>>>>>>>> basically
>>>>>>>> then main benefit of using it.
>>>>>>> Well, we can certainly define extra formats on top of a base format
>>>>>>> but it seems like it would be simpler if the base format supported
>>>>>>> all the data types we need already. Doesn't really matter either
>>>>>>> way as long as the underlying file format supports all the uses we
>>>>>>> want of it.
>>>>>> My point is that we are not going to add a decoder library that all
>>>>>> userspace consumers have to use. The kernel interface is not a library.
>>>>>> You are relying on having just one userspace to not break userspace.
>>>>> That is not at all what I am saying.
>>>>>
>>>>>> The benefit of a common format like json, toml etc is exactly that it's
>>>>>> a format already understood by hundreds of libraries and we can even do
>>>>>> something like this instead of having to write our own parser:
>>>>>>
>>>>>> cat devcoredump | jq '.[] | .foo, .bar'
>>>>> That is exactly what I am saying.
>>>>>
>>>>> The mesa debug tool becomes something like:
>>>>>      #include <libyaml>
>>>>>
>>>>>      info = yaml.read_file(file_name);
>>>>>      foreach_engine(info.engines, i)
>>>>>          printf( "Got hang on %s\n", info.engines[i].name );
>>>>>
>>>>> The external library handles all the file encoding issues. The tool
>>>>> just has to put meaning to the fields returned from that library.
>>>> to reiterate my point that it doesn't fix all the problems:
>>>>
>>>> if you move something from info.guc_ct.bla to info.contexts.bla
>>>> (exactly what happened in the other bug) you may still break stuff,
>>>> regardless of using a better well-known format.
>>> But having the structure means that data will not be added to the wrong
>>> section in the first place.
>>>
>>> The problem here was that we had no structure to begin with. Then
>>> structure started to be added. But a tool was already making incorrect
>>> assumptions based on the lack of structure.
>>>
>>> Sure, when something needs to be moved, that will still cause the same
>>> kind of issue. But that is much less likely to happen if we are more
>>> careful about adding new entries within a sensible structure to begin with.
>>>
>>> John.
>>>
>>>> Lucas De Marchi
>>>>
>>>>> John.
>>>>>
>>>>>> Lucas De Marchi
>>>>>>
>>>>>>> John.
>>>>>>>
>>>>>>>> Lucas De Marchi
>>>>>>>>
>>>>>>>>> will then remove any and all confusion over interpretation of the
>>>>>>>>> file forever more. But it would require updating all userland
>>>>>>>>> tools to use the appropriate helper library.
>>>>>>>>>
>>>>>>>>> John.
>>>>>>>>>
>>>>>>>>>> Lucas De Marchi

