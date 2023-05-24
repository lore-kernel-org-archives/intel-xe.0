Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58560C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 22:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5DB10E619;
	Wed, 24 May 2023 22:05:05 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7110E619
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684965903; x=1716501903;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RniOsoKW8T/PI4lgnb0EN66GTiCFk0OMxb56hPuWQV0=;
 b=UBlAlnxHTEAmNLmMw2zOC7gR4z685t7vy8N8E+k820yEic9+Og9uyySF
 iI0GKE8FJrb581ziSb1efPpI3IBygOr+rql3deuLCLDSc2/889L0c60V8
 VA5sQi/5O+gx3M34jS2ocirMTwb8npLW9RN1xWmrQDTyi6p6SyUwy6QtD
 FvUVpF0m7PibAgpUx12c590rm5P8OfQ//YvUbavh4D+YYpSt41EydDYHs
 FabFcbCBQ0t1MBIQJ5Qa15cZZQCJUcZCxDp+fmMUQ3gf9eIhALiOyr6gD
 DNxebFpTfnIvhuXlytBOM+zzrq48pDiYkEz1661YVlJw982Muz/MZFkAF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343166942"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343166942"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 15:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848932004"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="848932004"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 24 May 2023 15:04:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 15:04:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 15:04:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 15:04:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 15:04:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBTWOxMpkPn4LnW6dUuo1vQzlfsqMty3Qp07wnt60RC+yBBt4sHJHWp1MRYo6pp7mbm2R2A8SWA2gJF99PWVVCS7/423KxYV6ULO5whkeHBl+b76qS3rYuiDHrnuODvHZay3vno3zZ4oEX+ef5w7VEYD71gYt02EMyOxQ/6O1PoS+L23TMl9wktHKa/EGUyJhxge6rO7xb/vUu60We4D/cy1yko0hCT31tPcbYuLC4/VboOsunYTY/YmtEatQRO5XrbQzzp7H7kT8W+YSC6s6RUG21asveUMWwCl+y5UhfkIBsivlGc0ZYvoz0w9BluQ2NVZIzEq1xhxf+IGmnYvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfinBt7GIa5YASCPrKMM/puhgqYz1xy+/8Apg77NDN8=;
 b=EkszgqXt3dHB9YPLN9sNup75eNWFAykWjBQGJ+sEs+uusFpbJXEXLu+gHDMX4JS9yzI93M6G47Saf6GmKZmOnLeKSvkWMUHlDkNUTE36lpI7ySN3Za8m6lfDHiPNVgFAdQu6ameCeWmciQV6Au3j2bPcVs+yC6qnA7Nx7KgEO4cQBzc2aTrYfEGg56fhuUYL4Raqn+UOrN63DLAaoGht9UU3w64SLMi117rb7X4c5feX0JB+pHEewVoZ5+6jQMTqp9bt+8fuv4x5TGEuEA3Ou+8nXafmBumxlhawnQeruBtw69gfdZqkzCw36Yt8cEmEF3Z2RhMGFsUZBff59TywEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14; Wed, 24 May 2023 22:04:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d11b:9d07:8a60:9b7f]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d11b:9d07:8a60:9b7f%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 22:04:55 +0000
Date: Thu, 25 May 2023 00:04:51 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <7i6r6ecvx5cl3d7dxjzgbmsfbnnhd5puvybhrqc5pwnyo422sw@adk7o36gppwt>
References: <20230523135020.345596-1-michal@hardline.pl>
 <ZG3TL2NQko3finrY@bvivekan-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZG3TL2NQko3finrY@bvivekan-mobl>
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: c48e7fab-faf9-43af-aa20-08db5ca2e80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffJlE3WMLQJYcM9lArdDsfxI0LxQwbZG6tbRx/xedENmDL24h9gmknf9n/buZ+aMgPdf4TQp6F+lm79GLUUxPwgLyf5UBd2Dt6fCL11J5ks1B78tTapV5mv0sCRnRKNQ96lJXSQUTDlg21/l7Lyu2XqOZ4LqbcCt4fN11/upsj3l+g7NpzBLR0iKs4tK89XEbylUlkhk95vQQpttwP+lh3fx5ZvOHP1nuXX81XcgJ6QaBnBXML44EeiNz9sJNI0qa0GsKz1pYPFTbwlAJae1dWLpIk065XMWvk/CGxWMPpGTrbGibRcTw9jNsVESPDtKUKVBMuCOyC2u0PZ7SCsE1P8gaV5CsqVbJL+/0WbWioJUoScQjwAix3t06I4INhgu40P9zKJYTYwvhpS+lVuNDX4SSvmEDSb9FPEnZo8QRZIAhSDdPlXoptXuDcBioJWzjFwrBHEL77IbmsXzJUj6cEBCBPyk+F/DKxK8L+hK6aPCthpgkL01msEjJ8uD/h8iRscwzYnEHPS78T70Kp/hDqiF0sCYFXas2altBmyPTrCmN7xdKr5+FOXaQ6Y6iMyk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(83380400001)(4326008)(6636002)(66476007)(66556008)(66946007)(6506007)(6486002)(26005)(9686003)(478600001)(53546011)(186003)(2906002)(6666004)(6512007)(5660300002)(86362001)(316002)(6862004)(82960400001)(41300700001)(8936002)(38100700002)(8676002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkdUeGhPaEU3cDRwbG42czhBM0xKVEhSakVpVVkybG1xdWcwemJVczRHQ21Y?=
 =?utf-8?B?VldNSUZaRHhKaFVQT1hCc002Mmp2QzRVYTZZYUhDQjhpUEttQUQ1ckZiaEhv?=
 =?utf-8?B?TmxFOUoyTUZGbFNzOXdNa3hONEsrSmRrSHAxVVp0eThrYTEzbmJrbHlCUW9l?=
 =?utf-8?B?aGM4eUZ0aXBWTlR0REdPOU5aYUl4S1hDS3JGYTlSMnc1azVoaHR3UGUyZnY3?=
 =?utf-8?B?dXYvTUN2bCtnRzhLWjVWbEVnT1V2VzdieFRRV3pFSnlVNFNSUmExQzZkSFRo?=
 =?utf-8?B?WjhGK0d0QVg2dzhGcGJHc0I0akgwT1ZIZFdUVnR4ZmpuQ2VYZEVmTGRMcUlD?=
 =?utf-8?B?enB4T2JPcWdoT1BPMDlBaWt2aHZqa1BjK0cyeEZQUzJLSEtvS2RlUXh6N08y?=
 =?utf-8?B?RWJPSnlDZkJhSXZ2RGNKUkFQVlpXUWdvbmhCMi9EbFN3ejZqb1c2enYzV3ox?=
 =?utf-8?B?Wnpvam9JaFplNCtBZWhjSHVTbFpndG5CbnBFWFBPYjJzYW9VZFNnM0FGWEhJ?=
 =?utf-8?B?WGdNeERhcXoyVGJuU1U4ZHV0dzh6MmVBVVlYalhyWmdyWHNuUkl1UWdtUjlo?=
 =?utf-8?B?YVEzSGpURDdBWDFTbWlvM3dlaU5CbVo2YkphdUIvTTNlQkwxdXJIbFR5T3V2?=
 =?utf-8?B?Vkc3VDl6QWFqV1UxTDdQVWtTaXFvVFhnQlFhclFTaGVCVlJTeXJ2emR4eDdi?=
 =?utf-8?B?WWNhUkpCdkpDNSs1Y0NaclpTWWRKQi9NS0ZyTkJ6OElWUjJqL1VuWnViM2cv?=
 =?utf-8?B?V1M0QlRtMlNsQlB4MDJHUXhlalU4TTB4empBdFBuQmxqYm9RanB0YUNPYWtj?=
 =?utf-8?B?dEV1OEpFQ1I1Vi9oOUFFcDJCNHJheCtNdDluWUpGM1FoQTVhdTJCK2l2QVRN?=
 =?utf-8?B?KzBCWGc2SkNZZmpNMDNMWTFIV25relJQVWFOT0lDWmc1ZS9FRG13WHRqb0xt?=
 =?utf-8?B?WWdnMnZCWllqd2VyU2tSRThVbEcyejJQckdTWEdKQTZ3cDZwb2p3Q08yMmNB?=
 =?utf-8?B?VW5yMEtZM1RHNHFHd3pGaTZBL3hQMnlzRER0aFJLWWZkOTNoSXMyOVV4M09U?=
 =?utf-8?B?WDIzWUlGY3RoL2FsM2NsZG9LZEM5UEUzbVZYZU5MUmRVcEE1MnZiKzlPaEk0?=
 =?utf-8?B?UXBoV244N1pBTStZZDJwN1RVREljZjRON0pmTUQxOS90YmxjN3dBR3E4WmR0?=
 =?utf-8?B?dFFUd0hsZlljSjczbmRYaTc3b0wreTBSeVdXWmxwMUpOVVZ1V0lNc3FFN05D?=
 =?utf-8?B?MmEyNDFKWC84NWpNOVhaem5ocTAzRU02c3FtQUJRbWxpT2k5R1d3NHNNNkFG?=
 =?utf-8?B?KzYzWUhMRGdmQVNnOS9WQVp1TWZmTHVOeXMvbGlQdVhHOExvditJYWZPNXhi?=
 =?utf-8?B?WU1yd3JjdHI5WDFLNitRVExwdXNXL1lTMzRxQkFJM0pSOHJ6NCtLMDk0Qkcr?=
 =?utf-8?B?akV4RTNNNDZ0NjFibFIwdlQwaGxPbUcxRjVyaG1BMWFZdXFUY1VwRS8yNzRp?=
 =?utf-8?B?djJDTzc2bThOZzBqbmZDcjk5aDBNcm9zYXRlNzQrd1ZxTk02QlcrMStJT1J3?=
 =?utf-8?B?NkRpaWJEa29DZE1DNU1KbkFndTdDQ3pPUmVIVUpTUHJZbyt1MjlYYlJXQmFi?=
 =?utf-8?B?NFVNWTRNRS9QcGZ5L1Jwak1kcVZHWkhaUlIzQ3AzTWxmYll5MVBocW1mZ3NT?=
 =?utf-8?B?djc4aG1PQmcvQW5lSFY4UG1HVFJwMzk4eE0vNnVqUXMxbUxaL3NmaXgwdEZz?=
 =?utf-8?B?aXh5RjZqZ0NBN05ObCtuLy9ya1hUNlBMVS82NXBSZG1aZGVIWGc2ckNaRzIv?=
 =?utf-8?B?b3ZjSG54U1FtZDkrQ2s0Q25kT2lMWXlHT1Fzbm5FME10UGZkeC8veExwZVI1?=
 =?utf-8?B?aFlCUjBJYzVDK3Q2WDZHTjBSUElZTjVCY1RodC9hTXd2RFRLNE5vaG9UQ0dY?=
 =?utf-8?B?LzVhRklmVUpiZWk2UUU3c0RRcVZ2VGZFVVdkT0psdWlqeFdEallRVGZFSHlM?=
 =?utf-8?B?cUw2WDcwNW5qa29FdUh1WmNMc3EwM09LVVBHbVErUE50RmU3QnVBb1ozUUYv?=
 =?utf-8?B?dTE3RDNTSTVQYjRqREJURktIUkw4NXNKSEl1UU4rajlZY1BLelZrcXRHcUNm?=
 =?utf-8?B?ZzZTb09LRFpiQzRXN2RjUTVBSHdaN1NkS21rWG90Y05YTmJkUzZhb1d2Tzl2?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c48e7fab-faf9-43af-aa20-08db5ca2e80d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 22:04:55.3448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQDERpdYMH7LTb1HCSYbUxf9UHgcWP9BTZYet2XxT0R6mXnCGdOmF/O9czU4x1cTziu2KvPgnvKdz5l/XqYoy4EHNHb3csDLGuMQheLTHWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Fix uninitialized variables
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 02:34:47PM +0530, Balasubramani Vivekanandan wrote:
> On 23.05.2023 15:50, Michał Winiarski wrote:
> > From: Michał Winiarski <michal.winiarski@intel.com>
> > 
> > Using uninitialized variables leads to undefined behavior.
> > 
> > Moreover, it causes the compiler to complain with:
> > ../drivers/gpu/drm/xe/xe_vm.c:3265:40: error: variable 'vma' is uninitialized when used here [-Werror,-Wuninitialized]
> > ../drivers/gpu/drm/xe/xe_rtp.c:118:36: error: variable 'i' is uninitialized when used here [-Werror,-Wuninitialized]
> > ../drivers/gpu/drm/xe/xe_mocs.c:449:3: error: variable 'flags' is uninitialized when used here [-Werror,-Wuninitialized]
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mocs.c | 2 +-
> >  drivers/gpu/drm/xe/xe_rtp.c  | 2 +-
> >  drivers/gpu/drm/xe/xe_vm.c   | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > index c7a9e733ef3b..ec82088b73f0 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > @@ -373,7 +373,7 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
> >  static unsigned int get_mocs_settings(struct xe_device *xe,
> >  				      struct xe_mocs_info *info)
> >  {
> > -	unsigned int flags;
> > +	unsigned int flags = 0;
> >  
> >  	memset(info, 0, sizeof(struct xe_mocs_info));
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > index 0c6a23e14a71..86fd1025b931 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > @@ -115,7 +115,7 @@ static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
> >  	if (!rule_matches(gt, hwe, entry))
> >  		return;
> >  
> > -	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> > +	for (i = 0, action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> >  		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
> >  		    (action->flags & XE_RTP_ACTION_FLAG_ENGINE_BASE))
> >  			mmio_base = hwe->mmio_base;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index a0306526b269..109a5d93be89 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3262,7 +3262,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		if (!vmas[i])
> >  			break;
> >  
> > -		list_for_each_entry_safe(vma, next, &vma->unbind_link,
> > +		list_for_each_entry_safe(vma, next, &vmas[i]->unbind_link,
> 
> This seems to be an unrelated fix. Can this be separted into a different
> commit if not already merged?

Unrelated to what?
All changes present in this commit fix the same "category" of a problem. 

The commit fixes all 3 occurences of using uninitialized variables.
In this case, vma is used both as an iterator (which is fine) and
container (vma->unbind_link - which is not fine, as vma is
not initialized).

Are you asking to split it into 3 separate commits?
Or are you saying that there's something special about vma in this
particular case?

-Michał

> 
> Regards,
> Bala
> 
> >  					 unbind_link) {
> >  			list_del_init(&vma->unbind_link);
> >  			if (!vma->destroyed) {
> > -- 
> > 2.40.1
> > 
