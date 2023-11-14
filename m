Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A853C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 14:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C17B10E07E;
	Tue, 14 Nov 2023 14:18:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E8710E07E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699971503; x=1731507503;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9UFpAvaSXCe18qf47lAt/S+DynIOXOuI/ic7wOqVflA=;
 b=UaGFO+dE6hDcYgAlV1x5o76aefL7XWKfck1ooaV13UQWKuhxqyEuGUhS
 iTdtrOQGS0FRUjQLFJj5uzo4NW9C4K/jmQAhejoga2CtW9Adb1Q1xzPtD
 e3slbX/u3tjed+L9oy2ImkDSlbp2BiPsaoE0tlFDfTMvT4Ofvaq+qhFKE
 B+e/lATQwuSHugyJfRlDSUb1dIq94U3zjWhYlsa9d93TmdsGKxnE5E2Na
 jvWL601xFzcbHB82lqi0PHJ1j6ij+qtajPsp/AS2gcOVmhltmPJD2DXQB
 6JijXfEjM1JRdt+VwV25CZfhTkxMYnV8nMJ6TyNWjjQl2pwIG6fQIbHme Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421758012"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="421758012"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 06:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="799533056"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="799533056"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 06:18:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 06:18:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 06:18:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 06:18:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7araitydDqRPnEti69kwKno62t54E1M83QEhfoMC7mED2E3TgEbMCNN75bQxXqEGBJN4qm6AHZa9PDLOb+/1pVlf/Op1kEc6RNWxY1hlfvarYEkL3sjqd5GKfiGNpok2DgDizGejm7hT6LKnB5qSJhdrpOfycmwWBU1AmmLoIUAq4gAP6m/aIqnXoUVVJPJGqrLJqHioy4CnUnz+51pVWq84paZ2SDCgRkewr7T8D2vhjLp/tjNROjYi/4ULE/el78a7q8kPN5pcdl1RhEm5LbJZfcKbwwgDDvUfEfoIsIW5tzmEO8B9GyaBaMu2FtQfQFJvktfuK44E7Q3LcgiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5R7hgrVjoSILy2ZNU9xx1tptQhh9669TQEdEDZy6nk=;
 b=Jq9St9RtrdGZayMjdPlHgmNbvgROTxQp0qFUX9qkh6sr31Ss4cV5H9LhW13CKAzlIcnxAKJXjglw25sEp1FRkVIT+z+h0SGUqb/bK4Y0Y4fqB6V8wiyE2HwfcyNNMn13CRZXSw87kAs1/z7yc1IIzUhfxn46RpySmJ1rcQWDCYWz+gTDKo5rtqXwgWRZPF7d1b/ILDVnFa2RaczwTS09yzhzsxJs8E8l+kkn+iAwotbyAe1VhPnl5vo6MBnf0XcDVssnKv9U0GhrQYdFpQQ1Z6KZK4fB9z6yD+iZcc2s1KbtesM9OIrCSRH/kfcFukmINleKmzafyStZ/h8kIjQOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 14:18:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 14:18:14 +0000
Date: Tue, 14 Nov 2023 08:18:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <vpn77mbcibkrxliubhwgoy7263akog4t65oer7zydue4ij7xv4@yyz7dx54bp4j>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-12-michal.winiarski@intel.com>
 <ok4vdcfjzkc4p6u7tl7udsgcthjekmmgslksgusfnctkbf6ony@ymq7ernydwx6>
 <wb5de3ufysuv6ada4prgis4i2zuczk4ijkh2nfr7n5qshi655k@tg7znfguqfm2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wb5de3ufysuv6ada4prgis4i2zuczk4ijkh2nfr7n5qshi655k@tg7znfguqfm2>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebdefda-a7a6-4235-e855-08dbe51c89e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VjWWRJyz6FzN6+z+GkO1IB6GjNMjoaSmQLqk+ElzBibD4sXLlQJPyrxObwgJiaRT3glv26q46b4mqcmt6lVMOJjQhTmO/IkgWmGhaZebsmisGLfcxht+MxFS3x82bfdDFBPo9yeYOYBrRPDvcWvv8T9gF0Bu95UYHmz7CNfxmjouXZSQ1QOSoZAF8vwpZWW3bDBXHWrRtOayl72QafdorcuR0eCocmUW6WqQEiqR+oAgWSXml0y5LBkCjIBgz+iKBt2fq7Jb+7c/DW+FFf0eBRjDU+4LoQ0clz9T/Ohai0L5X+JQuqvcuyg854HH9SslyZRuZQ17bGv2FAnCsU3fbMb51LIwKU8OU7J1+szLknqcYil8pRx7TCeYmCS2zBic8Kfa4D3zM37y4lXu8n3qHqcN/ycQPA/AxzUHmdyRhF1MZB3JP/PHc1bk4Qc6afMV60dzf4DWR84ths5S2jejCzWVPkg+RyrsOHnj3NLBQZAuCztgz7DwVWVAw4aOd+hGJD56Zf5G9lMx4XDfZeA4bvm4SFE+lPVubAgC4/UIjHluPgjras4N4B3vrNPjf5Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(346002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(5660300002)(6506007)(9686003)(6512007)(26005)(6666004)(2906002)(66946007)(83380400001)(66556008)(66476007)(478600001)(316002)(41300700001)(6636002)(8936002)(33716001)(6862004)(4326008)(8676002)(38100700002)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHhaZGhLR2VjMmo3UmRrazZhVFJtYm9QcHpDQ3hXMzI3a0hROFV5azBTZDZF?=
 =?utf-8?B?OWF1bHk4c2piMEdmS2wzU1hodDBlYnhaMWFja3dPMFMvdUJEbXhBQytOZHFL?=
 =?utf-8?B?NGZ4d1JPOFV3SGh1eVJ0QTZDK3JFMUV4YzBQeEU2QVNVOTZ6MG1YYU1NSnB4?=
 =?utf-8?B?K2VHQ3QwTXBmM2JER2IvQVNBN1pOOE9MYjJNcFNwM1U4dmdnRnhtYmFPOHZr?=
 =?utf-8?B?SmZtbUVGZFpRZXhVcSt0K0xUTG04am1VQjFtUkQrWS9qK3hDN0NybFFRY2Vq?=
 =?utf-8?B?K3lCeDBzMEZVeHhMeGZtaU9NL0xLM1E2dld6MGp4Wkl6YXdyamxKNjZNYXZh?=
 =?utf-8?B?VVMrQmtNcjZ2Z1o0dUlKZXNRZWZtV0FmeWkvY2QrSGRIOWMzemlWYlE2ZHFM?=
 =?utf-8?B?SWlLc2lmR1U3WG5LblE4WFdDOUFRZHVzdDBWK1IvaCs1YUlhT1hDaWxpVk9p?=
 =?utf-8?B?N1lXT0pKSnNXZVRWVENpdnNwMkRqN3BFWFpIY2Vyc2VCQkZkZy8yWXVXRWxX?=
 =?utf-8?B?alhVbkZDd2c1UW01ZmhYSkJUQi9IM25UaVRkOUNtbWhEdDMycGdtb1pLZm5k?=
 =?utf-8?B?b21GU3V3Z05ReGkxVlFKVmJUZ29kM0RFY1ZvVG43SWZQYlhBVUs2c3FyL3JW?=
 =?utf-8?B?SUgyVzFoMERrN2pBTU51eUNmb2RCRDN4alZmSGlwU2xraXFHSWhwcDhRZDZR?=
 =?utf-8?B?MGtveG1BSUhNV29HM2pBTFdpRWllNVgyU3lXYlhyaWxSUjhUWkZMNzlrSlRn?=
 =?utf-8?B?VnBpM01nWE01Qy9nSmJkNDhIeTRsZ2kxU0F3QWV1MXM1bTRCbXBZdnQ0N2FC?=
 =?utf-8?B?Z3RYVTFjbldzd1NXMjhKZXUxc0JHWk5VTHhFMTVJbTJlam9HVXJ5Qjd1NWFG?=
 =?utf-8?B?MVgxeEFsVVJPREtmcldxcnB4Mnk4S2NzRHM0ellqNWtma2hjb3R3YjllV29p?=
 =?utf-8?B?ZHVOVjVyWHBrbUpaSzFROXBZemk4cEJzZUswcng3Qk1lOGREWmlMOUhidzVN?=
 =?utf-8?B?QzhUT1RPN1dpcjJEOG90c041NWl2YWs3SlF1VzVocHVvOGdLQnZLNHpLZ0Fm?=
 =?utf-8?B?MDgxenY0cXg2R0tXRjBmMXpOU2JOUllxSWk5SURJL3h5VWlaUzVVdXl5MWNk?=
 =?utf-8?B?QWQ5eHJTQnFtUmFTUXhLaG42UUUrL085ZmtIREJSY0FGa25pVzFrK1QybDdN?=
 =?utf-8?B?aE9BbldTUG1YcDR1UlpXL1Q5YWVhYVlHS25ENG9JWUtUT1ViNFg0TnJLRzlV?=
 =?utf-8?B?bWlrTDVMak1hK25XZ3UyOEp3RTRYeEtucGc0T251eE9NdlVDcGRFM0JML09L?=
 =?utf-8?B?cUhOTjNWOHUzS3AzeVlldlE1RmdtV0hJRkpsY2pienk0dVp4QmdNek9VTERP?=
 =?utf-8?B?MGdxeVpkWTgrRnIwMWhraGU3TGZnUUtldytHQ2VnVlgrNGZvMHVQWGJGR0Vo?=
 =?utf-8?B?azlWWnNKVmVNQjA5ZDg2RzRPWWl0UEM3Y2w0Nks3d0tHb2kxV0JjK1haR0JU?=
 =?utf-8?B?bWFRRFI2Q2VUZVRNbmU2b3EzM1pLZ2IwQ3hyTkdRTlJsRmIzTlBtS2svQlFW?=
 =?utf-8?B?bWVVdnJKcGFpekVnblRVUFlIRzdJeEM4cm1td0p3UFpvTk92RjUvQzdoRlo5?=
 =?utf-8?B?d05qL0N6ZGF4cldLWGIvcWZVQkFrMS8zYWxPMjRKZm5UYi9pOUI1eGRiSEsw?=
 =?utf-8?B?MHFURlVnZ3VlcmxTK2haREhmUWUxRVpjNnA4ZDViY2UyNGdBanBJMThPRlNq?=
 =?utf-8?B?d0V3Rmpzc3YzVjBTN1I1ZGh1OU9pM0NGVzkzZXVnMDZ3MmdlYzluZ2ZTaktq?=
 =?utf-8?B?WUFJVnFwYU1FYU1takovMFRkK2dOUnVrREpmUURkTzhFZUFtOTNZL2l5Mmcv?=
 =?utf-8?B?VExNemdiMlM4cEJLVTNxYUExRmVVbGZOVW5LR1ZoT1RNSWlvUlJYL2VyN3Fn?=
 =?utf-8?B?MzZrVW5rQ0s4cnBzUVROaUpGOHBQb09BOEhVTG1EVXdCaGYyU2NhR0luVjRp?=
 =?utf-8?B?d1hpRlN6VkxQTGxSQ21ocStqdWhnaW15anRZQXI0SHZyQmNzN2dTaTdaeE5p?=
 =?utf-8?B?cWNzbnRvVWh3RVYwRGZrUFNYUkZiS3Fma3AvSlZ2aDJoNXFuVDQ1YkU5aEhi?=
 =?utf-8?B?d3FZRC9YbjhId1MzZHVzdlhSYThDRTNEdStMb1piUVp0ekRBS3dJZ1NzaVpq?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebdefda-a7a6-4235-e855-08dbe51c89e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 14:18:14.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRgKwy685xEQ2M1lmNM8S/mu6PJRRc7aMh4+oZvbs5ooSM3NkwzGyNoM5zvG+882/IB0rIYwHlyd/fgkurMRpG3d8hVJ2RdxceLgGEI7DEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/device: Introduce
 xe_device_probe_early
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

On Tue, Nov 14, 2023 at 11:02:15AM +0100, Michał Winiarski wrote:
>On Mon, Nov 13, 2023 at 09:11:18AM -0600, Lucas De Marchi wrote:
>> On Wed, Nov 08, 2023 at 01:33:43AM +0100, Michał Winiarski wrote:
>> > SR-IOV VF doesn't have access to MMIO registers used to determine
>> > graphics/media ID. It can however communicate with GuC.
>> > Introduce xe_device_probe_early, which will eventually initialize enough
>> > hardware to allow the driver to communicate with GuC early during probe.
>> > This will allow both VF and PF/native driver to have unified probe
>> > ordering.
>> > Initialize root tile MMIO and TTM sys mgr early, as both are needed to
>> > communicate with GuC firmware earlier during probe.
>> >
>> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
>> > drivers/gpu/drm/xe/xe_device.c    | 21 +++++++++++++++------
>> > drivers/gpu/drm/xe/xe_device.h    |  5 +++++
>> > drivers/gpu/drm/xe/xe_mmio.c      | 17 +++++++++--------
>> > drivers/gpu/drm/xe/xe_mmio.h      |  1 +
>> > drivers/gpu/drm/xe/xe_pci.c       | 26 +++++++++++++++++++++-----
>> > 6 files changed, 52 insertions(+), 19 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> > index a40879da2fbe1..733df9a270db2 100644
>> > --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> > @@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
>> > 		return -ENODEV;
>> >
>> > done:
>> > +	xe_info_init_early(xe, desc, subplatform_desc);
>> > 	xe_info_init(xe, desc, subplatform_desc);
>> >
>> > 	return 0;
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > index 696f997bd2c93..19faddb779808 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -364,6 +364,21 @@ static int xe_set_dma_info(struct xe_device *xe)
>> > 	return err;
>> > }
>> >
>>
>> The _early variants have different meaning all throughout this patch
>> series.  Keep that consistent in future will be challenge if we don't
>> document what the split is between the _early (which used to be sw-only
>> part) and the normal init/probe.
>>
>> Please add a comment on top of each _early() variant you add with the
>> split of what should be there and what should rather be in the "normal"
>> init.
>
>Note that even in the "future" we might want to avoid having a rigid
>split between sw-only and HW communication.
>We do use MMIO regs for Graphics/Media IP version detection. Same thing
>will apply to SR-IOV VF mode detection. Those are pretty basic things
>that need to be done very early during probe.
>If we go sw-only route for "early" probe - we will end up initializing
>data structures that won't even be used by the driver, which is wasteful
>and makes the probe harder to understand. We would probably also need
>extra code (asserts) to warn on uninitialized resource usage.
>
>Or, we could just map everything as early as possible. Early would then
>just mean "early". Which is also what it means today, as the existing
>code prior to this series already has "early" functions that are not
>sw-only.

yeah, but all I asked is that for each case you make an explicit comment
on what is "early" for that particular case. Because it's not clear and
not consistent and will be a mess in a few month if we just keep adding
stuff at random places.

thanks
Lucas De Marchi

>
>Thanks,
>-Michał
>
>>
>> Lucas De Marchi
>>
>> > +int xe_device_probe_early(struct xe_device *xe)
>> > +{
>> > +	int err;
>> > +
>> > +	err = xe_mmio_init(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > +	xe_mmio_root_tile_init(xe);
>> > +
>> > +	xe_ttm_sys_mgr_init(xe);
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > int xe_device_probe(struct xe_device *xe)
>> > {
>> > 	struct xe_tile *tile;
>> > @@ -382,10 +397,6 @@ int xe_device_probe(struct xe_device *xe)
>> > 	if (err)
>> > 		return err;
>> >
>> > -	err = xe_mmio_init(xe);
>> > -	if (err)
>> > -		return err;
>> > -
>> > 	xe_mmio_probe_tiles(xe);
>> >
>> > 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>> > @@ -418,8 +429,6 @@ int xe_device_probe(struct xe_device *xe)
>> > 	if (err)
>> > 		goto err_irq_shutdown;
>> >
>> > -	xe_ttm_sys_mgr_init(xe);
>> > -
>> > 	for_each_tile(tile, xe, id) {
>> > 		err = xe_tile_init_noalloc(tile);
>> > 		if (err)
>> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > index ee89af6b1ea9c..5d7fd16f545c6 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.h
>> > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>> >
>> > struct xe_device *xe_device_create(struct pci_dev *pdev,
>> > 				   const struct pci_device_id *ent);
>> > +int xe_device_probe_early(struct xe_device *xe);
>> > int xe_device_probe(struct xe_device *xe);
>> > void xe_device_remove(struct xe_device *xe);
>> >
>> > @@ -122,6 +123,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>> > 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
>> > 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>> >
>> > +#define for_each_remote_tile(tile__, xe__, id__) \
>> > +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
>> > +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>> > +
>> > /*
>> >  * FIXME: This only works for now since multi-tile and standalone media
>> >  * happen to be mutually exclusive.  Future platforms may change this...
>> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> > index 8945c601e1c54..526a6ac6be56a 100644
>> > --- a/drivers/gpu/drm/xe/xe_mmio.c
>> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > @@ -15,10 +15,12 @@
>> > #include "regs/xe_regs.h"
>> > #include "xe_bo.h"
>> > #include "xe_device.h"
>> > +#include "xe_ggtt.h"
>> > #include "xe_gt.h"
>> > #include "xe_gt_mcr.h"
>> > #include "xe_macros.h"
>> > #include "xe_module.h"
>> > +#include "xe_tile.h"
>> >
>> > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>> > #define TILE_COUNT		REG_GENMASK(15, 8)
>> > @@ -369,10 +371,8 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>> >
>> > int xe_mmio_init(struct xe_device *xe)
>> > {
>> > -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> > 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> > 	const int mmio_bar = 0;
>> > -	int err;
>> >
>> > 	/*
>> > 	 * Map the entire BAR.
>> > @@ -386,15 +386,16 @@ int xe_mmio_init(struct xe_device *xe)
>> > 		return -EIO;
>> > 	}
>> >
>> > -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
>> > -	if (err)
>> > -		return err;
>> > +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
>> > +}
>> > +
>> > +void xe_mmio_root_tile_init(struct xe_device *xe)
>> > +{
>> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> >
>> > 	/* Setup first tile; other tiles (if present) will be setup later. */
>> > -	root_tile->mmio.size = xe->mmio.size;
>> > +	root_tile->mmio.size = SZ_16M;
>> > 	root_tile->mmio.regs = xe->mmio.regs;
>> > -
>> > -	return 0;
>> > }
>> >
>> > /**
>> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> > index 9f1a25cfd2cf0..894a792ac8abe 100644
>> > --- a/drivers/gpu/drm/xe/xe_mmio.h
>> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> > @@ -21,6 +21,7 @@ struct xe_device;
>> > #define GEN12_LMEM_BAR		2
>> >
>> > int xe_mmio_init(struct xe_device *xe);
>> > +void xe_mmio_root_tile_init(struct xe_device *xe);
>> > void xe_mmio_probe_tiles(struct xe_device *xe);
>> >
>> > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index 87c45c6e08aec..2f04f07dc17a4 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -532,10 +532,12 @@ static void handle_gmdid(struct xe_device *xe,
>> > 	}
>> > }
>> >
>> > -static void xe_info_init_early(struct xe_device *xe,
>> > -			       const struct xe_device_desc *desc,
>> > -			       const struct xe_subplatform_desc *subplatform_desc)
>> > +static int xe_info_init_early(struct xe_device *xe,
>> > +			      const struct xe_device_desc *desc,
>> > +			      const struct xe_subplatform_desc *subplatform_desc)
>> > {
>> > +	int err;
>> > +
>> > 	xe->info.platform = desc->platform;
>> > 	xe->info.subplatform = subplatform_desc ?
>> > 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>> > @@ -549,6 +551,12 @@ static void xe_info_init_early(struct xe_device *xe,
>> > 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>> > 				  enable_display &&
>> > 				  desc->has_display;
>> > +
>> > +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>> > +	if (err)
>> > +		return err;
>> > +
>> > +	return 0;
>> > }
>> >
>> > static int xe_info_init(struct xe_device *xe,
>> > @@ -611,13 +619,15 @@ static int xe_info_init(struct xe_device *xe,
>> > 	 */
>> > 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>> >
>> > -	for_each_tile(tile, xe, id) {
>> > +	for_each_remote_tile(tile, xe, id) {
>> > 		int err;
>> >
>> > 		err = xe_tile_init_early(tile, xe, id);
>> > 		if (err)
>> > 			return err;
>> > +	}
>> >
>> > +	for_each_tile(tile, xe, id) {
>> > 		gt = tile->primary_gt;
>> > 		gt->info.id = xe->info.gt_count++;
>> > 		gt->info.type = XE_GT_TYPE_MAIN;
>> > @@ -717,7 +727,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>> > 	pci_set_master(pdev);
>> > 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
>> >
>> > -	xe_info_init_early(xe, desc, subplatform_desc);
>> > +	err = xe_info_init_early(xe, desc, subplatform_desc);
>> > +	if (err)
>> > +		return err;
>> > +
>> > +	err = xe_device_probe_early(xe);
>> > +	if (err)
>> > +		return err;
>> >
>> > 	err = xe_info_init(xe, desc, subplatform_desc);
>> > 	if (err)
>> > --
>> > 2.42.0
>> >
