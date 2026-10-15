Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0247CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4210EBE8;
	Thu, 15 Oct 2026 13:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E1210F0A8
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792071383; x=1823607383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=icudZ8HQqHDq1JGR+Q7Rl+vCh/el4RfTvuRdecmi2fI=;
 b=ZkZOkz1CIvOYoxgdyesMimC5ei7TrvhhPc8HnGoyUD+rudSgC2cr6tlb
 9Q5fydDbjg8j6mLZZYrKzZSJky+yE98BkbPu0cfn2zPkYjcRhT2ZG1wQF
 idMcp3yy1+2KejJ5vyNTOX6m3pghea/JZozvbtQpcw8/fm4L49rpgv9Zk
 rQqhoI3cQUfrcZa1Tg8Y/kchksb3zCvy8kW6E1qq/rVy7ia50zhZRTGUi
 s0CUjB95zVsYeHueM7TJ7EZFKva5G1aLsDcv+qctqLxUzbJGeJi3IJWV/
 NBU3jQQX2JGA94D1Ao/QbWyIQmHd3glF4SeACDIr4NANp5O8IUzl8ruxu Q==;
X-CSE-ConnectionGUID: YVIKxM6iSLCSuS3vUitACg==
X-CSE-MsgGUID: Ai22Dmo4RB2m1uyYLWRTeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="713360"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="713360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:36:23 -0700
X-CSE-ConnectionGUID: QxiWF5U2QC2NG7uLExGdfg==
X-CSE-MsgGUID: H5fpgUJfRCudwnOUINwxdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1769019"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:36:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:36:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:36:22 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boPHOWeUUrxJNS+aWcvSGZ+vAEZcdKCm5HeXr2w+xnoEf2OK7X0eUFM2rEXuLAJqcyJDygSyi+Ec4b2QLIi+EB/YcRfDh8xEjsf8dnRr5iLmtNI4DOoMPl1mGlapdTebBiucvcY1ExM9q7fwmE7Ds8E+1z3rImNo0HV3H4/Szr3OGej8CRJBB/4fVDsOSNJ9Uz1fqd06Wy+GLxv+nh/BH+ly7gS1rgkiHenT9kZyR13vJui774VgUDFNNwn5fTfhJUQmj0cfkK4wxLX3RGOmQ5DOupKgT0UT0/zqbgM26ehGnGUxiHKf2I/qWhb9Bv9ULcO6/6c6JadicR1AmRtsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqVYbG7vvV8TSHfUzozllbhkFb7qQu0k8Z2yLaZKup4=;
 b=x5MtFzFuhNlNi8CSVRDNJnixdb3cR+EcuBoAuVdE5zrND1eb0QqUhThdDIU7exxJrDAk5KaK+8b2chVo14X4hISW5X0ASxPn0gx82D4JxfMGVTR1I44X/oItLCKWXN9uHWrNaF68ZOjOXnU4kfJias3R2/qWodLzFQMq3/PS4gjrs+bMhnGGB26NVv9mvUsmmVsd9eXUd/FObJWe3qtJBxn7lMuhTCF0RiSINfXBe7MPENqDpgNdZr//8Xv3t9F6Jw53stnC8dsrjipBK70aDJqB5Wvxa27s9THeo5kJD/DiIgpC7C/G70VA7gRMMRvAzGu1IiHIG5FxCDAhfADQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DM4PR11MB5262.namprd11.prod.outlook.com (2603:10b6:5:389::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 13:36:20 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 13:36:20 +0000
Date: Thu, 15 Oct 2026 06:36:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sashiko <sashiko-bot@kernel.org>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/madvise: use already clamped pat_index
Message-ID: <atDW0mXoGFTrxRVa@gsse-cloud1.jf.intel.com>
References: <20261015103415.442931-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015103415.442931-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::32) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DM4PR11MB5262:EE_
X-MS-Office365-Filtering-Correlation-Id: cd731b0f-34bb-4d2b-ca78-08df2ac14bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: nRvs0wDKXuN1dQgFRSItupN7/PCCUeL8WO7vOlCNlZi6VaWegoQtAKwOAqnSD7uYi35rjFKN36b3xoxZeYgdPgA8ZW8Wo+s9Yg9JPLzuE/TxcM8cCyyRaBbpI4GMpTP7EkZgbvTH3O+0q2CuoAQAsAQOr+UxQDnaLspcRUbYobZMrLOIj+irZWzf8REHPcRW2UTLwsPOaWt197GXDOMMwxLiHHQGoASQcbRZXyH0+RqhIzdfteZZDVufNpqOSHlKmEspVpyUC9IWEmFkCwjg1CZhZspKvlJPsQ8bFwJ7P6CG/j5YVo9Pu8M461OJyEZ6u7PkAlpqLHvjwVFXHCIJPT2bUIJC4MksinhKh9da2pudWs4wDIjZElUSEtJ/ACAPrHIlTFjPfCTiNxZCgEbelq1Jlp+Hc6UypldH8ImBn44mwfCDPgniuRrQjq02p0rs0rIsuZ6oosRHo4xL2wQOTc1vQ50gBZ2WRfdPsVeaSQsbQjKneHzGv1pHQT6RkdrnQsOQQqP/sEuCifpINbS/+sC080iHeoF1Qo97FNXTg/GnmUPaT3c1eFJ4SIDyXNmNw3NFGtWiDQ7w0K12vTgYbDiy7EeOzTl6JafTwSm17FY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2lDBZTGUYZraws3umkMuLm5kwkgoUNkAWclkD4nBYK5tPC6AiFKkFcW2n7di?=
 =?us-ascii?Q?ISlNnmTX32eVHat5en6A4dS3jcPm2NnL2MTMLBHHc7skx+q2FCcpkVQrSonF?=
 =?us-ascii?Q?Jtwtwd7rnDhzWqLcpkR4e4q8CGOI537h+u1mkKM6RNfCJMcxcXzXZibX7RkC?=
 =?us-ascii?Q?zqZZY1/sYIaG99R5xkUEtw2KbaQexd/ZSRo5fLe6e8KBpVCE7LAsfm5ERZBW?=
 =?us-ascii?Q?8Zqs2VIE0JNYuKx5qYOVLLtunk0WPn9D9DlS99cKRRxuYOOeM7bb9MQjB80k?=
 =?us-ascii?Q?IeaJTvQX8c43B8CPsoJRjI9+9EFhDyvHvuCKj5M6hLbA35nivqYEZjaE4seF?=
 =?us-ascii?Q?EtLAvSHEMsOWVxWWPEyHgjZ3Oa9O8wPCXEAunV8fAsSWHpg3c1DIW1pz7v3q?=
 =?us-ascii?Q?9HqfHWKti2ISxXabfX8UBs8j+RpegFIS6NTA332P2vXkmrpoRdbvfAyYYcWL?=
 =?us-ascii?Q?anFgcE++j2YS9ERpa1aCYtWG7GnmVaXSWJWnH7g4hDHSA2nJOb318QsPCItF?=
 =?us-ascii?Q?VjnYOOzPzWabU5JxestZOvI56X/y90KMjDy6xus3aMZcqqnpMPnWeiDIhVBU?=
 =?us-ascii?Q?2boE4Q45Z3lPBKrzubP5hqGmwc9kT3Np2iAiEzZDdwpXJRNPDezplGe3nJdL?=
 =?us-ascii?Q?DCaPivIGPnCfQao44KTSHPCTG0lRAoNWjk/EAa/ou9mAaDAJ0xmxUfLuUE6e?=
 =?us-ascii?Q?KjEGahg1BAtfroxgnw7KZIT+3T+vrtJ3AwyWOAQkXjRMszSLLlzdrHLdatlt?=
 =?us-ascii?Q?2BlvmlXzTaBXNTRfw/2LM+2gxt1TDGuPwe95GzHuSJ8t+Hmd2jAijD8zxRuf?=
 =?us-ascii?Q?7k5ukhVmVBnv36TVcfQTKq+1nyz1CKHqt1IOQn3KkCPJh/59/X3zngcI0mOk?=
 =?us-ascii?Q?ZWR50qvYIAQ3JYiPSP9NWFhx/4KWBrwfUw4eFIFgiV2KqnURGV+P9AK+oT3V?=
 =?us-ascii?Q?o9dCtEZIYVFPCXVmOq/dAIYgIUtZgj3zswkjnQmC2OMbpNdRytxBhxYIQ1BZ?=
 =?us-ascii?Q?mGQQ9/yNX128fV5JepleqYUTsoB/wf4K6HkmrMNFL+WnX9/fCVvLVErRoaEa?=
 =?us-ascii?Q?s4z/K31DLs4/CmRoLwUQGH3hnmt9jOnHU0lv7/p7EHUhhVsPGNtU5y1ty34b?=
 =?us-ascii?Q?XxiTQNel00djD9LP5p279Y7muUghmTQJ4bIR7CzuGv+YZKvKy9cVQfWS8uFu?=
 =?us-ascii?Q?CHKz9favq5WK8IqdS/G3/5c9j26Gs8f4VUBk+cJSFXuvK+edv7Tl5UhhpUqf?=
 =?us-ascii?Q?CPooVR7mm7LNZf4x4eubtdAOlnzztjGe3DzINFCunm35fNxIkm65enqKj3In?=
 =?us-ascii?Q?VgvxcVICQirzpPG1QQi834pmEwlBBbhox5w9CN8eh6DT8XDks3PSeqYHiClu?=
 =?us-ascii?Q?pCc8yvAVSPrrwHBnfGrmuNI+8PeDpAgKW3y37aONfgOcCFlLiRME2thDtoQR?=
 =?us-ascii?Q?vs/w+V29gHf+jIrEV9P1yXZowlasT+F+Yx+gItHB04hl7oV+SCy7nXWXpl8S?=
 =?us-ascii?Q?YYThDmLLL258/y6qgI+2BejQ+qbMeSI8qHNxa7/Tgb/q99+BWlYx5qaQ2fPk?=
 =?us-ascii?Q?CACTv1VjW+16I/LUNC3DgaLeogXiP+TmDrMtgy2JfDlU0ng+fX9wjxZ022Lk?=
 =?us-ascii?Q?rpWVtY4prwSdb+pRvvxiEFkyj7Gycm9LpFxYRzmVJUy6LgDGXaMkui2PW4CS?=
 =?us-ascii?Q?PHqtmDKi044DuUWyoQsrqjW7Gsn4Ff7W+BtGDmt6NDX4FTQzPh6eD5qddosJ?=
 =?us-ascii?Q?3ylgUNFbiA=3D=3D?=
X-Exchange-RoutingPolicyChecked: wr6BuVIP6WZ1uYBIyC4RC4CLyhckV5U/4LyRqfqqlJtuK/fZpYTVkz+0ySfLm2VcS/v3E3jDcDrbsVieqmeJUUwF9+7iWLvluHXzUpqYuyySwPpMU5uqXMBmoA+m/00R5NLbxtfmdZLZf64f8bAmpiZF82gZpqIUZb3BIL1DPwc2i/W4jhM9BI5l9uEd/79z1hjMK4PGaxRSSE0G+hQrQKrSSS4pjUJoAzyyiFAbk96NO4C3Asj3Gztaywh4ca2NLqPMgcFZG9PlGIeb6nvta0dhkklRKdB8gmVD8J4jim9w3V+RAKKpDeuHTUkcMeXnKI+uY7kJHDDjlRf/nn9JZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd731b0f-34bb-4d2b-ca78-08df2ac14bf1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:36:20.2456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufoE7EiJlC6yI4gk61yH0Egnnsa38wrPnUz9btb81Ud+arKC20ugJ0iJhnKQUT97h7KYSeWx8nLYjK6OFnY2SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5262
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

On Thu, Oct 15, 2026 at 11:34:16AM +0100, Matthew Auld wrote:
> Pass the nospec-clamped pat_index to check_pat_args_are_sane() instead
> of the raw args->pat_index.val, and fold into the preceding
> DRM_XE_MEM_RANGE_ATTR_PAT block.
> 
> Assisted-by: LLM
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/sashiko-outbox-172627%40kernel.org
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 5c7aefc641ee..a835cc55658f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -659,11 +659,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  			err = -EINVAL;
>  			goto free_vmas;
>  		}
> -	}
>  
> -	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
> -		if (!check_pat_args_are_sane(xe, &madvise_range,
> -					     args->pat_index.val)) {
> +		if (!check_pat_args_are_sane(xe, &madvise_range, pat_index)) {
>  			err = -EINVAL;
>  			goto free_vmas;
>  		}
> -- 
> 2.56.0
> 
