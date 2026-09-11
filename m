Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67E5C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 19:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9991510E363;
	Fri, 11 Sep 2026 19:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYyAIeb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CBB10E363
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 19:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789156474; x=1820692474;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wqhGwRQARxCPHajlsudBbu0R7JlxJo5RG24RPcELL20=;
 b=gYyAIeb6q3dTZoKMrEHyCQ1qghVfFjDxXDdxVEw07T5JDpKS64PxlYl0
 sSPq6EuswzbGjjDAPI+NTfAl1M1MCiDxp+5ouNmGLB7iKvBn7bwKXgaTz
 ZrLb/xrR4VQua/5aiYuVhlCFs659EV/nWSCnHawpRFaLiOGB3Gkx/dhks
 CDW8INYMu5SoFVtZODjdhGBF9n1QcZMr16vQbhF65tPywzNxCAQObGt9z
 l6Wus//9d44jaohz1d/HoPv+RNuRHClxfNj5OFcWKANEpLMtIE2zQiUWd
 VZwzwfY0LMleMxRcxgESEW80wpP4uNLSEuKPSiOxh43ES+LzpFEXaYl4C Q==;
X-CSE-ConnectionGUID: md7vGAoEQZOwlLZspsflEw==
X-CSE-MsgGUID: JOO1jsqWT8qcUNx35oqouA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93494723"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93494723"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 12:54:34 -0700
X-CSE-ConnectionGUID: bgGYzhbzRm6EnB+EH7zsAg==
X-CSE-MsgGUID: kmYGs2rrSySAoZa8WDolXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="271983541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 12:54:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:54:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 12:54:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtK8nxvrIQ+hy9dq503c65Yqy4lLxbiQQyR+TWgIfz45IP/Z41ATJ2ywTBr4H5asKL7KUr9zJVxHXT5Mk2Bw5hXSIOjyZggqAJoKPBL6uQVNEAPwBETr4HPgJ0EpyI7+h962IqUOeLc75OyFu5ZhBjfgv07PIVxxtUgNe99JrkiKx6ztiM0EMthzwzftOBLJILElchaZw3t7XXlxUQzsb7y0i1P0pgcSHQ4iZ2WwiRaYJr+s3BdJagOJX2yZG5NLtQ2ng5kWSCSPGZ3zd9w4WSSPSMU9t0D/ZBnvw8lnT6Sr1xOcfAWa66M4ttWC0VPxJiQ6B82belE/c/b7MjYl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBTx5f1eVgqundnBCK4SeU7hy/4EvoTgVdgthTW+0Eg=;
 b=bpDPXMfqX3ifhyb/O54CpjT+253iQVJjLAJpQLQO1lPg3nNPkW6vXsblj+dyIT+GoEcyKyr8Tx1/qvlJcSurACSRridKO+gQYdYsw75fsPeT2hj66amEBDjySkrB+C3dsY6CfVVce2FBYkkXkq/06LJkU5W7v1NWS20Ph/JZhTNEaqfVV3ooa3I1lPBa6M90Y7jZXXwS/xjyFaG4wwfKKklRWk2UAnRQI22rEbRO4qUtBUfpiHbfhSM967ni/Wcit07Xej6wsW7/AwDoVXRkfcYfS1GtJjBjNzpBceLkBhlfxBf9+hiSXffXEEY7fd/TgL8tavMKEmCk1M3xbfGEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 19:54:21 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:54:21 +0000
Date: Fri, 11 Sep 2026 12:54:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 06/24] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Message-ID: <aqRca7kHxdojgb3Y@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-7-matthew.brost@intel.com>
 <aqP9wLOjODgyAjkl@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqP9wLOjODgyAjkl@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e411f3-d9a0-470f-045b-08df103e78fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: ODaO/BNS0oDdZ3HFL/5wzzf6QReKac5MMQslCQqgWFDoJfExV0HF9DW1V2isbRNGHNQYBRF6MNn1nQHgEpooo9QgqZ+0plbV058OIpPKB9pR7Yq+q4xgBnKLh1i9QmCnvBMA9+CrFJQRVLYwU0JJtJII97g45m4bUq5gR7fRbfHNvisqSw7KRwZVHTZ3uCn0xc9aR9rIV/6gD8V2tjxmXY2yrLAp5FAZBcKRrwpK2jXUxYLVy+SsWu0UNSsUgjXyFBKAFtH1qSD7hgPdQ2zDbHyLjNuJVjk6TfnvzltlrKry1SkLOetlGKaTZEupNjDiMzTDLlLIHXmcx9kCsGNq7KVf4gknRGzT86t5r8z5ZLgZuGurdCNOD5ECLqeD0zHMUi4lOX9cdIxi7QDYV8ZVUnChni1TraNim7TF1vX3VaUdTIfM2O11KsEIxqb7oLd1p8PO9+cCvTFgNw9GvaYhYpu3gUDvG7KXmPoxKJHCGs1CSK2h2weli42MukVMs6CUPo/V78MR/2cKhdrOmHSC36lTwGVzMoAe4UbSAdZvUiQ6eb93DDCoUXXwrKlDevEZw9RuMHuZYAGGdyAxxZ1y06fZ4ZiHdED0JH9SZ/aUXpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0lQSTY1OVdqMVRRU2Y3WkhZbUw5RkhmY2dWaGlpSmI4S1NTc0dqZGJhK2xB?=
 =?utf-8?B?MEtQZ3BQUVE2WmJNRUJHM2toSkJndG9KMngvUzJjZjd2b1NMaWVBK25GYzh3?=
 =?utf-8?B?OFI4N3FKV1FvSUIzRkFNWUR4ZDJFbTMrREhnTitjNmdFTHA2dDFqVm9namdO?=
 =?utf-8?B?SEpkdklQOUlCUUcwNFlBT3dqclFaZVorRHJyVGplOEJ6cm9OcHpnOCtBOUZq?=
 =?utf-8?B?Y05hZmdiSEs5YlJ6MHNPYk5US005NFNQUkswQWZWV1lIZ0R3R1Z5OFZVNmhy?=
 =?utf-8?B?YUpVeGdlc3hlSHovY0NZK0wydjNQOXdYa0srdXo2eUNydXdlbUx1d1lVUVU4?=
 =?utf-8?B?YzNSZ0RvbkY0N1E2REFaYjl1MGh2SjJJcElpZmVUdEtjdGwrUkt5SStydHlM?=
 =?utf-8?B?U1FIT0NPSTNSSEZDckVmUG0razFMKzdlQ0VvYmdtSUdKcUxGL212R1ZpeEtQ?=
 =?utf-8?B?R1BXakhRQk5sT2w3a2RKRVFFeUlueGNnOXdmeW4zMXdpQWdka1Izbm1EU0JW?=
 =?utf-8?B?bUdiaFZvQVFiNjZUcU9VTERHVU5JL1dWeEhRZ0ZYWVlnLzlzbjlyM1B6OFJE?=
 =?utf-8?B?RkFnWFQ3OWt5Mm4yZHNJS1ZBWXh3V3hBY1BnamYvVDVhMEh1K3BwbVk5V3ZK?=
 =?utf-8?B?dnRCOVExK1RrVm1tRkpBNnUwT2EwYnc4Znh5b1ZubUh4ZXFabCtzajZZTUxx?=
 =?utf-8?B?eHV1UW1XU0JSU1NuTjgzaitVYm1uZnhMMHE0WWZTSWdFbnR2UjBlMys5V1la?=
 =?utf-8?B?N3VQMzN2WFVCOTFMc1pjR3JlaUJaWkVWVlFXalViTEdNR0RJZ00zZXMxZkxn?=
 =?utf-8?B?Q2kzT3ZVM29wbUVWREVDR1VmbFYxaDgzOVZ6YzBHVnhTSFNLMGoyeFMyc2Jz?=
 =?utf-8?B?SWFVNEkvcGd3MENGRzRUNVp4Sldmb0dtWlNUMzZGeHBFMFJ3NTFsNHd4bENs?=
 =?utf-8?B?dURNV2Zub1pBVHJaWXdWMjl1alRld1UxY2F4ZUNWSEJSK3kwUnhla1g3NjJu?=
 =?utf-8?B?VW9FMUwyVHIzcW5MclFiV3JVb1RqZFNIc2g3d1FKTytiaEFGLzZwSkpPQzA2?=
 =?utf-8?B?RExjczFYNSs0a3h3eVVkNmM2dEllK0lGMEFIbzdGaVBlOGNMN2JOYXZJWk91?=
 =?utf-8?B?K04rcDBDdlgyRkNmbnJ1dGZBUGVqT00xTE5OUnlIOTA2dGovVXUwbis1Znh5?=
 =?utf-8?B?YkxxU29CVWxteERpNCt1WXZhMitEWW5xZHplVm5qZUd5bWdIQlA3bGZaQjJ6?=
 =?utf-8?B?aWJzUDFlVFBoMmxNY21KLzFta0l3a2tsT1FJQzdNWjN0K21UWGhVYlhSWFFL?=
 =?utf-8?B?L1VsRUl0b2diNmd1L3A0cU00Zjkza0xtSlFsUmMrUitLMFFHVmFRUjhxUTNF?=
 =?utf-8?B?MlN1UWNTakRpdmloanEySkxpRjl2MFlOcitnSE56VEtEb2tPWGZNZzVnQi9M?=
 =?utf-8?B?clhkUEhndmdRSGkxci9SeUF1UjI4UjVLQmkvd3NqMkwvL2RBckQ3OWRSYjZD?=
 =?utf-8?B?eXZWNExMSDBhVHhLNGF1WWluWThuczgrclRsaFQ2ZHhZQ2FMNnkzK21uNnZV?=
 =?utf-8?B?M2lnV3V0WDdwbmxlQjc5S0xzOXRXR3ZFRVBCcEQ3RWVMck5uWGdBemRIanNv?=
 =?utf-8?B?WGdhaW5wWitQeW9mTXhkMGlxUm9pbTBQNzE5WlZqZk94bzk2NTR4T1ZmOUYy?=
 =?utf-8?B?VzB0b21zVktBTWlZVEJJZkRFa3NmQmtkSWpLa25kU0R4N2d5VkxpR1I2SXdX?=
 =?utf-8?B?K3hKWjlRdERmOFhEdzhPa1dUdmxPcmVmVDJBam9CZXFBYW00YUZkbUlxbE5J?=
 =?utf-8?B?NzZxQk1Rd3h6OHpja1Y4SlpOVlVMUG1aNjh2US9pS0RDbGpGY3lUTVlOeDJa?=
 =?utf-8?B?aUI1M016R050Vk4zQmZldHkveEVQakdoN2pzMkNGVVl4eW9FcXhUNk1uOFRq?=
 =?utf-8?B?SG1URmxkbFF4bTYzaXQzMFZJOEs2Wm5qQndTVWFMSTJuVHlVckhMM2hnQjYz?=
 =?utf-8?B?UG15WDRNZnp1UmhwdzBtTFpSbUNBeXpWb0c2ZmVGNDNqK3oxRTViV0VpWkJi?=
 =?utf-8?B?U3ZhRFhRSEJWbkJpNW85UXVtK2lVSUJJK2syMFNXVG93RGsydGtteWVPVTZs?=
 =?utf-8?B?eUE2d1dTRDVkeXR2clB4NjY4UXBCcUxMYnNybzQ5TkVJNG9wbytWbjFZZTN3?=
 =?utf-8?B?ZVJtbHVkQjQrdVNCL0NwcVkweTczT1BHMXRoUFRnNXNuTHQ4RGVIeVJwNmhI?=
 =?utf-8?B?VWIxZjNidngwVlNZekpYSmMzZjRxbXZjYkhRVXc5MGJCUXZoYTJtdHFIdEFx?=
 =?utf-8?B?OC9KQU9tRUxudjVHbGZadzVhaHhtbXZXbFpNREFuRGErajAvYWRrV083RGk5?=
 =?utf-8?Q?IKbOb/5dPCG8joGM=3D?=
X-Exchange-RoutingPolicyChecked: GNKb7jk8a8hKa/Y1PO5Dg6/XLofMAjBz/VPmnHHqJlswauy5pMdWVrQLKavITLyNSj4RHCtw8cTfy/BK9YAfGwpii4mrZodSyq7XD9+xtELWRPhHoVHuBv3gxrwu/Z8Y93Bh1QWykLVj38upiwwsQQMBsJrvHmgexS8XS775c3OQfYyRbh7aTS6mT8MqqfUynqLkN2/xR8B7VCFPvhvo8ono3eykwf9Ex3pcByVueEho4plIlL8PPbjrk48EtJzRJc90whgc62WksNqQs8N1KnzmiI/6eu5BrvcoGvBsOsLlH13fm40dP/cyOzGiaqZLVu6tkAgTxskJifSFAXYtLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e411f3-d9a0-470f-045b-08df103e78fa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:54:21.5838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPxyopjZ68NT4fDPZaQIBxlj4PmtCCxNW5pX2H9VVMTGcn2uh8Ir6VoC0noxIqdNC6MVDcLe4rmROFgwj/3Pgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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

On Fri, Sep 11, 2026 at 03:10:48PM +0200, Francois Dugast wrote:
> On Fri, Sep 04, 2026 at 02:15:55PM -0700, Matthew Brost wrote:
> > Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
> > also drop an additional reference to the BO’s VM. This is useful when a
> > kernel BO, one that does not normally hold a VM reference, needs to be
> > put asynchronously, ensuring the shared dma-resv object does not
> > disappear before the BO.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.com
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
> >  drivers/gpu/drm/xe/xe_bo.h | 1 +
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index b162753cebb7..aea4b0fee8e3 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -3998,8 +3998,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
> >  	if (!freed)
> >  		return;
> >  
> > -	llist_for_each_entry_safe(bo, next, freed, freed)
> > +	llist_for_each_entry_safe(bo, next, freed, freed) {
> > +		struct xe_vm *vm = bo->vm;
> > +		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
> > +
> >  		drm_gem_object_free(&bo->ttm.base.refcount);
> > +		if (async)
> > +			xe_vm_put(vm);
> 
> You had mentioned reworking this part:
> https://patchwork.freedesktop.org/patch/750807/?series=149888&rev=6#comment_1383757
> 

I reworked the PT BO reference count reinitialization in the PT layer. The
Sashiko feedback was not correct in its original context, but it was
right that transitioning a BO reference count from zero to one on the
driver side is unsafe.

This change follows patch [1] in xe_pt_destroy. Compare it to the prior
revision [2]; note that the kref_init in [2] is gone in [1].

[1] https://patchwork.freedesktop.org/patch/751032/?series=149888&rev=8
[2] https://patchwork.freedesktop.org/patch/750792/?series=149888&rev=6

Wrt. the comment about ttm_bo_individualize_resv() failing, if that occurs
in ttm_bo_release() (we get here from drm_gem_object_free()), the fences
are waited on directly before returning. See the dma_resv_wait_timeout()
for 30 seconds, after which the BO is destroyed inline if VM lock can be
taken. I guess the VM lock can fall on a trylock, triggering the delayed
worker...

We could look at PT BOs holding a VM reference until xe_ttm_bo_destroy(),
similar to user BOs, but there is some convoluted reason why only user BOs
have held a VM reference from early on in Xe that may or may not still
be true. Let me see if I can make this work as after typing this out it
seems like an extreme corner case of posisble memory safety bug. 

Thanks,
Matt

> Sashiko seems consistent here.
> 
> Francois
> 
> > +	}
> >  }
> >  
> >  static void xe_bo_dev_work_func(struct work_struct *work)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 01975586ee88..2168aac1ed1e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -54,6 +54,7 @@
> >  #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
> >  #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
> >  #define XE_BO_FLAG_NEEDS_1G		BIT(27)
> > +#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(28)
> >  
> >  /* this one is trigger internally only */
> >  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> > -- 
> > 2.34.1
> > 
