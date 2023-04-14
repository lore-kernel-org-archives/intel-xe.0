Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488EEC77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 20:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006C110EE78;
	Fri, 14 Apr 2023 20:50:19 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAE410EE78
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 20:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681505417; x=1713041417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zx/mptT0iJfJetEK68UtcTxUaeHXmBaCcTFg55XNgzk=;
 b=Bdlc81EmpUO84E2aLX+DRaxi8xON2s6atuVTXuGHeBN77nMJ4dmaQBV8
 Nvi7t4BHavigR8NQe72B9yuLUtrHA5569BRkF58OL6Wfu4nYPqJLV6HK5
 croS/bym8vpTVwZl9MXiYmkUNmYvy3RvvUdcRNJgCAY45qGSnz5DlT6b3
 c4yifY0EH+cerlrBPkXTf/33VQxXCTxKGsJ2dA9btEZ40/CjU+eZuR2sh
 dhvBOKrBXUwle5d3tU0MaAibaWsVCBIO9v8TSdiksaFxPCwniQqhKydWa
 TfcoDnAbAPOe4fAkNpMuyfsRbDPmo7OaA6B9UlApalyxlytYKa5aAnTbl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="407452219"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="407452219"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 13:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779330146"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="779330146"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 13:50:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 13:50:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 13:50:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 13:50:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 13:50:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgQAMFzl4cMvrZUUKJsF+Kd2GQw9xqSmW40HbNPD5Z8ut/H4PV4WQqFpxIqLBhlrFYk8lDIVsZ+dgUyOi2IOKIm79ZXDiNJ5xpEkYk0aJczLcemQ0hUBvhP7a0iAr5bD+pHBHqQG2vZF3yqoEoRh98S0+3FcXCH4oUIrGnBvmQYNBxLcmPNtxoU4jH+/JqZCNYahS8qmc8FZJTY7yoA4Yr2Btq1WB0qqO4szC46yW6I5wo3pl0M2RKfkATdnaVlg1o72Azvr0EE8gRUfurnMTaOCI3u01HVXMaVr7y9+d/D/hCVVjMnePQDHa3gPN4dYGUbk8tWZJ7MVz6IkjDna9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NU0D19Asxx8iKDWQI1K7Fvb8g3nwP9hKu2mUzmni9I=;
 b=DhUgea0wFmfoclT6I+ucjZHe5JfO/9SK4n2aEl99Yb4fkKnn200ypx+73VQfTpHT6AQM5qZ23KQtD32kjleEVH0HnD2ewdqsDzugf4Whxoj43jHzbDqAlUNizVVUJ8D7EppaP6X4xfeBqKkJq8mr33U52/KBcM2kvAU2tndMJSlnRYyFtxVLrb5l4H6R1hIliGNOHtSuKJx/Tak8Ej2eUbwmk8vDQ/DI9W8bKoW8Bm/t6Ooyk2b+HUSjh1u3TPrPkmGjqWVujsURXjNXR/s4wt51dFP278cp7fP5fD9+NlRllb95wR54oV5vZcUXe4iYY5Y/7V2VahkvIspjnUDh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 20:50:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 20:50:11 +0000
Date: Fri, 14 Apr 2023 13:50:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <37lvhudczr53reu6fow7qwmhuw37f5dnakfsrqlzygh2h5ncpe@yfltsibbi5io>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 7560673b-3b52-49bf-a6bf-08db3d29d643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGrPcAuy2aAoJKvtcKJFveApLYELvEnIltVSvVYGl18SJSFwN70cEUG+qLYgLIGA754edE+fyq9omjHudPDuPMqqDaJvDet+rhGE6seH1y6jDUKbFpy+DIw5aCKXHolAWDb098NZFssiMWtPgHZBuue51w9kXq4WEjSdccSmJbwVKcvXf7UdjaMIw8kB0E72ry/9JBZPjn/uhrGaD+aJjknuVxFrBBIjKKC7wyZpbgrtU2RtGY4UBvW4AsDQoKddgYi7W1+e+GWL3We5Vv//fDomBRa1zHC0ro3wWV0Z6vQ7QbeV0Hz20j3oxYUhHKgAWMjl+iwwWiLOIPbYTRxSOFcGMNRWd3sNUsyzEg+/uujpRkKDF50EO1Gf51bkd7AfLaP79X5rPIe5LNPXi3KeRk9JhpEgoJWk88YEZc+Gb03n2yYpeaukZSt3brQMd33I9CiDjFC5VHKNbT/3TfH9mz6p3f4r0LnkN1YzPxccArH9rRtWwlsSvb6cgBFytV2cHzvnW2yJxUYT2mYP5vNt9aW9CK420NJ85yBQ0LM43dG1Ugc3Sg3QOXKiyugzE4S1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(6666004)(5660300002)(6486002)(4744005)(66556008)(2906002)(66476007)(4326008)(66946007)(33716001)(86362001)(38100700002)(41300700001)(6862004)(82960400001)(8676002)(316002)(8936002)(478600001)(6636002)(9686003)(6512007)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rnf/M0CvOG8SlgpsfVqnO0w1MlfmCQapT56czF9B2eOkvUVuWMDyCYgsMXKy?=
 =?us-ascii?Q?1rooKBd79VonEI5r9v8UiSE+B1UkAzPmzWAlIJ5D35xfVptXW9O8sn/rIR7G?=
 =?us-ascii?Q?79OtAesb3M/Vo9hiWhTh7YVU//1FIyF1ZCzSwqJgIFdYnUjSVK3mn2A/oRxR?=
 =?us-ascii?Q?bQMw7Ca6wZ2N49Tb6CpPwPz+IDNQPaYeyQdtIjFk5urpWw4BwkLuJj4lm9g6?=
 =?us-ascii?Q?pfmxYhmW1UhMMO0qFuV3eaQ4/98RT7teetKgY97ymKXhHr1bmoCG6yFoF67P?=
 =?us-ascii?Q?fHn0zY9TU7BPlTJhUEfuQKXH8UhyGgtf6GhDmyfRzoGoeEqiIX+bkV49M5zP?=
 =?us-ascii?Q?WxfDnAuKmcmUFD8jAT4lsvJDdmecvR/f41dDRD3t2pfRLTTdpgXtQBDPrQC1?=
 =?us-ascii?Q?PLbQiYQwhZFwr3YJpgRb5mX49ohLMwb1hX7mONDmcoVb5i2mLxDtnH1IYwvN?=
 =?us-ascii?Q?c8P57fUVHl2HbLl838x0EHud92q1TIMuXWrEGSVKSwSQ5+sL4nzF3ZRDKg6T?=
 =?us-ascii?Q?zqvZlnjbh5O4bJZ1k8JLGKDP/GnYlHr9MbU3H4vkJKLWJSFTFz9IluMvtLn8?=
 =?us-ascii?Q?n0/uso13KKm8dDnXmeeoAdRfCGWVTgnc4SWdSZImrmgR2QIVBMQ/iFdj8uqi?=
 =?us-ascii?Q?0CnNm9uZn7I81nheCRT12/H/uWGYlaf7Xx8m+kDb6SgG4ugu0tt3Eo2mQ40A?=
 =?us-ascii?Q?WOT5cBSG0lABbXdlslfbGPO8fi84M88DfeS4ZJzt6BFytVnXeBGcYr74kOWU?=
 =?us-ascii?Q?izQEGR97GHoGFllATGlwrKjRUA90JWpxaSNZcDVDgQNuptO8fpHnJdLoZQww?=
 =?us-ascii?Q?jY63Qp1nnxsUAeWA9Svz9a1SWA6crI3MNbRd24/de+VuVpT4T+kQ6m0lDErG?=
 =?us-ascii?Q?KprCen5/bZkOLRadzQ3Kmg9UB4E5GV9FdIdc2zsy6GF83dYoezXOv9A9Ml3p?=
 =?us-ascii?Q?c/6w32woDf8U1ZJB+Bg0zNPLBNmCMt7470OxVsR97piIK8ksF1KR50ULVPsg?=
 =?us-ascii?Q?RETXvlGgVRwm+RvhqzUjsGEV70zm/m7eq+smAZZ7oLt2T+XE+zMxjC5U4Scl?=
 =?us-ascii?Q?lQUZZI1nUyA39i8Mj3BYstLLWGkE4qBDFEYjl7etf2HIWePPrH+iyzDrMDB8?=
 =?us-ascii?Q?71wSnXG27YS7B8IPfLdRfu9MJbuVGXh9ocyXuG4qNYYDVUI9Tkx8xuRQZ4GY?=
 =?us-ascii?Q?gitxSkVLfE7m+m4FYam54dAdVzsoR58SPTkN9lbS+g0ev9bExstZq2yf7wM+?=
 =?us-ascii?Q?IAfCS6QhhbmfWfxW+SRqDbihMPXyIkfp7CpTLNL+b6HihMz5A73+0JVl9SsC?=
 =?us-ascii?Q?U+N1moO3mfoYtg5IPyqLIalC+dvVs0sr8XALWHX6PIZkGlZ9XU0ik3RE1tkW?=
 =?us-ascii?Q?AGbHervIVNjlIxmsuQ2xFRFh0CeBtMAx0Xerf3UrnoMWvD+N+aDYYdfVvU+v?=
 =?us-ascii?Q?MMWAlpgLbiQOZbG5GiUxRXnF0muaKK3M2tSjAfbEJMqKlqIAUghz+w8fhUpH?=
 =?us-ascii?Q?5DIFWwOpKNlQni/I/mmeTIi0V5Ra1qdkZYqIxrk9dwNMQpe2sSTGL8YCiMPy?=
 =?us-ascii?Q?ID/X+wJF6EjnDq4uQjHhS+oWLJzfZao8U19fUYTnr/Y3FQzh2UbMoqd3JGUF?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7560673b-3b52-49bf-a6bf-08db3d29d643
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 20:50:10.3920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zejblqHl24G/e6iap/R0ZBezFte0CfQz2uuU2IKymNr1zd6pv56KT6HrAObDtgucFpxVUB13z/HXrEHmijgxLfe5FwjsStcIbGm9hkPe1d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/8] drm/xe/irq: Ensure primary GuC won't
 clobber media GuC's interrupt mask
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

On Wed, Apr 12, 2023 at 03:52:45PM -0700, Matt Roper wrote:
>Although primary and media GuC share a single interrupt enable bit, they
>each have distinct bits in the mask register.  Although we always enable
>interrupts for the primary GuC before the media GuC today (and never
>disable either of them), this might not always be the case in the
>future, so use a RMW when updating the mask register to ensure the other
>GuC's mask doesn't get clobbered.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
