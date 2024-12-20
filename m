Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2111E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E98D10E18A;
	Fri, 20 Dec 2024 21:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mf2+SXAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECCE10E18A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734729279; x=1766265279;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U8pmlJT1bcji1+4CpTioQDYzGATtCeO3TU1WiO5b/K0=;
 b=mf2+SXAbOUX7JxfBubd+kOZcjX1dQWmQzdICsbl/31UV1zVcPuewNQel
 gFKvEUlSQd7s+xpFIs2UZ4Fa4BlcFpLwTrtUXsfaYPzDD7H4/XSLRR/BZ
 MTrxjXL42wSHacBBcQQlaPbbgjqhkk9bflZgqDxOeGc6r5sU7MugBbjPv
 1ZmASPhYZZYH1fikrsolIkRH1/mzqQYbfG83eUFiMi0XwfFXttwmoSLHl
 gQ6Y3m0WA9Gvr1NkCyRdj6zzvCloUebeK0V5kCP3CQSqqNQ5mXCxKFA2x
 q1Mm9MUETOoNvahd6WY/gHQL0GodavuE5w0y9rvbd7g0X4K4kTcZEVSqp Q==;
X-CSE-ConnectionGUID: Q+9VXwjPRCC+O+beIPDY6g==
X-CSE-MsgGUID: BoOS+TZ3QlymaPtx8Z5njg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="60672467"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="60672467"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:14:38 -0800
X-CSE-ConnectionGUID: zilg+bvRTiCHZ6H8sV8/Rg==
X-CSE-MsgGUID: ZmPnekrtQiKMm/0AH89cUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102730704"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:14:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:14:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:14:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:14:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdxsIrssKkGtkbMUiarNODT/j4iSYuBa+nys5/x6t9WodqhAL2MwsZ5XXqMwnn1uilcblgSOwfLLX8v9KxwDklCITmbau363EFwt6cdAeJVGAJ+GOuM6nnfbxRiosTkaLuzDCmyxeZiK7cCyVktk0IUsc+ITSMSoHslJJn6ninoSD7WcFDXAD6EXkyuORxDJ1km0srSZM/AoEWkCWqmNxLB3o4odPJPYGBRX6D6iIuZ1VyQqcywVIFH08stHh5YCu4jn0j5/J5wWeRQWaBuz0IWgw0B9s6TirsZeVLT1/EtKRpareCwcK4r/yEm2yaTcmN5ly6pmvkRGHKqmCThY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0HEIAE/PU+uph461auWjOmn9bK2xPKf0fowjWPcUNw=;
 b=GDoziPHGRbEigPyts4X08boXfSdQaRcSWpBF68AkTIDcfGnPYwIGEBG0la+fnmhxrka5vUSrSg/o8wjHpFsUf9qEZP9NnTiBxocQnMeMRDLjwmqEXWK3JE4wNquIJX9oVo5WUKgT3hqdxVSfbUiRwnYuYmr6DDoEdJTkoZaeQEkie3/clGIDJbnOG8Ftq0FOuWUPXvrtopZl7sJy3+4Fe80iU4otMw46cjmp1qRH2r1zj/ROXC1o/nwMCDe3d3xai5y3GagdG5G0E7iPa0qdL5JmkV2EFk0PDOSox9jLDRT5c68VMvKEQY4G328GLO4ezv/xgvTrpRRqJScJ1gcthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5877.namprd11.prod.outlook.com (2603:10b6:510:141::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 21:14:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:14:17 +0000
Date: Fri, 20 Dec 2024 13:15:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 08/11] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <Z2XeVStCNRhSaBxH@lstrano-desk.jf.intel.com>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
 <20241220194205.995-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220194205.995-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 12768948-f6ec-4541-520d-08dd213b4332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AdQgjCaNNU/j5b0O3xUuC6KkLSj9EcbQfa1kh/FaGn/5nr5raMZLuKe1Rv?=
 =?iso-8859-1?Q?6tthwxQQT+Ui9ajGUaDz4DG0SzdwnvlX5b8Z2+H3HnRA3PoXDHmtTOkQ6w?=
 =?iso-8859-1?Q?MYJaqPv1teHFZMbn4UJhV1NHGHeQk5YjAw+A/nk9Z/X814bnU4aXpQLSMa?=
 =?iso-8859-1?Q?SFIrSULr8gWn43wyHG8fFo8MOivdvLSWHdr6E+fWzPE1ZvnPYY+l+ZVZ/E?=
 =?iso-8859-1?Q?ChUNgP3qJZFGnluE8YjxxKHxbUQ6+UEMT57bfxo69O4Y9k3ii7v2qQ4jvc?=
 =?iso-8859-1?Q?+sfXobVsy2uwSai6XN8b1ouGvzclMc5YpFLeWaYVc1YVYwoZ0Y3wiyyjiV?=
 =?iso-8859-1?Q?F4BGDSNjR8nDQnaikdzOzsATOJtbCv0L3PCkJq9rLx/F3lNW5kFIRdX6Gy?=
 =?iso-8859-1?Q?FCp8ZISnXZPvwz3z89IjOZZI8OUCQScNAEn70lxjA5wreEO/t2HefgejFI?=
 =?iso-8859-1?Q?yWYP+zqsrD8iFQeje+qf+5tlSUhFslfmfdjPl4wnWH+tUYooSq2lPbNeow?=
 =?iso-8859-1?Q?OTKx5cBPXgE3qJ9h5zLJytfbpePw6936EJ/feIojIZqA04ShlJ+P8ioHi9?=
 =?iso-8859-1?Q?RCQj1XyucQ5JytELasQy2tMpiJw0sNCkY9uvDz15jO7h+jevJ5HTyniIR8?=
 =?iso-8859-1?Q?gF2r27r9xjhgRQbRsAPCeRqoQqwTObcs0kEndINMB7nXxajxh2FgsiBAZX?=
 =?iso-8859-1?Q?XJU6jupczprqYiuATSUwcGXXml9xUUDQh28HNTGIiD06Q5bGUsk3PB5iwj?=
 =?iso-8859-1?Q?gTpPsX2wSzy6+WPd3eh+KWyb5DQT3CzSuRHl031HPedIKFtfUUCd6YU6Qc?=
 =?iso-8859-1?Q?l0uuMgyi8iSUKC2nnjuQpLdQj+UeptjiCojjRLHmCsvM5IvGgfV/qRDG8D?=
 =?iso-8859-1?Q?vqzJ1688bY0OSsAp/O1peS5faWqO4IonSsDaK2dEfLfJdq5DkrxgiNsSZ1?=
 =?iso-8859-1?Q?5bU9ODv+mMEgE2f3wVvlICUFdzQuegjk7Nofnq5xbNFxcnNkukz32qa8bt?=
 =?iso-8859-1?Q?OUW7qTKgmL91AYCfyOo8VNFedUfq8GLJFcFtKh4Il64/4YVYeQZU0F5KfA?=
 =?iso-8859-1?Q?aSYH3HcC4+x69akWfX+lsYvHWFpAUdJ+h8R+94WSMjQ8YW1f2kTTvv/Bwp?=
 =?iso-8859-1?Q?NkjPS8DFrODi3E75+jjyoCe5p1Lfkm3RpQCdG2QhpVMNsd/nfN2zVzhAb5?=
 =?iso-8859-1?Q?UVVqKIewtBkVWYi+kidDq+9HFyLVucgzi3XRXWK2HceWvqeiTSCBu434eE?=
 =?iso-8859-1?Q?6apVoH5xU8oAPuXkqn8AQk62kOTTl2WOzpsMsY+sK7ZI/BAALsDR1gK5U5?=
 =?iso-8859-1?Q?2EwZP5THZiJHLOo7JZnrGQ4OOhjjp1cb0e1JGxHUm4O0ZViA1c3tMFVueR?=
 =?iso-8859-1?Q?7Ot8da3h0akRDofyntkyC+ytE9grmxhmLZnyYtfR0BbobToJOhF1htN9bD?=
 =?iso-8859-1?Q?FTJoCOh/tTGu4EKm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e0uatvpyqq4nuxAFeszTJcwBCDBASiJBU8eLTBE3BedWclf95uLt7l1XPv?=
 =?iso-8859-1?Q?TDfgg6N4GGi9AGVJjlZzAMmSIrNe1SC8BH4QwCfvpkUOwyAvezuoNvCw9C?=
 =?iso-8859-1?Q?znANopKyWFO0nlvOpQtCwxFqVUOnjoGfbpFdOKJREm4yo9N20x/F9+h4lg?=
 =?iso-8859-1?Q?gtar2c5YHPUWHHSGf0JBm4h1GcaxupapksL1vBSF55C4ajmcVJRo9RNjuO?=
 =?iso-8859-1?Q?mrFg4dKixGRvWpgmRpA7R/B53m3CD1otQQZxfwBALe34gxSjYz+kjNNGLs?=
 =?iso-8859-1?Q?Bd4ZQoveo+CYiZv0gFHPuLG5MCexZ1FRnWxmTfFVM8979mL76wtVEM3jC6?=
 =?iso-8859-1?Q?wA+LRf4IB1WmZHKKcGLHUudbJaEN6Lb05ikkL+upwwOmgHfol5iZ/NulY9?=
 =?iso-8859-1?Q?K6noNDWnI36bXc/1FKl4J3O1RPZcUcdFWw0sYEwimgagc8lKgPUPRwsa1Y?=
 =?iso-8859-1?Q?QzBhDkoqvVa/mizPSG/vvhJsE4zaO0xBV20yrF0lRyuWkBkcB7zHaqV9EM?=
 =?iso-8859-1?Q?vqdfLcYteicrkxYZjIlV/VBrGPUW2RTm/eZAIDFJIrzknFH7V30P0FONwy?=
 =?iso-8859-1?Q?nWONz6HMw3XVkV7AHYHD6Smv6KQ45zhO5bgSDF/lZqM5WWzvq38TnieJaC?=
 =?iso-8859-1?Q?lpFAf6sbw1zJjICJyt8GaiIpf5+QjdFm1k05O3+oFiUGrEFuZMtfBQzuaE?=
 =?iso-8859-1?Q?ck0z2pfiI+XXoa12diaNCc+/qVG6uXAqH9Z5WxX6AmCegHQHdVgQyU0dCC?=
 =?iso-8859-1?Q?jTF/oHMNeBHoqzDhycQPbmIdGpPfBiK/tH2H1Qrxd+JBaOyhrQXoXp4PG1?=
 =?iso-8859-1?Q?Cf7TnvWpRg6GvBu49KrgXJw8hKc3oFc84DqsFmExUNmKnsI+S4xpDBeZeW?=
 =?iso-8859-1?Q?MBeqkxQC19YKRYMQzmEC/uornOGJzX7RBz0hUDJLwWxiIeKqr/+IehrqIg?=
 =?iso-8859-1?Q?WGmEbSvQUSbP3wi/L+ETBFwu6QpSlGD/9LwrvB9xkMM+6XZR+HyWitwlzO?=
 =?iso-8859-1?Q?owFtUpOIrmPwKrWQ/rpv6Vve0GhN/SiMHCvR1Ene+kGnQdTU9G0nkYcnDX?=
 =?iso-8859-1?Q?FMdtcBzFw+zWt555B+kPBd3eL0nbHGqa7HYNwHhBVQPz9SoNDHtNmwkmZ5?=
 =?iso-8859-1?Q?b3AevgEjoYdbTwW8FGxj5jgT+bpAVENafxNH7gFdYFQlnTR2R5TIEDCytn?=
 =?iso-8859-1?Q?m+DmuMuaPkmxR7t3dAbBsHG1Z8YKSvn6nwykfkSlXEdqxvaOyQhdn5a1Ns?=
 =?iso-8859-1?Q?/JyEwhtOep5gB6ZLnIRWPLpAM82tK8ORo3gtXIE+nwO/nfA4LUbTtvWhpL?=
 =?iso-8859-1?Q?IirFXDiac5fdvY/WSMuGTVB4aaSkUt1DGS8NIrKp78JbF/xeBDOl8ZiFMc?=
 =?iso-8859-1?Q?9ycUcdhKgSybnzaOPbPYKIF7KqDWxrNHU7F5JXeFvV+U7bsdXYJkfb+g1K?=
 =?iso-8859-1?Q?KKi8Q+GCA5KaOkFqwF4njOhEoY6Xh7AseYbyCgPlEbKjhyl0uM7TDsu9E5?=
 =?iso-8859-1?Q?xC3Qr8G2xdk01biO0UPjZCxkgCfCneIZRzBABpDUvw4Ym4Ucg6wgx+FTOk?=
 =?iso-8859-1?Q?GYMGDqsPShADC6SQKkxBfJT2tgH3eSJVYiIvhOJl/4Z4wWcHD1hypFrToO?=
 =?iso-8859-1?Q?82MY7bbWTa++4ZXtJ336qe8nDCJRZE3rxZVCTzBR9N6qDl5hHKUeCaLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12768948-f6ec-4541-520d-08dd213b4332
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:14:17.1661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YSXlt/0/9s4rSrYIfm6FudPFMB6l1FgC/WvI/ksL5Y937lYlo8cfml4F34S4KjO1bV2Esq2DHHrBp5Fw/SLgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
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

On Fri, Dec 20, 2024 at 08:42:01PM +0100, Michal Wajdeczko wrote:
> The purpose of the GuC Buffer Cache is to maintain a set ofreusable
> buffers that could be used while sending some of the CTB H2G actions
> that require separate buffer with indirect data. Currently only few
> PF actions need this so initialize it only when running as a PF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: base it on xe_sa_manager instead (Matt, Rodrigo)
> v3: move init to xe_guc_init_post_hwconfig (CI)
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/xe_guc.c           |   5 +
>  drivers/gpu/drm/xe/xe_guc_buf.c       | 172 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.h       |  47 +++++++
>  drivers/gpu/drm/xe/xe_guc_buf_types.h |  28 +++++
>  drivers/gpu/drm/xe/xe_guc_types.h     |   3 +
>  6 files changed, 256 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed738..2a84c799e946 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -56,6 +56,7 @@ xe-y += xe_bb.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
> +	xe_guc_buf.o \
>  	xe_guc_capture.o \
>  	xe_guc_ct.o \
>  	xe_guc_db_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 408365dfe4ee..1619c0a52db9 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_throttle.h"
>  #include "xe_guc_ads.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_db_mgr.h"
> @@ -743,6 +744,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_guc_buf_cache_init(&guc->buf);
> +	if (ret)
> +		return ret;
> +
>  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> new file mode 100644
> index 000000000000..261c7c74417f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/cleanup.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_bo.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_buf.h"
> +#include "xe_sa.h"
> +
> +static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
> +{
> +	return container_of(cache, struct xe_guc, buf);
> +}
> +
> +static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
> +{
> +	return guc_to_gt(cache_to_guc(cache));
> +}
> +
> +/**
> + * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
> + * @cache: the &xe_guc_buf_cache to initialize
> + *
> + * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
> + * indirect H2G data to GuC without a need to create a ad-hoc allocation.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
> +{
> +	struct xe_gt *gt = cache_to_gt(cache);
> +	struct xe_sa_manager *sam;
> +
> +	/* XXX: currently it's useful only for the PF actions */
> +	if (!IS_SRIOV_PF(gt_to_xe(gt)))
> +		return 0;
> +
> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
> +	if (IS_ERR(sam))
> +		return PTR_ERR(sam);
> +	cache->sam = sam;
> +
> +	xe_gt_dbg(gt, "reusable buffer with %u dwords at %#x for %ps\n",
> +		  xe_guc_buf_cache_dwords(cache), xe_bo_ggtt_addr(sam->bo),
> +		  __builtin_return_address(0));
> +	return 0;
> +}
> +
> +/**
> + * xe_guc_buf_cache_dwords() - Number of dwords the GuC Buffer Cache supports.
> + * @cache: the &xe_guc_buf_cache to query
> + *
> + * Return: a size of the largest reusable buffer (in dwords)
> + */
> +u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache)
> +{
> +	return cache->sam ? cache->sam->base.size / sizeof(u32) : 0;
> +}
> +
> +/**
> + * xe_guc_buf_reserve() - Reserve a new sub-allocation.
> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> + * @dwords: the requested size of the buffer in dwords
> + *
> + * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
> + * Must use xe_guc_buf_release() to release a sub-allocation.
> + *
> + * Return: a &xe_guc_buf of new sub-allocation.
> + */
> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords)
> +{
> +	struct drm_suballoc *sa;
> +
> +	if (cache->sam)
> +		sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(32), GFP_ATOMIC);
> +	else
> +		sa = ERR_PTR(-EOPNOTSUPP);
> +
> +	return (struct xe_guc_buf){ .sa = sa };
> +}
> +
> +/**
> + * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> + * @data: the data to flush the sub-allocation
> + * @size: the size of the data
> + *
> + * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
> + *
> + * Return: a &xe_guc_buf of new sub-allocation.
> + */
> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> +				       const void *data, size_t size)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = __xe_sa_bo_new(cache->sam, size, GFP_ATOMIC);
> +	if (!IS_ERR(sa))
> +		memcpy(xe_sa_bo_cpu_addr(sa), data, size);
> +
> +	return (struct xe_guc_buf){ .sa = sa };
> +}
> +
> +/**
> + * xe_guc_buf_release() - Release a sub-allocation.
> + * @buf: the &xe_guc_buf to release
> + *
> + * Releases a sub-allocation reserved by the xe_guc_buf_reserve().
> + */
> +void xe_guc_buf_release(const struct xe_guc_buf buf)
> +{
> +	if (xe_guc_buf_is_valid(buf))
> +		xe_sa_bo_free(buf.sa, NULL);
> +}
> +
> +/**
> + * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
> + * @buf: the &xe_guc_buf to flush
> + *
> + * Return: a GPU address of the sub-allocation.
> + */
> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> +{
> +	xe_sa_bo_flush_write(buf.sa);
> +	return xe_sa_bo_gpu_addr(buf.sa);
> +}
> +
> +/**
> + * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> + * @buf: the &xe_guc_buf to query
> + *
> + * Return: a CPU pointer of the sub-allocation.
> + */
> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
> +{
> +	return xe_sa_bo_cpu_addr(buf.sa);
> +}
> +
> +/**
> + * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
> + * @buf: the &xe_guc_buf to query
> + *
> + * Return: a GPU address of the sub-allocation.
> + */
> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
> +{
> +	return xe_sa_bo_gpu_addr(buf.sa);
> +}
> +
> +/**
> + * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
> + * @cache: the &xe_guc_buf_cache with sub-allocations
> + * @ptr: the CPU pointer of the sub-allocation
> + * @size: the size of the data
> + *
> + * Return: a GPU address on success or 0 if the pointer was unrelated.
> + */
> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
> +{
> +	ptrdiff_t offset = ptr - cache->sam->cpu_ptr;
> +
> +	if (offset < 0 || offset + size > cache->sam->base.size)
> +		return 0;
> +
> +	return cache->sam->gpu_addr + offset;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> new file mode 100644
> index 000000000000..0d67604d96bd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_BUF_H_
> +#define _XE_GUC_BUF_H_
> +
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +
> +#include "xe_guc_buf_types.h"
> +
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
> +u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> +				       const void *data, size_t size);
> +void xe_guc_buf_release(const struct xe_guc_buf buf);
> +
> +/**
> + * xe_guc_buf_is_valid() - Check if a buffer reference is valid.
> + * @buf: the &xe_guc_buf reference to check
> + *
> + * Return: true if @ref represents a valid sub-allication.
> + */
> +static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> +{
> +	return !IS_ERR_OR_NULL(buf.sa);
> +}
> +
> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> +
> +DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
> +	     xe_guc_buf_release(_T),
> +	     xe_guc_buf_reserve(cache, num),
> +	     struct xe_guc_buf_cache *cache, u32 num);
> +
> +DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
> +	     xe_guc_buf_release(_T),
> +	     xe_guc_buf_from_data(cache, data, size),
> +	     struct xe_guc_buf_cache *cache, const void *data, size_t size);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> new file mode 100644
> index 000000000000..9e123d71c064
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_BUF_TYPES_H_
> +#define _XE_GUC_BUF_TYPES_H_
> +
> +struct drm_suballoc;
> +struct xe_sa_manager;
> +
> +/**
> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> + */
> +struct xe_guc_buf_cache {
> +	/* private: internal sub-allocation manager */
> +	struct xe_sa_manager *sam;
> +};
> +
> +/**
> + * struct xe_guc_buf - GuC Data Buffer Reference.
> + */
> +struct xe_guc_buf {
> +	/* private: internal sub-allocation reference */
> +	struct drm_suballoc *sa;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 83a41ebcdc91..573aa6308380 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -11,6 +11,7 @@
>  
>  #include "regs/xe_reg_defs.h"
>  #include "xe_guc_ads_types.h"
> +#include "xe_guc_buf_types.h"
>  #include "xe_guc_ct_types.h"
>  #include "xe_guc_fwif.h"
>  #include "xe_guc_log_types.h"
> @@ -58,6 +59,8 @@ struct xe_guc {
>  	struct xe_guc_ads ads;
>  	/** @ct: GuC ct */
>  	struct xe_guc_ct ct;
> +	/** @buf: GuC Buffer Cache manager */
> +	struct xe_guc_buf_cache buf;
>  	/** @capture: the error-state-capture module's data and objects */
>  	struct xe_guc_state_capture *capture;
>  	/** @pc: GuC Power Conservation */
> -- 
> 2.47.1
> 
