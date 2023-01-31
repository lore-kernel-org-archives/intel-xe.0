Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59FBC636CC
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 19:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C1210E389;
	Tue, 31 Jan 2023 19:13:46 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929FE10E389
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 19:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675192424; x=1706728424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SXmQ8IIBEBto0pVdTkGXZ3SBi62cqvHv06j2xwuXHhs=;
 b=BhQA4l1I4SJPT9r/TQ7m0AcQKxX2SNzjMGvpkHd3QE+m0INCxCubsSmx
 lHihvqzNqQ5rJ1xMBYCaX4c8kzczHG5jKWRrCcyQi/c3KvlN5svGZ56HX
 OLgH25xA04uzm2JeuQ5RnEi0aE+r0WDQiWha3eyrs8CRCDzwHOcP/jsp0
 aqxjTPljFtHxRVsYIjHYPQ77xwdqfciy9TnpiOyDqef8CYYiRpN+f3Q7Q
 tdHmrcQtrwp3FXQeEYeuOGY0M1kzUXGjUwi+fbB1qZKcnsz/fSV/NuWNf
 B5zw9eP68ixrOgdSrLYyu6ZucicKGOuMoWn4BvkBi8eKk2kdj3Dq/q/vO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329201915"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="329201915"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 11:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910019987"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="910019987"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 11:13:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:13:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 11:13:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 11:13:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZG8W1VJnLmuXh9XGp6MAksMKGaIkb0e3tmlkriFybZH1bWwsfFmzX5ZR0UxuB81EEQnBCA5fzKZpmm+yAh5mkTUhLwdPQIk8/6aSPdN0Qx0w9RBshD6/g0EoLnDzP/4nHi9WxW8BR09MhhahLsdmvFRnmMfehnUfMOWBrBYJPhecVy4cJ8vXsHIARwP8VmSmCrEuQZ2+Rd3x0zNu5y8qocfVINDnPxXpROc80jspAGp/n0qjZWnX51AJqddJMG4lNtoJBcTF3DSzeT3mbVkQ3YuGvsqATBNs2AxbKYLiSeFIQHS3VAjrvgB4rDehulx+JswxXE9hxa2G+lxNFvlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZk2tA2MmgQ+QZrLerV3ByAK8FHWLK+yZyv2XRcfPtc=;
 b=lDXmNvAUkvVoNwynAdEm4cu3r+EQpND0/f2NvkZWiaTZUYt3vDrIragZ/nVx6FxrTvJe1i/TNYTyZb44b+NJHpSot3vqPcQo9DrzuvCILOuCow5ak+BR6ylIE1atZmFpsWkNjZYp4jDUgp+popLSv/7yjV97YdqAIalBEw0XuB/KwrqdHnGcbQcKSEXw/eGANIo4LrF2KVFpOxRR0SqDjGtFtdKHIgMjDmWYmfVbnxEax1b44EmfEmjbk1pcxgt4l0lD6FL0Woc53l3pgjxWEPJGxqIzPJuESmr1uInrbNq9xXWE4i+zT5J7OfAqR7mSDFK85msY4akne1enfBQ2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 19:13:21 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 19:13:21 +0000
Date: Tue, 31 Jan 2023 14:13:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y9loTUvw3vtK0WnF@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-38-rodrigo.vivi@intel.com>
 <Y8/9Sn1LAkpDW+Ex@intel.com>
 <DM6PR11MB45291BB4644955E0CED4447995C99@DM6PR11MB4529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB45291BB4644955E0CED4447995C99@DM6PR11MB4529.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d45ca2c-0db9-4b98-5033-08db03bf377d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGLmw8ItqYt+rk6dxOvkLKzvs8xPfSXdc6MKLMVRitEPeYrrj1VKf8ZbuLkvto+i5ZH0SFTvFDjOSm/0E44p+o6h/+8QWqOHbXFA8hjyZ8oV/JsUuCFkArlzJnX4ccea6RK9MyG2yPbj9zRJku/umr/ufucxH278yHtcCApJDG9BETlA1zyf0eQCtADqrLnm1LjkaxUmYIKFPwVzos3MB8qZ3WVcgXPF4GXQJ+6EAJWA4RbqDINC+DiCpWGfEivYj4vbBXa4Zaw+KkTrWzDCbp4hPWjnqO48K09ATCE5olPFUTow+sQF80Jc+EvH6bR0OTpqQUslJ7A+k82cHcPNoXHGfID6UBDxCjuN0klfy9GOPAuV9WBzQMyhWb2QPezOTvfbUYg1o7jXIruHR2MwlANFsPMwlFVrN3hfsglR5ftUg1KA2wnahnkrD/K1Ah9CGihvARiUg+9ora/h7cQvCupaAsAHmh+7HeU+lewv0AiMwNULk+Od2x8rcs1sAxKxnTCm02aza//uF1Hiu62YTMSl/jL5l7M/5iIWLltzFKGkGe7d75EyEVCCX9a6Rwq4Cn/JygCjZSISxxAw62UtX0QVetURVDLBo1F05bIGB2je1SDkHPo2Gff1KLddeS4jZdN2JCRrdui0Q1YxM1k8RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199018)(44832011)(83380400001)(6486002)(86362001)(38100700002)(82960400001)(2616005)(26005)(6512007)(2906002)(36756003)(53546011)(6506007)(186003)(478600001)(6862004)(6666004)(8676002)(66556008)(66476007)(8936002)(4326008)(41300700001)(66946007)(6636002)(5660300002)(37006003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I0RjfxvH4Vg+nr/1+2aX5fxYyoAd7ihkUxdstbta5/0+7uQyrI/dvXbdSk2T?=
 =?us-ascii?Q?TBLx5ZGqlgmg1hjY+y6CeH71XTr+v2iJtzObPQwUqRVECOEdoFRzI4armd+b?=
 =?us-ascii?Q?O4igk6ZmbesYikKGN/6hnsiHBYI8ZsMtgyxb+uqEbK5cQeaciHsKg6rGRGp2?=
 =?us-ascii?Q?wGu2zGDdXVC1PsJjjwXbUBxE3KTBJ1ZmLBMSLlIgcf+SxfQZ+E+f/6/db1Zx?=
 =?us-ascii?Q?hnSBdHPh44MGn5y+11QC0h3zOri/umFALTpikRyj0WNpGxpe2mFK/M+5QsNb?=
 =?us-ascii?Q?CFLL9/Z2L5Hi6ySvr7LZQIFCWXqOpRy92PjCrfDKwcalZ8+E7bWV5RAZKwfZ?=
 =?us-ascii?Q?49omGqIQRTHUTqEpvEhY23R+7j18emqynpF4EqCvm6A7IbMWbwSOp5YhpZuX?=
 =?us-ascii?Q?O5hABE6YFlpXFRXGI5Tvi2ESNjQy1qpfokxHQIoBHxUT6WtIMa0/djKtV007?=
 =?us-ascii?Q?2Pu9JV/HjZIgFl5lu9T7T7PyiOw/1RQsY8GnbXgQDJTGrwtf9SeqlTaER+QE?=
 =?us-ascii?Q?kauZTooLuGCGFY5eNb8cVYqUmjxNH2ES+fT33AdasmQNwe3BcnaBNEmRz+0R?=
 =?us-ascii?Q?j1BUPbXPdYERZcB7+QX7PB2dvaWWQTnq3Yp+hKU5G5BJQ4PbIpuot6T6QP9x?=
 =?us-ascii?Q?kCQZcoWBnl2/TqXakm3wBTpXO9BtttPT0fDLSUKy83ijfQqmiGfdisHpVGDs?=
 =?us-ascii?Q?3JkXJugByh4kmXmsAD4jeXLuXX+pYEACK3fYg5a0h4Y2Z0SDRKiv5cgWULhA?=
 =?us-ascii?Q?sHF4+gftIyODIlP7UccYNy0bwFo9aCpZEfjlcSLsWEeLQTFlli8mIhwVKi+C?=
 =?us-ascii?Q?n6d+V04RM/mA4oX7gb9sycBLmOvu3W4WiIQNexRmSH2WLGJ+omihrxTvMbbF?=
 =?us-ascii?Q?5Wt9YAGeY/SPPF+43SUK9LCa3v9Q4i0DUnMkYuRA6E1Fx86kqiOELH5qPDAw?=
 =?us-ascii?Q?oZ/nd79iPYnqUZJGHjj+VYy0e/yYYG8dG0EFPYQWN6ThFA7b9Vf1PPHK3kJ8?=
 =?us-ascii?Q?bFdI9Zkq44SjGiTGLGkZj+n30MEQ30WDKfY0IVO1bMQ3crUmiiHDDn1NmZum?=
 =?us-ascii?Q?EmmMpDzJVYxboGTHFa++sBjliRkDCpqlR+S3nNqKTpmwIPRe53ce12jQa+ZN?=
 =?us-ascii?Q?OqOdD/EUWXkoRW+IsYcn6tYcGpBwvXR/k/I/u6w3XgkhDoYvufVBTPeHywdv?=
 =?us-ascii?Q?rupXA20hMndYXhLBg62MnKAlXFHIugD4jd6HAb9vdRJGR1h6hOJ73rZnUGJa?=
 =?us-ascii?Q?aZk1sC3EzaljrUYvAmUeT/RaJm5hhaSx+IB+F/Z3BQDSN87toIm7OgcdOLE4?=
 =?us-ascii?Q?BCBdccOMSJUPUhpOOr4EPXRpI25Yin+J+T4GHlDP2lkEIUgiGIWdS3qeoowB?=
 =?us-ascii?Q?Sf+lJBBnE0Vu+1sdtLymMHARgdN+sR353ZUnoidO76e+FMPqmE1vdtCmv84e?=
 =?us-ascii?Q?OLsXsDzwhwWuJqPoCjOzGXmtZSKzB9764dHLFA/yt1TuVCvcJtXN3kXmeur+?=
 =?us-ascii?Q?QvGKR+KCK6zPBN9q240GhGbUZahfN7kxIB2TuHRgBTNtCedJrywxZlSzTVy7?=
 =?us-ascii?Q?hPVQDw1pdk9STv+NnyAvsZTHFNfep5hP0VQJSV5iMHtsQ85eQRygTpWfTNdu?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d45ca2c-0db9-4b98-5033-08db03bf377d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:13:21.0309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlkW09GVfuVNB3zRkDx1vLYJMr+/Wgk57ymePeKlhSve6MJ3uLEvGePitkyGi9cNN+QIVCzUJtZntr2ZyOfNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1
 instead of BAR2
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 04:25:16PM +0000, Lecluse, Philippe wrote:
> On DG1, BAR2 is not reliable for reporting Vram size, need to use GSMBASE.
> Simplify xe_mmio_total_vram_size to report vram size and usable size.

Matt, with this as commit msg of this patch, can I convert your gitlab approval in rv-b?

What about other gitlab approvals? can I convert them to rv-b or
do you intend to go patch by patch here in the ml?

Thanks,
Rodrigo.

> 
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Tuesday, January 24, 2023 4:46 PM
> To: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com; Lecluse, Philippe <philippe.lecluse@intel.com>; mchehab@kernel.org
> Cc: Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1 instead of BAR2
> 
> On Thu, Jan 12, 2023 at 05:25:38PM -0500, Rodrigo Vivi wrote:
> > From: Philippe Lecluse <philippe.lecluse@intel.com>
> 
> Hi Phil, could you please reply with a commit message to this patch?
> I will add on the next interaction or while merging it.
> 
> Thanks,
> Rodrigo.
> ---------------------------------------------------------------------
> Intel Benelux B.V.
> Registered in The Netherlands under number 24134020
> Statutory seat: Rotterdam
> Registered address: Capronilaan 37, 1119NG Schiphol-Rijk
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 
