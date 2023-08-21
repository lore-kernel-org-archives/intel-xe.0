Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF2FEE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 18:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5210E070;
	Mon, 21 Aug 2023 18:46:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C98E10E070
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692643576; x=1724179576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FfpzFdWYwnYQpuW3Ml4X7d05fPXWmjSF8GfH3Z2/Nxg=;
 b=N1D5acRRq2WTqhfD2snJMVPOwpTy1UH6M7oQdj4kSjT27MJBsA9D7lH5
 lGkojkp9oyJ3+ogIKU6DQY2IEjo922USQe16ZArjjK2vAKrGh6HXBN94o
 DJsIVNUvUaIUYpUK1/Yx/IXg7zB3d6JTZZHnt/Ap2mmqB+gS/mFXPalHJ
 LYkBVB4y+GJOoEpsyQpcXXpktfr3km1eDKbE0O3pvbzgT27NWdTE5Nfan
 VtGkYD5uxCc4rhtTGWpnqPT0SLjb0cK2B4UMZoMtu+jwH5Ik4qSQiG124
 E8Et/EG4W/0/5BXehi/+0dLBVctim6VfJEdhNhpw3+NzbI/z8uuZZdV5F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371103777"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="371103777"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 11:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806015548"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="806015548"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 11:46:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 11:46:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 11:46:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 11:46:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 11:46:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLK2cWXrhfWhnmpX7AioHCKvg81EB8X7bjPVQ+McWEOJ2A3L7plBYIttTvUirF7c8Gzdi+KqTxcRbvYvyabZpY+qF6rQrSvIWPLtTjZlUEGDLqfkUNLp+Y/kI9l1XVd92uUYPCgtNbLY6WGmcnTCEKyXnlRCIB3QTEu5I0ooeSmwgYxWtbUBuLFs2kc/FJ2G7lQefRs7AlnKJvl9makqjEi+txqJz9ATPYxWqij+Ipd+RH/x8UknkZ3pb65/H8b/HsBgjrGAkwsMwi2WRB4dLK3DmOs/MeWjifrzWLud8ky3C4qis6NL3mbup3byTqXCYt16GnJcz9cNKzhbvVizPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmVmO8tW+fai9D89NjNnihQWT0C5YbpXn9o1egWyzAw=;
 b=WklL4j1oPKbzuifXpYxObFPrdSzY/4vPryp7Qh5xSpWCXBGY9yZwxYT4tN+EaXF8ajtjH34Zwm/42J/L/pqIaa1WQQLP7ffNAiWFRgtTbUckYyJpsJnhpTcRNyxGzT1oPdP7euMcHM+WB9VSqodx3KyiYJCgx662GR77fj2M8fTUd9aweUSF4WMWSLo5cfe4hKtEM0dM99ds4Wl7ArF27P/9nxLx1/TfkyKBab+RE/9XmU6STMQdk3/md0QHaJaUmRHllxnZx7giSQB3++GvMCn1W2vZJdbKqtzmwfzWmzwrTiSx+c5ueBte+vfWVja+WxXEB8zQYW+9q7NJUekPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 18:46:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:46:12 +0000
Date: Mon, 21 Aug 2023 11:46:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <nbz4kmnqzzp66bu4p46ww4ljtjihjnvvyw3g5weyhskm2ia4k4@fraslvjgovls>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-10-lucas.demarchi@intel.com>
 <20230821142336.GA6080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230821142336.GA6080@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:303:b7::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 150fe296-c66e-4417-6140-08dba276e411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6erTcEXvsdSMdDqv7//G9EgQr3o9pgAHpT0Tl7YbohKTG4quC9nzxuNUocSzmRt7ltDytnP66AKTdgxBhDM3awVGTpj5xWKOGDN5oYhpUQyTSB1AQEktSRjOgDaE5JNt/Mq0xQMkwVbLYvFRR/Tyz5LMG1JbwNpHDnsAZ33+5mzb6Gqf2qu98RtSuubS74QTlLgBZv2/pvKjZXOQuGQefsj68QvyLEJc1GdJG+7M5xsy417HzSe2mQuatHr0JrLoWl7s3SRqmo6A/ji75SREOt85u4JLAOrvd4kPSrjJqEnlmTCT2JsKQijgdZquj7RIPEV/290cdNyuXwesDvxB/RD3kzt7uqOD2cwTjFJ16XzgHh9X05S7ISrUFz+FfyYcoMkPcNN7MAXer3swf9aMTOeu4M/rFFCwZRSaSmhT2ZHSjLJ0lF0makmhH3nNWebAEWf6ICycWt0pOkt9VDieE4bETo743awsnhSAvFtPJJAqedB0romspeGfH1iwPi9KVPZkxgXYcsr6k3Qe5oRoNd7kYPBvIwDFTVmtt5eo3O1WtZo1MaYc6MZFGtn7Ock2nd/QlW9cFRyLbMlSpPIPF79l3NYpf8fr/Q+xjKpe44g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199024)(1800799009)(186009)(86362001)(5660300002)(41300700001)(66556008)(66476007)(316002)(2906002)(66946007)(6636002)(8676002)(478600001)(6862004)(4326008)(8936002)(82960400001)(6486002)(9686003)(6506007)(38100700002)(6512007)(26005)(33716001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZLD6iTmdIFvR419TJmak95bx3R/hHUEzdATx2LEZ/4KYh7/EiH2ZKWzwuRLS?=
 =?us-ascii?Q?39QTrj7oJOtnas3AqymY9TUJ/ZMy/ufTknt69E7BN+r+Sx0UVvWov3e52IY8?=
 =?us-ascii?Q?fMKboyH9JyPoFRmjSCXcTxOHNSRB4ZPwi9nk/4Lpy34zOITRhmurPJcjsrqG?=
 =?us-ascii?Q?kvFVhY1ji8mQCPgD5x9WJJyxH51Q5GsKCoQYlC34Oeh543UPoPOQP1jh8zSz?=
 =?us-ascii?Q?0pyH4uI3hFB/cpPUMyQgHYMQtem0m8rBN3wdcloveg9wLpk2X2PA4WJmH/Rt?=
 =?us-ascii?Q?mtAkY0jwaVuIn2e1MPs1pLHPWAwaoc5haQDYgvhlw3PM67NjStyWixbEODPW?=
 =?us-ascii?Q?WEhRm6ZlEQDEJaE7SdImpdXkZIYtPN4iZ+ZiUgKWY6SzZlhKpbqibgZeSJgZ?=
 =?us-ascii?Q?hiV8v6EwthKM0iz1JXqFM2FaxyIThWHBzFYjkbC9/scNYOeNrQpQwv0GZB2l?=
 =?us-ascii?Q?OX7RirFXkGHaTCXqC47GVkqvo5mmdZv+jYfRUcZJx3u/4DPw8xjyY4VrEMp5?=
 =?us-ascii?Q?rZlyrFdU8VSfZGwV1hDOnF/tUVTDk9X4vSUfasKcYo+Bc+SJ0K4WUQXNrF3K?=
 =?us-ascii?Q?NKhCYNAS4tIbtYdVmTSuvGCr60FXaLeB2u4sITBXLLQMh53TZCi9HyejtLkn?=
 =?us-ascii?Q?e1n6k89zpFhG3wiiOqkh+Ccsgh3FFKnUCaFuijZ7zaGQktNKDcYXoRRKoFW8?=
 =?us-ascii?Q?9eJRI1vTESbnEPEAxFh5CtMMpognnkRNoqgzwl7Kki5ipkvBAYllZhaZrqrA?=
 =?us-ascii?Q?S4PSd5RoDRMripuOyR2jmerEw8nCe61DzwcmVIBU6KhATipD1KydJKmqCGK2?=
 =?us-ascii?Q?6RcNSV/q1hjF49mgD6Jamg7Noim3d2ubk70gFbENnetxXxwpDPUgazHYVNlH?=
 =?us-ascii?Q?ex8NxJW8ikB1kCw/d+gl8oGZF6u9JPKV2pdrm9s0IdObZwuCX7MaNnHBivLI?=
 =?us-ascii?Q?8hITJLDGVA7mN0ZVUFJTfLRHs4hl3Bhcbko/pV5vAJk99Zit/t7Q43QqnTQX?=
 =?us-ascii?Q?G7jDFD4PjsT3Aq16u2ZOCYDgLMZrB+MuOIPYBA7spKDhJGvWrWakfZxrAaGc?=
 =?us-ascii?Q?Nv600HLScz9H83r6ImIVtme0b12QwRoRDsBQlTDgoVD9Yew4bPezo2mC/KFp?=
 =?us-ascii?Q?jMEalKFc2f8VmKz/XG1M3GqWwkctd7ECUZLN1CfI2C965HteOh1r8nnY87xO?=
 =?us-ascii?Q?HGRLyx9FgBAdPf24NTIBj7RrNjwKwMSdY2wUQcEQ2oVHncYYPjr2HjQRp6dH?=
 =?us-ascii?Q?/XJzRtI9Gy1qAQMX/4zCCswrq5FiPYZ88ixgCeV8z8idKMtENLkTiYfSkEjx?=
 =?us-ascii?Q?K2E3aSul37jynJSYAaJh5BNNjQMzTl77UfwwnL9LbHLkxvVorVVyKx7zU5Wq?=
 =?us-ascii?Q?mYiA9i0DEHhbLigWuPYjyUdpiCN9QoXOB46M/VTgRTMabBkvZsvfNuV5Ewc2?=
 =?us-ascii?Q?XRhN7PZPsp6KrMpEUuvu1rSerzuP0LVbYV2b5QztPQxfMQTUSjk2XR1ynJge?=
 =?us-ascii?Q?86EEc3Eh8Muhxn7i4ttMbbxquTj3+ukL4JQSfr2jJcSnfZhjF46Vyfj1kBtJ?=
 =?us-ascii?Q?jIpJQfr/S8SLpOHnexvRHNXVAqD906rXLi0hcdp/zuCdXHIOcLNoWoPCRT+Y?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 150fe296-c66e-4417-6140-08dba276e411
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:46:12.1204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMi7pcPlLEQquErD1dapbNF0NoytlQFAZaK5E7iSgY6T9vUYlxSW6yAYmpuh8pBoen9sJGCVSbK9F1Wv9vT929l7IxKc+EahWLr/gu1NLJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6180
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/15] drm/xe/xe2: Define Xe2_LPM IP
 features
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

On Mon, Aug 21, 2023 at 07:23:36AM -0700, Matt Roper wrote:
>On Fri, Aug 18, 2023 at 03:08:18PM -0700, Lucas De Marchi wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Xe2_LPM media is represented by GMD_ID values 20.00 and 20.04.
>
>I don't see 20.04 listed in the latest bspec.  I think 20.00 is the only
>version now.

Right, I may have confused with the display part when tweaking this
patch. Queued to fix in v3.

thanks
Lucas De Marchi

>
>
>Matt
>
>> It provides 1 VD + 1 VE + 1 SFC.
>>
>> Bspec: 70821, 70819
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ed6c4bf8c63b..fdd2eba1b91f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -221,6 +221,12 @@ static const struct xe_media_desc media_xelpmp = {
>>  		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
>>  };
>>
>> +static const struct xe_media_desc media_xe2 = {
>> +	.name = "Xe2_LPM",
>> +	.hw_engine_mask =
>> +		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
>> +};
>> +
>>  static const struct xe_device_desc tgl_desc = {
>>  	.graphics = &graphics_xelp,
>>  	.media = &media_xem,
>> @@ -344,6 +350,8 @@ static struct gmdid_map graphics_ip_map[] = {
>>  /* Map of GMD_ID values to media IP */
>>  static struct gmdid_map media_ip_map[] = {
>>  	{ 1300, &media_xelpmp },
>> +	{ 2000, &media_xe2 },
>> +	{ 2004, &media_xe2 },
>>  };
>>
>>  #define INTEL_VGA_DEVICE(id, info) {			\
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
