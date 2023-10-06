Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D07E92FC5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 02:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B001810E4B2;
	Fri,  6 Oct 2023 02:08:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069D710E4B2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 02:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696558080; x=1728094080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IdUUMoAhiIfKyt/T5DxDtlbmtDfEYBLuXc0o3o54N+Y=;
 b=JtJUNrZu6Mswj/dd9viVHMdvM7OdyAApy5yr6Lq8/fbVWKTu2cK9Cy/d
 JEfPk3aaJHVWkMsfIfimLdwHpxZrnFApXktGdxi9Z92SvOCXsLHP7wlaY
 KMkQwTYo3uvs+FllKGCweWqJznb0Hfv9Gq4SgpcH/vYm45wft4z9OSaW5
 dtEjj2euup2BIMLtHwIrvM6D+3NHbw87G5GVNEwEKPTTiU1mwQT1ORZct
 FvRMGI7vcDKQFE6S8Hn3AWZFUisA2sbN7Ds137lnasQLQID8qTDrXvBzS
 0Tahs/TU7ykIBUgNH0HGXSDE6ySRcVqmJeggh9sHVZ9xYpAIZhKWDyFK7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414646743"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="414646743"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 19:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="752028618"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="752028618"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 19:07:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 19:07:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 19:07:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 19:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+u+AaPo8pa7adW0ca2cedfoj7w5soF2uyNxOJQkK/hU3cwlqpLpveM0eVG1v7sJyvkivUvavUGQRQDDGoYDSqK10RyxWNYn8pbcNthedWZEm+tezeFky1k1LsXRRyQcfYClQX7D95kidv0cSKUvN4vcdYNH0Q5QHD7Mrx86CyLtKg/4rwpU0Im+ch0HfxF9i6Aiwg2XP8D0EYzeEMpDpZTNRtMQqkQqiDf3fQbQv5vaeGxUdXtKlxVp/PnvElbNKjfeIRoNpK7jor95ieTAuRY3bekt4BQt+Cy+axOw6t6t3BfMKcB9SbagDceNdxxOX3vfLpd7wB7eUnBXJSgzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6mqhnNgEUu2LtBBV+dGUSmnngIKmds60m+nXAD7QjE=;
 b=OuOGB/LKTvyM0BPeK3GntrMlHwOAEMSKIfj2HrDdGk4l8uymCTv7elalCZWijaxBuS+vr96GsyzX7XrQQL1NmgHHAfbneg7ZbmBRtNzKxsbWTQONcTQr+z2Vu4aY08cPtQyIt8se+UUliSSZUcS5S0RaccFxpUe/3B7BIG5ANJcQlv+og+ROBghHOcmIWv1HoHCBfQwvRGuHvwlcHZPHdM34KcIjIuwKCNF/qeFSyimVjzI9BLlR9NsN0nJGZsuSQywIgeqBWFUoWb2MgMMrsL3CGbMu+8FFj+1Fh4mi2BvZAKKj/8aLFQ3QQDTmxxQyGPUkyh4q2SH1E3k2NdrbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.38; Fri, 6 Oct 2023 02:07:57 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 02:07:57 +0000
Date: Thu, 5 Oct 2023 19:07:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZR9r8N6wz1TFTplE@unerlige-ril>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril>
 <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
 <ZRb0uavwuieKeqVy@unerlige-ril>
 <4bb2a25702832a21263c3e5780644b979697998b.camel@intel.com>
 <ZRxaJFgF1Qoqtoey@unerlige-ril>
 <ZR1El9m3GERsbg_I@fdugast-desk.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZR1El9m3GERsbg_I@fdugast-desk.home>
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 77704d8c-2232-4c8a-0676-08dbc6110e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJUUD3HZAy/gv/OBpPTLS+8P4xMM55GECqyTN/3ltL4FQICRwIpAGO32wuZbEoiolZ2ODWlOkd4AFrZmOjT71TV0RFBJ85R4JFSmkhb0yQhdidCQiTakaglPn3hcK81+aFvjYYTxt+uo33iJ2L0NG946tUOKmpWRvIjvE+a5ae4c8lDLlkSug/6muj0StYcrgYxKC3YkU9VeVd06e4/ORu53eAOi8NURXOdT9QwjribYVQ2/y5gX2qOQBHB9f+n7Obz4XCnif24GulJH7LfgTLu2M38JUXf0Kg6G4Nu8wNJHy0HOa19X4Wrp3GKwbVqSAplRJ3xt84VzXoKATrKRu9IgEopYCyiLpJ/WD7MScClAr6gf4/o4tIhBrFawD5grEMCkfsTu568BU5FC3SsXzEAOaKgxbHtZbavwJub7I9a2xbs5Ea9flSrKMgo5jxGhhye1utX3hyrqWf/ijYUap1LHSYWU1YHu8Tz0bPwI8u9iWwfv1dXf42xydzYr2ZETpl6YJHWRHNTbCKZwqRb+YDN8VRO8doi9nCtUrB+4UgkB76/dmOacPkWg2/ZrOTvJ+l7UMX7Qrt78FOmixpT+MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(66946007)(54906003)(66476007)(66556008)(6636002)(316002)(41300700001)(6512007)(9686003)(82960400001)(26005)(6666004)(6506007)(6486002)(478600001)(966005)(83380400001)(38100700002)(86362001)(33716001)(2906002)(8936002)(8676002)(6862004)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFVYQWJzL1JnSWxaN0VsbXZDVVBicVlPclE1Umw5UE9ObGdTcXZvaDhXVW00?=
 =?utf-8?B?eFVkSExpdGNoV3I5bDJ2K1p0bmwwSTJKZDkyZ0g5M1V2QVZzM1I2RFA3ekJY?=
 =?utf-8?B?TDJxWDJObjhaWmptWDBmUHN6Skc0NDEyWVRyY1M2YnhMR0FyVzZua1JVT2E4?=
 =?utf-8?B?SXp2VVhoQXlMQ3ZsdktjM3Q3OUNORzhNaWUwdFowVE9sTlZEdktUeWQwUWl2?=
 =?utf-8?B?OGYzU2xnOXlPUFpRY0srOUdYTjJlVm5xWDc0RXlBNkxzbHNpVzNGYm9GMjF3?=
 =?utf-8?B?dFNuYmdNTTFnWmthbTQvZENrRmNtbjZNVCtGbzB6blhGOUJrano5a1lsa2pG?=
 =?utf-8?B?VXFRSzRQWXpvdWo0dWMyTWs5dUIyWnpVN0p5Sm92a29kZ2MrWGhRRWJjVjZn?=
 =?utf-8?B?NUVoRHlPTms1b1NsUGJ6UDg5c1dldWd0VU5Ma0RGdUdtZzZBVkkya3pReGpl?=
 =?utf-8?B?ZTVCVExBYjBnVnk5M0NSYjNVRjZ0RDQ2RjkraW01d2h5UmxGR0k3SGNhOU9L?=
 =?utf-8?B?WFNhS01vbENld0taY2F4cGNUTDE0a0FJOGtaU0ZrUzNYbVpJRjA5elJsbXhZ?=
 =?utf-8?B?UGhCbTYraGhmUlRTb3VhaTdJSHFvaUdGeEd6QW1wbXQybTl0REFwbjNUSDk0?=
 =?utf-8?B?V3Z6dDZ2bFJuQ3Z0Uityb1h0clg3QnU0Nk13YzAyM3dxOWlGOUFKSmUvMEo0?=
 =?utf-8?B?b0dlemRjVlQvY1J6VFR4TjRPN1YrYkR6RmtTd2sxMDlIeDgwZmlYVjI2SnVM?=
 =?utf-8?B?eHRma1UxVXFKZkhzZVB2WEVsYjJxV2dETFlBSDBxdzdieGsrMUFzczZUM0Nq?=
 =?utf-8?B?cVpJenNCT1pNaUora2M1c0loUGRWcTdlditCREZFTmNjYjBWSnQ0WWkwQTZH?=
 =?utf-8?B?emhNclVFdVJBSGJIYjFnMFlRRTUycVQ2Mll1OFRvRGRKcGlCeE13czJkWmlo?=
 =?utf-8?B?ZmxRQjloalBYaENvZlU0bklPQ2VsdTA0TnZRcTZ1OVNtV2dhUVE2aUNCNUZW?=
 =?utf-8?B?RU8vL284UVBHMWJYcmFXVW1wb0dGWFVpNU94MkMvZ0hhYTJNemdleTJDV3NQ?=
 =?utf-8?B?ZDZ0WjBqRkp0ZU5xUlZXOGNocVRHZGlId3pRczFVK3lQVmlFcmNJbGVOL2VJ?=
 =?utf-8?B?SDM5OVRaQVRxUUIyRlQ4TmtvbHBIQWFUYU45NElEOWlKSWFCcGN0T1FsbEdn?=
 =?utf-8?B?L203bnlBem00aHRzUFFVT2Y0SjltVlJVTitYT2Q0Z04vWGxkdFM0NkJmQkQv?=
 =?utf-8?B?dGZPZDBWQXlMc3BkbkhZWUdoNDBYYzNRR2k4Ti9iZzJDaXBacFE5Z0dCZ0RD?=
 =?utf-8?B?QWZGeCt0alBXc09RRnQwcDZMYXJhaGZ6OVdmUlAvMVIzU3dBRlBZeGtrdmhK?=
 =?utf-8?B?ZThrMWIxUC94NGwxWWQ1MWVPelJuRklCZUVEWEUvQlgzSFo0WWd2Y2JYRjBF?=
 =?utf-8?B?QVJzYkVRcE1XbEtZZms5dzltVnhxVTBicjhtSUY2ZFhDNVlNUHdDUlU4NkNL?=
 =?utf-8?B?cDY2TXFGQytsaTRZc05OY2M2NFVnTkYxWlFzVFJCNmk5YlRzbHV1MXdlVGho?=
 =?utf-8?B?TTh3bnJTY01GV2dHNTFBNHltTU9lNDVrNHozVjd6VU42cjVXV0dhRXRDdkhM?=
 =?utf-8?B?UnlFT3Rab2N4ZkwvbVRJL3RSdkgwVXFUbS9zSGVqSlVjRk4zejhTWFBjSms0?=
 =?utf-8?B?cVRhNzlncEFQWWtqSTJhRTkraEtqN2FTKzlCSCtyS2JzdUd2MDVZYkpCOHky?=
 =?utf-8?B?Q21VdThiRUJZTGZDZ3dPbDlqcGpVRmJ6VkJMa0dPV28wUjhkQ3dydjFYbEQw?=
 =?utf-8?B?Qm90aFkxN01CeXpUdVhlNXdkNWFBRWNpRDFBSzA2cUtLTTVDVjJPOHpiUXFl?=
 =?utf-8?B?eGpSRElBeGtxcWw4WGNnb0RKdGhDeFpJVDFTcUdZZnpmd3NDMEIrMG9lY0gw?=
 =?utf-8?B?RWJuREwwaXlCb2c1NzgvWWd1S1IwNXQ2cTFjWEgrbFZUUk5lTnFQenBQUEln?=
 =?utf-8?B?aVFlOG96YUgwN2Jkb2Y0N0syRWRHckZKeVErS2xBTlJaVWd1Mys1LzFBYkFp?=
 =?utf-8?B?UUhNb1lkM0FhK2JRbGZhazNRcndWbytCTGQ2MFRLTDVnZmJvRUFHSVVsZFdp?=
 =?utf-8?B?STBiZjVPU3h4Y0QwSzdYT1hwMm55M0UyaWhuOTdGbTZqekV3N09zVkw2MG1i?=
 =?utf-8?Q?qv6Y1Bs9rqrDByRx5RqOFLY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77704d8c-2232-4c8a-0676-08dbc6110e92
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 02:07:57.0357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbW4pD43J9RqQR9259gqP23lHIpa6jJFz4hTvnaCQlt5rXx1ew8UARxDYpoK4vozp/uLsyVmfO4YzVhI5PvCcEqrxQPHflqg344cbGtmcfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 12:55:19PM +0200, Francois Dugast wrote:
>On Tue, Oct 03, 2023 at 11:15:00AM -0700, Umesh Nerlige Ramappa wrote:
>> On Fri, Sep 29, 2023 at 09:45:35AM -0700, Souza, Jose wrote:
>> > On Fri, 2023-09-29 at 09:00 -0700, Umesh Nerlige Ramappa wrote:
>> > > On Fri, Sep 29, 2023 at 11:06:53AM +0200, Francois Dugast wrote:
>> > > > Hi Umesh,
>> > > >
>> > > > On Thu, Sep 28, 2023 at 05:36:39PM -0700, Umesh Nerlige Ramappa wrote:
>> > > > > On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
>> > > > > > Add pad to reserve space for future uses such as special configurations
>> > > > > > for media.
>> > > > > >
>> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > > > >
>> > > > > I saw a comment in v4 that you dropped the patches that are not reviewed, so
>> > > > > this is:
>> > > > >
>> > > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > >
>> > > > > Hoping this will be part of the final series that you merge since the
>> > > > > ENGINE_CYCLES query is using this structure and relies on this padding.
>> > > >
>> > > > Actually using your original submission [1] this patch should not longer
>> > > > be necessary, right? It includes:
>> > > >
>> > > >   __u16 rsvd;
>> > > >
>> > > > [1] https://lore.kernel.org/intel-xe/20230814223734.375449-5-umesh.nerlige.ramappa@intel.com/
>> > >
>> > > Hmmm, I failed to notice that earlier. My bad. v4 looks good, you can
>> > > ignore this.
>> >
>> > It is named as rsvd but it should be a pad.
>> >
>> > We can't leave as reserved to be future used to return media engine capabilities because drm_xe_engine_class_instance is also used as input to other
>> > uAPIs and that is useless information after initialization that UMDs should not need to carry around.
>> >
>> > Instead DRM_XE_DEVICE_QUERY_ENGINES should return something like
>> >
>> > struct drm_xe_engine_info {
>> > 	struct drm_xe_engine_class_instance instance;
>> > 	__u32 rsvd;/* future could be __u16 capabilities; __u16 rsvd; */
>> > };
>> >
>> > This can be fixed in uAPI take 2.
>>
>> Hi Francois,
>>
>> As per Jose's inputs, I posted a new version of my series here -
>> https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1.
>>
>> Can you please pick up patch 3/3 from here. Note that just adding the pad
>> does not resolve the issue I was mentioning in my original series.  We also
>> need to explicitly initialize the pad to 0 in this case. I have included
>> that change as well in the above patch.
>>
>> Thanks,
>> Umesh
>
>Hi Umesh,
>
>Thanks for the update. An earlier version was already included in take 1
>of the uAPI changes [1], against which UMDs are currently aligning, so it
>would be best to leave take 1 as it is and include your fix as a fixup in
>take 2. Could you please send a fixup instead?

Fixup posted here - 
https://patchwork.freedesktop.org/patch/561095/?series=124690&rev=1

Thanks,
Umesh

>
>[1] https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1
>
>Francois
>
>> >
>> > >
>> > > Thanks,
>> > > Umesh
>> > > >
>> > > > Francois
>> > > >
>> > > > >
>> > > > > Thanks,
>> > > > > Umesh
>> > > > > > ---
>> > > > > > include/uapi/drm/xe_drm.h | 2 ++
>> > > > > > 1 file changed, 2 insertions(+)
>> > > > > >
>> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > > > > > index 79e47708d526..84091860c7d2 100644
>> > > > > > --- a/include/uapi/drm/xe_drm.h
>> > > > > > +++ b/include/uapi/drm/xe_drm.h
>> > > > > > @@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
>> > > > > >
>> > > > > > 	__u16 engine_instance;
>> > > > > > 	__u16 gt_id;
>> > > > > > +	/** @pad: MBZ */
>> > > > > > +	__u32 pad;
>> > > > > > };
>> > > > > >
>> > > > > > /**
>> > > > > > --
>> > > > > > 2.34.1
>> > > > > >
>> >
