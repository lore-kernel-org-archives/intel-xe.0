Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4784C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 14:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A186F10F8D7;
	Tue, 30 Jan 2024 14:58:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6303E10F876
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706626684; x=1738162684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1hlkWzDfSiP+gEklPChoowplftHQnjxm77p4RfAq+Yc=;
 b=nOMRsv93BJPeGN1DV0BCoZiFGjXdFl382yRi2ViCljx2DNzF9Zq4Eh5T
 +cteI3Mxv8d4lg6Z23iZV3Mux0vWcJ0tvN/791La25BbewO3KgOL4igVW
 Ft04xdyrrfsME6WZmYkobReozTNalY2PR7NGR270OBBpCRMK+p5Nbnk9x
 rWhHc7cCca12Eyl2wp/4O/phVIfu4A2V5zmo/U+G2pn5MrPJnlV6grXT8
 hUG27D45ZTjk8WtWrSb12FaGgGjUmLbmY/dFSL/AgPH+MU41wHav7SGaY
 2KulMlIljW043cwLnK9n0+VZMGxDANQNm0q6R0yHe4uIRlCJTI4UKiTku w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="400439549"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="400439549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 06:57:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="22455392"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 06:57:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 06:57:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 06:57:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 06:56:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hk3//3eFyfBCrrTJd5jSB2pDhUeVk7/CzacmdSV8yvJwmh1d0rhPr8vBsFHJZ6eE/kK/ZP89M6wYLO02HLg2bLt/TDr/dGb1xjv1mv8ubsQlWjRhsBniqwQlmDvHJ2/C9J1UIykd/Tyo4OQcV8y8Ft4Hx7FBi0Oca4JKe5BBQswxKUXRXrDKtqtJW8woqF9okp7tz3HyId3Lxg9+7po0BG/q9k+I+U7+ehvAdKAgoKksZmDK+hBRTVzLRWKQiRb8lEgeLTcMQddBIN48r72XuduMnaf73hNMUCHpLz0y8NZ3HlWfezunOPDa+OTZp4uL3tIMqUksGwUHq7EnO/elqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hlkWzDfSiP+gEklPChoowplftHQnjxm77p4RfAq+Yc=;
 b=OtzeMoDxhfshl0mJaJ48sp88qezqdHJJDnWJHLn2sRt4PWdkEjs5uipnyvRwI/pU6SfQuYwu978feT7ZEzmf2Nk+6nf5E/ZC9rm+5Xb/RS8fuyJvEEKdjcJzvDD/N/7GYmab0bxsL90E1+cnRNgf8VtoX5Sa2XZhU/6btogWV8Mnw8u42Ck3T7ckk/SZeIGrNTwhqXd1OvXgMd/lhmYJFxZ08MiBvrbjOJIhGZdGijHWQHYXDt/GEVdX2F2lhz9OzFX0Mh0N5dB21emenqIICuutwz8AtQBpX11dLL3ywIAudb9G3c133cvlt1wKfqH4viz5R/+YIC2XFqyJROb+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 14:56:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 14:56:55 +0000
Date: Tue, 30 Jan 2024 08:56:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: Re: [PATCH] drm/xe/xe2: Enable has_usm
Message-ID: <7dfqiyheyhcankmgpiplsbrjvt24quajjn6bq3t2o6sx7dyodc@5ovu7d6zftki>
References: <20240129214510.123829-1-lucas.demarchi@intel.com>
 <20240130002032.GB1201779@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240130002032.GB1201779@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2819a9-09a7-4ec1-bbde-08dc21a3b392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMXoK+elHPYaC7piqF1UY2RLUt1JZIEsfcNXqM2bI0FH1XCvigBW+Ak2daoP0mgDmohNAfexAmuqcpAcUwWXAG74uytg5GE8QzxxkbIXKkSHqJt1Ukv2lCLyboTGE2qh0kf5YLH2rnx32HM/T+YUzqrqbg9gZqa6lRuov96sQtwmvc+XXVhc23keOexGIwwMjRzPxTieKLGicFZkwb96iaSuYO6JN4XI2gQGcQ7mstdWV4m+7mLsUEyh7HkyCYfB+u/VhXREfJkUSVlBnzQWjmHdKp/dwP6cEdzq3Z1adbjdcijEkgq9x8zONuiSk2sr9OEaFBZ5Am9fea1zoDiIx0wSjGcFAZolKj00RwtsBSYuy/kgqhskFGU3106AKUoctpmrv3eVwbFiiNzi8R9WPZobnu1UZWpF2/L8hiIh19nnko43bOs+78Nf/X5L8T6EAa9aD+nxET1PJjkXtj7q6bpjrQIO+GqzwxtJOcy7vwcRMLkToZ5HsVQRjqZ0Ix97h9LxDhfzFzod1wuTFl6AUkmfsfEHf2lL/OQaUYwdwYtAw23F4oxJQyw6LZCcFpDm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66946007)(66556008)(6506007)(6512007)(5660300002)(6862004)(4326008)(316002)(26005)(8676002)(6636002)(66476007)(9686003)(8936002)(4744005)(2906002)(33716001)(38100700002)(6486002)(41300700001)(478600001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ejucwcTq2e6Pyrh6SgRd73xzkL4QLCDnMZ1h5nL2cCGeuzU2dJqF3g6NwIVD?=
 =?us-ascii?Q?WsbmcpbDzZsobLXC+xJs4yVKhdYn4ycOy2TvxhTebm25ZCet6Qnr8IHbgHkC?=
 =?us-ascii?Q?p/IWVYycHZX2SoeTMSBKuMQ9prtkK3Jhy4tBriz3VHo47S56U1axfZuyJfob?=
 =?us-ascii?Q?IS8NURmYQ56Uxs4rOCavQjSh+C9FEYPSSJcn0SAWFMZ8C5vR3nqUsjKOzJWT?=
 =?us-ascii?Q?VgzDp7k40C34idIsvQ1Y218W2Yw2OPYtji7QjpeunZnPhiARib5ynqQN8iWl?=
 =?us-ascii?Q?mQ2nlOJu3VOjbFBnQPf2btwa0KBfHoC60NskzWWoMxzXaFn8zhkWKnKTVszm?=
 =?us-ascii?Q?J9W4siRQgICbvaSbKmGih6aUHV86Kv3QqRJIHn26sfvbCX14GfjeSNIQpFrl?=
 =?us-ascii?Q?Ld+7ENTYrtSHdLkA7NEW7ba/x53R2pt72nLzttO191S5qb7VwSksdRXQr0xG?=
 =?us-ascii?Q?UXWUsotatGb2XvPZWADCLC1D9c5KPDNldIAvzTvAcCjoqQfO7hUbjt4q1/9j?=
 =?us-ascii?Q?dz5/yFHJ2/J7LzfzieBy4A8Z/FAcqVhjq3eba4UwJI9ZW4FNyaAQ9NP220LW?=
 =?us-ascii?Q?ki9gmysG50Et6RYK6ebBwIwoUAYp0yYc3g+0C1fgtx8M01+i915+Tl1/qKTc?=
 =?us-ascii?Q?c3nip+c9afOldgRKxm/aVG8jnO9GQ4A6t30Od0ITy+fXTHYLt+yw52QrHS82?=
 =?us-ascii?Q?1D5dsUSFlVXBqDUrD3jUwWJYRwkW8MEBDsCf02azsat0mWnxqtaIKLwmCdGa?=
 =?us-ascii?Q?NzWXuwazBCVCb4rlV96vBc9gIhtIB3FKap01SdZOMLsff3m/ldZ7gpzXRUAV?=
 =?us-ascii?Q?qLrAeE7FeStmM8ZKIImmMD3mISsDL7JKA7mQpl+HZ0t5B0wOfn0IpexZCR/o?=
 =?us-ascii?Q?OUrb2T1X1m4wRQCU/sNUe0X96YWfZZ8V9TeAhsLjxT+i2tAW72QgiAtc615i?=
 =?us-ascii?Q?VstPgfqlFVYvSj9M9ougEpb8yptITcFbTjmBYGN7z8Kfc/BiSs/BmZnIS9zQ?=
 =?us-ascii?Q?d7PRpMPpTjxdSqKaITkCzexgVs7TJ8+WUhmZ8FLppqdmmm7TMMappNVbeQaC?=
 =?us-ascii?Q?KzFLyixocv9Abc+basmCo0wB5KoykEMqjxvs30DnEEaimDUWedvdmiQxG21R?=
 =?us-ascii?Q?dCUEgCKc+cqMk8Wp31VX4OTNfLoaDCZkyD1TuxFmOstCB1vEAoCp23ep/BvX?=
 =?us-ascii?Q?4Dx81iRwbyFevQvihvlXBGo4nqPaD2Nm4mYEqXmtn/I7l+usdSGPbpurytYh?=
 =?us-ascii?Q?VVcXA4qV5rbpNMjeEc7UGgZDE+UpZ46ta6RPYRzgKhQF2fyEyhg35bMoDJpc?=
 =?us-ascii?Q?Uu3m+ksrRAZXTA2RmrflOkNkxCidAWicy2a3jSQtU6e+DeST6ZDOR3pBOOYm?=
 =?us-ascii?Q?t/oWiGcDVdz+XDVeKB55s2CxhrcANK+F/wAB5rXlP/JElJrjrq4OyYUP1Kzs?=
 =?us-ascii?Q?XM279gz+PugZUMwthmOiLfPs0G/UrpVfoCoQRklcNOX3u8z7Jp0p4XfurxDC?=
 =?us-ascii?Q?lvmR/Kr06ZttRXT/uFVhPLyU4L9v2Cdyqrpg2b5ollGipph3NeDyx0IAfxI3?=
 =?us-ascii?Q?0TO20aeEB91PcWxPYaH8ljfAwCWKWhmFI4oRmJAO2lRWxrhT/2siLPnx7ln9?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2819a9-09a7-4ec1-bbde-08dc21a3b392
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:56:55.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEKMA0oHVyHgFBuQ1NfVgIXI/vkLCKXaRIVc348Dsur8D0pimUn5BeV8L6zSqhmziTVGd22kzt/kTZNRKKLrsYsXxT5sp6122iOc79ebcSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 04:20:32PM -0800, Matt Roper wrote:
>On Mon, Jan 29, 2024 at 01:45:10PM -0800, Lucas De Marchi wrote:
>> When xe2 support started to be added, USM was still not functional. This
>> has changed, and now USM can be enabled for xe2. Remove FIXME leftover
>> to allow VM to be created with DRM_XE_VM_CREATE_FLAG_FAULT_MODE.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

applied to drm-xe-next, thanks

Lucas De Marchi
