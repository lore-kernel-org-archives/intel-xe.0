Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAE1C02192
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 15:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F42B10E1E6;
	Sat,  1 Feb 2025 15:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrzmzhZq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC7D10E1E6
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738425395; x=1769961395;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VZ9eSXxJ6s1ejM1sZPqYCDby4+FddG+c9hi9yZ2y948=;
 b=mrzmzhZqfDahoV2jdX0+8hblMDZpO5rNIw8BliqTca4iuruEme8oecuC
 7G3jI3/IjhkI0oMGnPdZOnyd+rYKw87CK+CeSlN07jzLVBiekvR9gy19N
 uMScIqDzEyxWK5lrCo3MdzhFRdGcY9bpjSUewbGBxp792U9952kuEYjTF
 XKg3RxVeQNMwubKFRN07X//brEciQmbHsTBy5HIb4QBMlt5J+tehn5hrE
 2w/MyAE841lzNWyo9FhQF8aygbo6H78YW/HNWf4RwUSTEGO5FohLu38W1
 I65tqRbsEculOba2wb6NkeRDFMIR8r5JHUrccKeGuU6CTKdDZe2p4FBj1 g==;
X-CSE-ConnectionGUID: FhCS/0wMQ7eTJCZM7gPWIg==
X-CSE-MsgGUID: 55mx2/HkTUi017tKVTLtlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="41806226"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; d="scan'208";a="41806226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2025 07:56:34 -0800
X-CSE-ConnectionGUID: y9WCyj5xTMKSLHQiR+IoHg==
X-CSE-MsgGUID: pSy+yNKSQlC680LYIsvJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; d="scan'208";a="110471307"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2025 07:56:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 1 Feb 2025 07:56:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 1 Feb 2025 07:56:33 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 1 Feb 2025 07:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=areb+KCfU24j97RqC975bEZqxkFydCPRpQavME3JHyy4UtEJ8f9MraxQzaxLSLhqiXS31Se7vIcp8q8Ux5kcDhGWkTNRTs25ulutgMjE+3XKn2nJ5Hvj2cXwmehm8JOaMYgv0NPoSeTTu09AAa/rw+DZoFuYc/HHB6udgmHToBw/bYk05ley1p7PlRUui2D2UF+jVjqTTkZ+z08HsfJ1AsP9FKM5sowlpfTz3D3lPFGLO83XR7ndv5xMhI07ixsMNzHUDI6qxf+JLnqQYrGd7sNoLcujpH1Lhc5oJZ+gRRE8B/RFeKwjWcLqMdTzhoaqnsIbWaVpWK1cHTzZVT8e0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9OvpYhNfSJpckQESeTNL8JXzYxHxYWASgvqMvD7bEg=;
 b=lnQYnMRHz0N2pFO571WkyOagLr+uQ+q8YK9m/lizQQv3ndbvdD3F3Ac3pJiRmdKwTXf2mJqgDAtcZBdKPUhb9T3PcRwKqhitKzlprQeeRH+5zoaNPSiz+TgZWQReIMLg+i70Q2DuME0FunRE2ZqozUqdcERfrTWfxxuG2Wx2vei10k4bBH0qb+gDHBWCl1f+OQT/rVA7thmMx2cRegTwTvCbZ7MneL4XRX7uokXVaCEUSfFlB+RJ3PRnT9xfvLwB8VZ+6Tg3v3CIKMrM1z5QBYDo9sT0VqJcvsftm2HeyRuXWOsILqnDBouGjPO/PwbGJhdKoc6LiPR457izN56xDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Sat, 1 Feb
 2025 15:55:50 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 15:55:50 +0000
Date: Sat, 1 Feb 2025 09:55:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 5/7] drm/xe: Cleanup unwind of gt initialization
Message-ID: <lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-6-lucas.demarchi@intel.com>
 <Z52-Mp78y2jELsmp@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z52-Mp78y2jELsmp@black.fi.intel.com>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f29be38-915e-4ab6-e73b-08dd42d8e673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aBdu0jk5lEdjCrotcuKoMe3gy8aAGL/t51ty5EE31WMM0uafUJyjt7WJQETA?=
 =?us-ascii?Q?Vtq5XK8pD7LncNhSS7vBXcTWbVtczKvCe8iVLxK5yqCDqXaJMKVFe18q0S83?=
 =?us-ascii?Q?undyBYevEjWU+W1TrtKvhTFkzmspPAfHrsWTjCPnCcYP4ZN4/zBJ4BtgMndH?=
 =?us-ascii?Q?ubOwFU5/BWRY5+16tmni1Kp/CwgfQ8BxHafB64fbiacmevWCpfwUyZftzIUl?=
 =?us-ascii?Q?kB5ICDqORKY+mFdJGKnlc2gYTkmdbDNZTBex2BsrhryDZb1IaacHp3yku86Z?=
 =?us-ascii?Q?HerHqMcIOfFXJWXtj5W726N632gahcXW0mPLDgIYpVpG/KHPdHnfWpJDZAlm?=
 =?us-ascii?Q?YMP1MOVd2XBS8R6bpXQZEeuXj+90lv+3JaHMdAFHlBPg8mlxU5/YYYqWGeae?=
 =?us-ascii?Q?Xu45CbpZ4WNtMxv2iMoHUfriRg9/kuGiMSaerGMpfzVrUNRP8S1W/8W1WgMD?=
 =?us-ascii?Q?+JjKDiabS0eE68jwjoj48UaNkiAHlYclxIDIgx0Bri9JhD9KwZO9xguedxqt?=
 =?us-ascii?Q?a33uFyGeSUQHdNSuNHV1W+tWAv161RFQEQoaLL+JhDIRcJom8pMnXPPInj0k?=
 =?us-ascii?Q?IJWRm8SKkzqBfNpajtEKLdMB47MRwWORvvr4RjdMruK4Bj31y10+vqWu/rkw?=
 =?us-ascii?Q?4eQNeWnaBVdVKfdcU0dC2VaRDjGPzWbLEzHT206w7VPNZcEZo2UdO2mFnFE1?=
 =?us-ascii?Q?ksTlV0MudsSVkz8XIZPWpFqHQaC5bXBBpllx6C/TVcwueobRmRA5b066p9rg?=
 =?us-ascii?Q?QFwm/oBLUjvnEixEpddQQNBN+AP8mlOCm2Li4YzpT7HzA4I3MG2ehE5v91LU?=
 =?us-ascii?Q?uQhNrx1K/LSBglRuVw30usjMzK9Pc1D+8dq/nR4/RAnP734NDjcmEr6HfCt+?=
 =?us-ascii?Q?wDv5G8SG2gFjIEF9UY0ehhr6Zhkz2xNebjsVNH3ztwCZq6slbyekMtJGPIAd?=
 =?us-ascii?Q?0RhprnY9y7cRD7RntKCzxnsC9HB64J/kD4W3SsJwG0ewsiYTGTNwQut1p8Mt?=
 =?us-ascii?Q?/cITEyV/cEQmM9xEaOmn8Q3nr+EWiFOuPnF9NA8/hAIfCFX85Fzlkdqi8HgU?=
 =?us-ascii?Q?CMyqICO35AM+1nQ+WfS3FEWA1nwljWTKRd1qWedjB+wKgEY7lN9VMsSCyF0L?=
 =?us-ascii?Q?Sfu0/PvHU4KjkPrH+iXPUskFOYtjBOoWMsob87oRe6pBtEY2F8FIpfdSUtsT?=
 =?us-ascii?Q?l6JCgYOnCyhRI2LDYfU+bQolAa0WiSPh2dnFaXsa6fry86EAifzeqhoEByW/?=
 =?us-ascii?Q?uePtJ8Cp9BSJUS/90uXaC8whiZefuoZVc3uToOe8dSpi6dSUYDKZm9LpuWKd?=
 =?us-ascii?Q?nNbOJQPjmHIf5l/Xyd4P3CQEz4FseBbqpsK8bedCtibrViJlqeE9qzP0x/ww?=
 =?us-ascii?Q?By44GPNuU4Rv2J6qa1M+TKDs7h8U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r7S7l0qfjCykEDe54aMYnPuHTjQrf7oeG4dKmf0PprsKf9sOuDEZxFY3+Caf?=
 =?us-ascii?Q?Pos2plUHWHoqyf1D+wDJ3514D31yJLWF6j5D8MU6ax3UKkuFOvllB0dnoxVX?=
 =?us-ascii?Q?itw14ZPIVfBvXRz9myYZ8qScX/XAtnA8Xe3c009zR0knaVeDXCK8LE57q6D0?=
 =?us-ascii?Q?xkqTo6GdsreH+p8ZReGcPh6usUP3efXKaHSEB9ytyYR8BHQ3czhkZ1s+uXgH?=
 =?us-ascii?Q?zLWr5mfdGw0y5jqaOyPa+HIfpXZc3SIfIX/smB4LkI8OAjaO+FabyiGoumPG?=
 =?us-ascii?Q?h2GMB4k9glw1eUYjRUiBe/m8Pbujy1QU6XbyQOXojHLUlocDfjzag+mKwQ56?=
 =?us-ascii?Q?4XKoDUElT6E7ady8DsSwZxL/ghTvXfdTFgh53MfnoQN06sDgK91qvDq/kKjg?=
 =?us-ascii?Q?5jn0F2LJqXRbYWN246efT+R6ttP65IizxCz8NgG6kG+Dz5TBodL6b4fMn5vs?=
 =?us-ascii?Q?9v03rBSWjlSYK6yB85TZ8+gUq9WMTZW3jv6JEH8QgngvD9WMVT1Cw0w8PUVe?=
 =?us-ascii?Q?jF/NK1mgr/M140dwnCb9jtC662ybexI0kMZ9e1l9uXSCVqckTBVq5anxpfDg?=
 =?us-ascii?Q?mxctnaqHNMPYr9e+Tx5mSWTy8nAIqRxiVmnqSgKDFq3nO7WiC6FFHggq8o3F?=
 =?us-ascii?Q?g/3L+6fGUCB8/Udd+YsijovyKOzuf7hT/+zcMAylVOi8qO+QZFEaDdc/z6P6?=
 =?us-ascii?Q?E0dRfpBTtpddJAEnLfRGcK8Nc6pvnAOfK8LT2pGoymzGBJ6UPulUJSS1/rs4?=
 =?us-ascii?Q?TzDYcc4/dbBvvrcr+rlRJNSzmSNwtFk5jfVNjb8qmlKcnLGexj+2X7rykQRm?=
 =?us-ascii?Q?5HPj5HDRGysWR+DvlOnePkNdRSEavHtCLOvLN9K3972Wnkr0IuAkBhlPnMFq?=
 =?us-ascii?Q?ZyBVEXi66MT8BgbkHh2yJ4joarhNDlbRALnf13qUW6BjFw2LI5pWqWzd4xIS?=
 =?us-ascii?Q?9JMtQTrTPATrSREKEywb5sVZxMMFSaWiq4nh92xDlaRyF4/En/2cbgZAnofV?=
 =?us-ascii?Q?2oGwnYUQnTyx6sKcErXUI14ugWZLSvmAq262wEKy/v8aq3J6NDEg43K278Nl?=
 =?us-ascii?Q?D3F/N+kic0xwUwtQEVR/p+oqmXm4UMzgdcKYJm1Mrn3yYn314uOhn2fGocJi?=
 =?us-ascii?Q?LoK0Qn73/zvqVJ1q7Nw4+kkEXQYfLPVs94CFjhc6eoUZQQmLbdpiw9qBPZhu?=
 =?us-ascii?Q?yITJocRhsQ7QDb9javebJAw3HR8CvOoW5x6invgbsW9xM6f1CGP94BH3us5s?=
 =?us-ascii?Q?2t+XZZj/gMxDYNK4FqrTyI9GeOOwl42mq/qERUGGERSMXPbGfF5REH3d6drW?=
 =?us-ascii?Q?qmMx0V3DBiFXt+7wWwnbcOV9RuGrAjiX6fxXru2ZJx/RrrEfn27nLBTYQjHC?=
 =?us-ascii?Q?GzRF8jVIjObpcaVlOuo4K4Nj9QKuatj6xVSx2hc0+WGFNhEYYNoPg7yjaRkn?=
 =?us-ascii?Q?P/rlu1TAKF6of6iGD413t/c+tEjIX9Cei6YGHMIVCiAW0KIFWenjw2+9Xp3r?=
 =?us-ascii?Q?qnneqAio1NWZgsFNUiXhmdBoWJqDIHecJlM9y3JCQJ7LysYiOVJ7+LnweFtO?=
 =?us-ascii?Q?h7Z4SRp+WSE6kNuoY/EWPe64OzXyR/5QYalevdsMfta/aI5LHwCuvGZhnxC5?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f29be38-915e-4ab6-e73b-08dd42d8e673
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 15:55:50.5494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 990V3PVCZzOQbkGyYBQLe9sEIv6auCtk0qR8eZqMaga4Y4wLVlvvFraK6IMd9Wg69QSnuMrqnd5sh0+oMj30Uqor8DF+fT5ZOTjG6YPDGp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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

On Sat, Feb 01, 2025 at 08:24:50AM +0200, Raag Jadav wrote:
>On Fri, Jan 31, 2025 at 02:31:38PM -0800, Lucas De Marchi wrote:
>> Move the xe_gt_remove() to be handled by xe_gt.c itself so the caller,
>> xe_device_probe() doesn't have to unwind the gt loop. It's also more in
>> line with the xe_device_probe() style.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 21 ++-----------------
>>  drivers/gpu/drm/xe/xe_gt.c     | 37 ++++++++++++++++------------------
>>  drivers/gpu/drm/xe/xe_gt.h     |  1 -
>>  3 files changed, 19 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index e519f435b1606..bea626f6b4cbf 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -743,7 +743,6 @@ int xe_device_probe(struct xe_device *xe)
>>  	struct xe_tile *tile;
>>  	struct xe_gt *gt;
>>  	int err;
>> -	u8 last_gt;
>>  	u8 id;
>>
>>  	xe_pat_init_early(xe);
>> @@ -851,18 +850,16 @@ int xe_device_probe(struct xe_device *xe)
>>  		return err;
>>
>>  	for_each_gt(gt, xe, id) {
>> -		last_gt = id;
>> -
>>  		err = xe_gt_init(gt);
>>  		if (err)
>> -			goto err_fini_gt;
>> +			return err;
>
>So it's either all or nothing? Can't we operate with atleast what we have?

it was already like that, this is just moving the check to be in a
better place.

But yes, we've decided long ago that it's better to fail early and fix
it rather than having semi-working driver in production.

Lucas De Marchi

>
>Raag
