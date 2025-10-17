Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B98ECCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFBA10E1DC;
	Sat, 18 Oct 2025 02:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCl64vjq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FC710E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755499; x=1792291499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y+LxwofS2+b24Bt9x9gRuO0adEcmE15D/SPuKZTU9ZQ=;
 b=bCl64vjqYfgizhLVlvGkOVdacGvdEtC48+5Zyi0sxb0V3zmb6Nv/dVtr
 X9WVK3u6UZmV4YAhn5ExRvkbwiyuUPGnAQQtuml3XId8SazhNLMOmJ58U
 ggc08DXWFOx+mggYHvMyyv0P93bVO1DYbk/WKmC2wztYnD66CtfxO5fEt
 aerIiQitE5xO/TNPjS//jTKeNnoqwZ8YGQUbxzr5wT5Ol78pFM+M6vPSg
 D+jkDzn1WZlzHQrA/cYH8m33BdM4jYq2tEp6Gp1PmRgmcDyiF1VCWkJHp
 p+D0sgr/danDmCYPKbqFipanR9o7k3cZEcsS9AFcpXB0BdR3QucSjW5RI A==;
X-CSE-ConnectionGUID: QUqEsWO/R8qVYCd0WVud1Q==
X-CSE-MsgGUID: JYprpBjATjiylL7ho9RlUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="85588739"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="85588739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:44:59 -0700
X-CSE-ConnectionGUID: YC2M1kFKQRO/zSTW9TlY5Q==
X-CSE-MsgGUID: RlfIFcwJTWK7Saa+bOv22Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="206581816"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:40:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 14:54:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 14:54:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 14:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpAvJFv2wI7/Ns7nNvv66IzvUMNJnvxPNCgQQKDpsKxA79etYnqPsKDOKJWvCgWr2LUiu9XvIGzPK+NVnO62cPmXtnNEBD/rM4wMOCfRxgkD+C9WJk5TswSQDvLKha9WAgn9EHbqLcrtROB95zdtvzY29yjwmfKlCOFX9S6XRL6DNqGH8h5NdHdSBdGeNai5ba5y/x35WKaPGIQp+W26VRMqL8YgLzoxlKgxEAnC2c2IxZ0Rtwp4yCtZ8WTGzjsfhI/5fKMPmwHpPe/Ucl+NyATzpJ1K1Ww3oURW68hbTfHz+flEUjNmnPMN/MkG65lk4/5wqcSmxLlbQQeGe8/Krw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gBmT8BIMJ92zwu7n4p8hBewcNz9ITrHW+1y51MsFfA=;
 b=qwvbS0KajWzyrgqhe0iTbtw1qwFX8H6NBriewytxB75IdYsOvr2fdkg4FUxbk1EdWb2upmSVFyehQpstcnHBNu5SFoxbBZdyGs5ApSWEwRWRIErQzz00cgVIpzRVI2zPJzT5uRckqrl09zxyaXFfocA3SK51kuUkqGjXDPbXUQdry8RH0bFdLwHOxGHfKrkJJjAzfchmTE2v5a6xIikW5jFr8aoFBxQkPXZfVh2DYXAx5XuNcMvbsStJlvJ0q4d6CjmFn4tvBCmh76zPXYO8Od0gStCdWy94oylGJYmAgkcQzMq/gEqJGunK3e0W6pPj/PjpxBPwBV3UqN3KcF771A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 21:54:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 21:54:36 +0000
Date: Fri, 17 Oct 2025 14:54:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Message-ID: <aPK7GcLm5nYVHUy/@lstrano-desk.jf.intel.com>
References: <20251015104709.44476-1-nitin.r.gote@intel.com>
 <20251015104709.44476-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015104709.44476-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 009c9b78-f19e-4007-0019-08de0dc7c33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HGkO3C/oT1l89CWGzJegueKCu84G1RjaKbkThYgkPcR4vKdGzWNdfLaSbfyY?=
 =?us-ascii?Q?85j8QwalZZ47+YCmHJDclQqnWKkSLqmbdloqYRsUWqYrbCPt65mpd8OEjXRw?=
 =?us-ascii?Q?OaY2FBG+4oBmliJ6Tz2MD8VmWfjQmbCnrwhioOqCk/X+tvwZ9+XLFtvmHJry?=
 =?us-ascii?Q?SFInkXo7O4xzvh08He/4Su1z2/qWyKG0oXPWR9CA1K6K1gWceC6E0XKRHXns?=
 =?us-ascii?Q?hmh0s3ceNHnFbTYTLw1FSrdPJX8nOh6E0rJ4fqdWd6qBpST82DYgQOqkZAsl?=
 =?us-ascii?Q?Ochq9zFD/zwIitwMX8q8Rvuzon2krGWQee14rJ7VBqhk6mqbcWDpp7DXwvqV?=
 =?us-ascii?Q?ciu8anV2F7OUFUJrs6qBtzPWgOiyK6kzM25NctemF99dIf2Gc/m4DYL3rIPu?=
 =?us-ascii?Q?DAGtr5m62lVHZ+Lc3F9WD5n4lG7RXCjK0vwtWw6hfEEwzF7yxKrWspD00JCp?=
 =?us-ascii?Q?Nnqy7yOGV7/EWTYkhLE4MHhjk0ZG3tC1SjNwGLmiHqerVAl0nxhsR7qibo+c?=
 =?us-ascii?Q?24LqnpYRDvlUiBnXNDjLsXQuxo2WVWkMK8WDbQWPHE+fU99KkJW75bQQkWRs?=
 =?us-ascii?Q?n42ZzvAJlmaLFDf4qqEkHY5Xl/L6y/7JJFK7TtmfUThQO8v5jBPYqnAl2O/S?=
 =?us-ascii?Q?JfBIJ+uDQ+HCUUcffHI9RKJamgy8Zak0nh4IERxCaaD7WatgJxlbjeN+N101?=
 =?us-ascii?Q?abKGsOpvJ9a/HO2sM2ebyIg1LUncvCQRudi0IROsT2wpGDOrpa8vKF/0SR4c?=
 =?us-ascii?Q?vujQPrhEGTpPdCddCWLqmza1xgovbkJdrFLrZiqxaMsCdK0G+4ZlzFMfNvWh?=
 =?us-ascii?Q?cPh1GoJYIDpU3+a/t8qy94CKGSHNTZ0bbHlzJmBzkN8rERI8gGFVLORK6028?=
 =?us-ascii?Q?5Q1a1MxKZGIZl+rsYC1+toSeCX/DH1gpSyIl8z+I7nWghdw5hLlo81NQPw+Q?=
 =?us-ascii?Q?dxAY10KoTdkQDZVJ84+sIk1HHswLstM0ukkdZCSoLXwg2VtRbbDhN4T5T1nS?=
 =?us-ascii?Q?2Bb4RTAJPEmAmkCZwZRZYiIGAgOA27OyuUbMmZtaGVy8SaPNv0jBde7fRmCX?=
 =?us-ascii?Q?1DjBKI7LyUHdVzR98XMmBdB7UOGgEYisN4EqVUlvXLM0xEm5GWjz8kBhqoyN?=
 =?us-ascii?Q?P1na+hq+eoasCLl72854iVoulPTLxq0vzgTeXD4EEb8i+UIKhbQFT/v89W+3?=
 =?us-ascii?Q?6hzFlC8zuyHViu0el49Wk411mNV0QSjKilChtsN0uQ36z3jNGjqWWpriPReS?=
 =?us-ascii?Q?BE6tXDWJbW6f4CvjNSuVqtRrljVcjBLD/Np4XM5d6SO9+RqctpilIybOK0mv?=
 =?us-ascii?Q?M+aTl56NMGyytnFpe1Ga7ut0HAX4pkoETynCSFjedqEh5C0732sNPUkTrJXg?=
 =?us-ascii?Q?Mi7v8lxaN6V7j9IQ0gXdj3VtQnslAlamMLUstMY7Fm6FrWkzulfSFEJje8uH?=
 =?us-ascii?Q?+FycvtDOROq8RcFVAsJ5Cao/3Zthv6hJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3nWDeeazSIzPute6vTYJp7zekxByctBur0BNR2Rv/bj8XJew0ZK/mOJnbziA?=
 =?us-ascii?Q?8I84wTMxblqW5CHIyXwG48B1Gke6Q1xm2Gxqlg5NTP3APmwZB76gK+sfY0FX?=
 =?us-ascii?Q?XK3PRMWop+PUcZ04viSrDRjAvXPxZHZag0E+o2Nv7SKY2rDyraFtuTJQcbMa?=
 =?us-ascii?Q?ZQJLiX55mN1cPK94bmqdDmCep8I1Fx7My5DHttris4et/57SpIM8LVoLUzHa?=
 =?us-ascii?Q?Q4YXk+QHCvE5pmc7DtUmHDv/uMRvfjdizKbsetDOYv+pWLLEFA5x4T3D9BIi?=
 =?us-ascii?Q?9t5xUGcdISD4DAylvhqOwq0zbHIpMKu8fBGW8mfr5v5xx5Dhym1+8DvLUg6E?=
 =?us-ascii?Q?gwTU31pzTcG/0yrbKvvYpPErPdvbAjsK3THNDTI7qRsuwCtUKCsuTquP01NS?=
 =?us-ascii?Q?G9FMXTduUjBnsAXrPHj5rM8ZqHs5E94Ff+B8izWf9FRoStJGQqaqaf8HvHNT?=
 =?us-ascii?Q?8SKRAFlMkUc96JI5YMNK7IecpwLgwRQpOV5MVn1P+9OV2QCZCyVLeGUKrcs4?=
 =?us-ascii?Q?+3Xgfu61vUF1Qf+vGEE3rkmctbCjZEXdzw9lrRVaRmUJSDzAN+tB+HRzk3zy?=
 =?us-ascii?Q?jL5QOku2DwtnSjWVaaSOz8HDZ7vXtSZM2nXa9Ddt+6v5va3Yx8nx8FtpSUF1?=
 =?us-ascii?Q?N+F1euz3PZGtmCvRePTkb1jqfxLr3ZuetsiEoQfYHepbbSRHtd9BfTEX6o1l?=
 =?us-ascii?Q?sQem3A6pHZ/yMzRnqcujKWZgI4V9WMNgPHzIk6DJDKhC1gOhtQ36dF6/B65e?=
 =?us-ascii?Q?OGoXTtoT1u0zp1LddEtQM0vKkQfcQ0VEu0Mw35B/lFmkh/Mt4lIui1sfc6MD?=
 =?us-ascii?Q?NTc7JhEm318REGnI0NJDYwOggBgyEo6LIx9lEGIuhBzY7SAueXSqSjR70Vkx?=
 =?us-ascii?Q?WIRF2x+8194chyS+OwL0Bn20vafzZfrtNYZMA4F4J1ws3Axs9XJNn891B+hz?=
 =?us-ascii?Q?y4wjytVXMvJiYNchwGMzUs6et0nnIhxur26/dyVG2s6yg2RODxejdNMtIPaW?=
 =?us-ascii?Q?yT/gEcAMlquKqWL29IBul505F0g7BDXGnO49okdvEIDq27wmjKIZ6dOcbift?=
 =?us-ascii?Q?8i6d1ctXg5/9HG/MMsmac3bj2KTmpvaW2EBnnK2URnv86ehvI2MIpKigYooF?=
 =?us-ascii?Q?bmfH6SihIF2mstm3F7ui6auJPCcVOxafVA68QoBIQUwi5RJho1p8BtEjI39k?=
 =?us-ascii?Q?6hsZKZOVyQlvnNzgH6LipvwxzREIscfST1bOij+fffq7WkRJVUvzYrw+jt8i?=
 =?us-ascii?Q?CGOpQf9cf8/Hss/DPfeb3apP9m/B5CowEMivEI2L//NB+PUV6+6opFmwwJCo?=
 =?us-ascii?Q?hF/+x3NzgjZagB0CLpamc2oOGiTrnFkpr65FkTuFJeV5NPLigrWB2Cx4bCPh?=
 =?us-ascii?Q?aPCYv/UC2u2r+HSVtN/i0EnVfG/MzOWkCDy00kBKJbW+99/kZrYDlPrHsdyC?=
 =?us-ascii?Q?k1n7b6w/Cie98f+Kl/rXH42ghS1X9rSoQ2JcqnBqfgB3lRUMToMqVQbRzlze?=
 =?us-ascii?Q?4XH/mv8+Un80nnehuX1TNA8oQcme9J2xZ/rGDTgOihfkWY/Pqgl98CYs9aCi?=
 =?us-ascii?Q?xzMRY0fDNILAZeJuJHU/rML9rwcI3mrKpCLBNZiWGPEe8/GLSDKbyuJZkpe8?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 009c9b78-f19e-4007-0019-08de0dc7c33e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 21:54:35.9613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLgDXuWclWMD1Ji7NokDry2jt3St17+q7VH61HVHf4gaBaRoYRbrfbhCKukC8FGm1GgK6Ky9tlV4GdrV7hnPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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

On Wed, Oct 15, 2025 at 04:17:07PM +0530, Nitin Gote wrote:
> Add a new VM_BIND flag, DRM_XE_VM_BIND_FLAG_DECOMPRESS, that lets userspace
> express intent for the driver to perform on-device in-place decompression
> for the GPU mapping created by a MAP bind operation.
> 
> This flag is used by subsequent driver changes to trigger scheduling of
> GPU work that resolves compressed VRAM pages into an uncompressed PAT
> VM mapping.
> 
> Behavior and semantics:
> - Valid only for DRM_XE_VM_BIND_OP_MAP. IOCTLs using this flag on other ops
>   are rejected (-EINVAL).
> - The bind's pat_index must select the device "no-compression" PAT entry;
>   otherwise the ioctl is rejected (-EINVAL).
> - Only meaningful for VRAM-backed BOs on devices that support Flat CCS and
>   the required hardware generation (driver will return -EOPNOTSUPP if not).
> - On success the driver schedules a migrate/resolve and installs the
>   returned dma_fence into the BO's kernel reservation
>   (DMA_RESV_USAGE_KERNEL).
> 
> v2: Add kernel doc (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 40ff19f52a8d..07bd63651a7e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1013,6 +1013,13 @@ struct drm_xe_vm_destroy {
>   *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
>   *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>   *    handle MBZ, and the BO offset MBZ.
> + *  - DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
> + *    When set on a MAP bind operation, request the driver schedule an on-device
> + *    in-place decompression (via the migrate/resolve path) for the GPU mapping
> + *    created by this bind. Only valid for DRM_XE_VM_BIND_OP_MAP; usage on
> + *    other ops is rejected. The bind's pat_index must select the device's
> + *    "no-compression" PAT. Only meaningful for VRAM-backed BOs on devices that
> + *    support Flat CCS and the required HW generation XE2+.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Since this uAPI, I believe we should get a UMD ack here too ahead or merging.

Matt

>   *
>   * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>   *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
> @@ -1119,6 +1126,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>  #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
> +#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 6)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> -- 
> 2.25.1
> 
