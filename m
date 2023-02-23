Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EFEC636D6
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 00:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7D10E207;
	Thu, 23 Feb 2023 00:37:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA1210E207
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 00:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677112636; x=1708648636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vPl32BrUxNRw/bQkRu6LTEt+Rhd3oek3cd9ZveQ2oLQ=;
 b=STfgr6wQAz+cgPW8FqyTsk1I8SSLxmV5reUcbStCeG0ahQDjw00+pYmD
 LeLizNt+8sW0rF0lsKnfya7rtOx/5or/qA8VJ6xhjeGZowdI6MOR/FTjJ
 F3aGHrEZASOaGGopHp/OY4jyse9E3Hs34CnkpF10/5rffNGOpivoBs+bZ
 QXWTmy/1fODYmS7vQ1W20O/fLUGiLt5xS23Y7XARL8rvxByCpQsAiBW4E
 jR87YRWj3GNhmXvee5IO3S4AKrofRVpP5Ipf7DXqo/FTi8GCHw2f6AzWk
 GrloLuPyrZG73jgLbPd2ONLMFfPJQh3g/0EYfBVlelNyXf+bH73mffoVf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="335278325"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="335278325"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 16:37:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="1001198753"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="1001198753"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 22 Feb 2023 16:37:14 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 16:37:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 16:37:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 16:37:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhAnyNa+FjSlYQQ5jEtGiMTMJS9ZNW1Ss8VE0i7Z22osNVpHU2X2p9SnOoUWWmUYSS3lT2kzh2hLKpbgVUVaQiscXNVBPfawfOKD+MBXlqqgGD3SorLNHDfjtg4wHL4lHse4o/5Ly27+zxiWUScfDSEhSRZ5YsvRMpnpOwugx3IgqQvJMBr4VIw2ggpqJm8uXbjhBhF/OzGdhvY2BBqpNmrLtXwYfBPhfeo65LMK0jhR2+dC1IkMeX2uHgc9gziBUsE6U5LmJrFS6va9GN27/XDTYuc9dm0gAbtn1OT+k2IT/0ZrJyEE68GVbCdvOmtja3RHlNSChhlcOlPbpxQzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPl32BrUxNRw/bQkRu6LTEt+Rhd3oek3cd9ZveQ2oLQ=;
 b=Grsw2YHBtSxvqkhChbEDMotFphHfDtYiyGzQEfAGtG7IelqwZhgZZpvP7FzYie/cKiwu7NHVklv5mJhw7g71HuL70ZJv0ofC+v4M3rbJls4oXkp582PEAfmiXxrg6YjjDEpdi5KJIW9ZET3VlldxSNFl5JB8IRSgkah+KHyM6CoLLVnJmtc+D5P5kMMhdDocqO7cKSaIXLArsQmcVCPkubrjojrICQOaGmKo4/d7WmLBGLopZ4FlgijRvK1wOpWHaDnrfql8Q/c7717cpneG8t6QT5S3OjrHopKVsuqqb/J5JbGEKTR/pyngVBe4mzI/YR1H6uDisS4zX2G3Hq18GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7533.namprd11.prod.outlook.com (2603:10b6:806:306::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 00:37:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 00:37:12 +0000
Date: Wed, 22 Feb 2023 16:37:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <20230223003709.q4ajnywdix4wdvgk@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-7-lucas.demarchi@intel.com>
 <CAM0jSHO0FL11o_uTh8aTG-ERO=wN9OBxX98DE=V5n3YhUVQKXA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHO0FL11o_uTh8aTG-ERO=wN9OBxX98DE=V5n3YhUVQKXA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: c915d527-558c-4891-4be7-08db15361a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYcyeRCe73t4Ld+7u/h/zs8bl4y+6B+P58SJVFTuFP5JY2t3NcjHZxQj6dT6I5Fpf/1wC4C6tMAOsrhlmHit2zs2clYu/auk46LrcDowpNHcxGkTBivUeP7Sn4b87enOTifaYKAIPUu4Tlpg2D6OSFf2z6WGxn2DmmO/nFY8p7TxsQG4mm4Zck+/rHN9NpPD2Mew/T1/XSI7oQZtBjXBGIkiRW+V6SnnI1cah+AhIWZaPjDMEngOj5KpT1M1A8BcOagDj/yPBTWPguDpIuiZ+jACpFT0rNlfGSYspwai0/NPqERdlH+WlrXU/Ca6bm3zVG0D35A20aCG4Diyadx1RVyV3XpMkqQktELIdcWPL7f5stghI1/FWILK3OmL3STYHM3a88I/UhiPvVctYYuX412XdpqG2Q4SzpSRmEV+K5R8/tk+I2fdxjn4ClpSQnT1msqT9L83xoRhYXzA2O8Gg+p9Dfyh9wbyz1UxVILzF8KlhIHCwpojKPFyXo9GJBuSeFRCzk3+fsmwfQFoKI9dlA3yUbjpN+6LhHQ1t5fNazKxV5dbPIIYlamS0At9EHtvkvEdIsgLjWDV2TEyYD+KXg74uRk5oGfzEpe1STwjCz/qJn69/2pDDMSlIAbBU0plCfqySuVW5ZaVVis2OHoD8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(5660300002)(8936002)(86362001)(38100700002)(66476007)(66946007)(8676002)(41300700001)(6916009)(316002)(4326008)(82960400001)(478600001)(186003)(6506007)(6666004)(1076003)(6512007)(26005)(6486002)(66556008)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U11NpSLuhCgmY3qcuY0lLY3skaOkN/kS2Z6adm/OmLFZDfOCcCS3B1j2XBPW?=
 =?us-ascii?Q?38BlzTWifaFHW75UYNMyD+3PrTyQn7G+3hMXLsdXLVh2a4C2WsT9ieFrcKsV?=
 =?us-ascii?Q?11dnvGcZzvkCxAEj+VrMq910jlnKfyyF+DGw6MagOYQL8BxhTzgBgttPquJi?=
 =?us-ascii?Q?1z3Wsbs/9I1iqCGLHToaibAd3Juj5tKMHaidlhZWUVk8KsJ/a4zMDJA+h49p?=
 =?us-ascii?Q?aM4yp2m66XFMGIxgrNG8q3T1KvBUfVK4ot5bYD+vcXzPKdJHI5lm5DEaxb8K?=
 =?us-ascii?Q?Zd3lt5LdqoI03qCX/XnRtudBs8S8st4DtJP5pprEVWxaTLXDxkrvezATWTh/?=
 =?us-ascii?Q?tC1t/PY5fljfFl34Hb3L7gnysQTnFcmgcIPN/hC0KsDVR2Prsi436kMzzbKc?=
 =?us-ascii?Q?oNGMZ5ETYBEau4e+REQqlLPv7Qcv4FD4NKm+KU8sTZs1YMAaUzJaNeLMn2ae?=
 =?us-ascii?Q?umhQIx5l5lU3wuzM0PJwNQm//OptSBUlejt012i/MepzE7zTV5agBlEaOYtc?=
 =?us-ascii?Q?ekV6rHiiE0VUl/lYDbbnAN9zgz+qpiqTwuXQo99aJUt/MENOCRFwNZAH6y1S?=
 =?us-ascii?Q?Ws/ja9O4Q3lwSYJH2zS96qQy/oN319vE9CWVhNdc2DUdgBpdyukVagULWx9Y?=
 =?us-ascii?Q?Sjbzrr7ZlZKV5zuA6cxUSOnI0YZvgy0AMVsaro1iKZVjbpuwNITaujUtuKq/?=
 =?us-ascii?Q?n7aDoOzg47AO9XuAfZapMsIKplWFlGzXw6RyaIFZL+LkWgFD2Eut0Ch9/940?=
 =?us-ascii?Q?UJ0YnNXoR5Bg+Y7f5/f2Go+d/O/5CD3n5cfeNuKAWXdlkfTOO726mpolyRiW?=
 =?us-ascii?Q?qKbSSemHfEMLAthaF7IqzKXksVcyno4jNVDF77YPq3Pn+Pa+gnwSkmoMFbow?=
 =?us-ascii?Q?hWydwzroxd4qWao3ciKxLCp02MbNvAnpcVtwqrnY3a9bWpZ0THMrEc3dD3Lh?=
 =?us-ascii?Q?RgVHZ4KPi8JS/ZBWtLdPjYue4OlB10kOfwQtz4avBYDd+J7W81vfTn7PYzIx?=
 =?us-ascii?Q?KWVg2cp1Vvf3uSk5TvthoFmaxF+9nP91lfnlp58DjQ3vKO8XUzWfEQYrRt+B?=
 =?us-ascii?Q?ObHnpg5vPyhYRH/F2LAUSqDVVWHwy6VIoq7O2+P1z9hxwcs1mep8mqZBrzc+?=
 =?us-ascii?Q?lo0Rjl2ig39bNt9dHAFPCQY90Vo38tTAPcx1LuTZTfH/jj9Vjjh9o1n52TZo?=
 =?us-ascii?Q?91G00mfuYOQgnMrSmGLVXt1z4MK08bvLQsF5hjQSf2oAPRs4pQ3J/xyT7OSc?=
 =?us-ascii?Q?eTMsErpiFINCBM00MH6K1lCTb7v3BrrpgI94vVp/ejv4zPWfLBRdDFolXOnQ?=
 =?us-ascii?Q?8A394K0z6khY8wIPO7bEXCWZ093t2pKLI+NjItFPjfuvuYn9Y+msnutTCV3z?=
 =?us-ascii?Q?EUrEVsfMINT3Ul5zcDDjnRTOvnO7E2xSiKKVXypNh3b50QPEM8RHZT3X5YfT?=
 =?us-ascii?Q?A2E9TblLR0vNVT87G8Kr5IGhYhPrsE5rZQwBkYPEZUyBEzBMAkpEoVd3kddh?=
 =?us-ascii?Q?4rMVF3ogSl/pJDn71wjvcmGhreJFUI8vFocUsgedlf/cCyWYeEsC+ZvyH270?=
 =?us-ascii?Q?Y8RbmFJs1i+sHHV9gJg88xQKRixfgXoeY2+nqiWc8/X2HoV7+3qbRBWeUV3j?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c915d527-558c-4891-4be7-08db15361a7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 00:37:12.2639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCeiIUWyIQo4sykLt9Rj+VhJ15Ob4CX7eJNrmbzzMa11Iah0SHJRyr1f0M8E94NUL+c6/L5AOVp4NBFiLWKmBAYHpYShdRGsSOEqJe69wq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7533
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Add missing include
 xe_wait_user_fence.h
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

On Wed, Feb 22, 2023 at 10:07:16AM +0000, Matthew Auld wrote:
>On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> Make xe_wait_user_fence.c include xe_wait_user_fence.h so it doesn't
>> rely on indirect includes and also doesn't fail the build due to missing
>> prototype for xe_wait_user_fence_ioctl().
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

thanks, applied all the patches except the third,
"drm/xe: Fix kunit integration due to missing prototypes"

I will re-submit it with the new version I shared

Lucas De Marchi
