Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64996C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 14:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7F10E1DF;
	Mon,  4 Dec 2023 14:16:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7054F10E1DF
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701699384; x=1733235384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lfea2yN2AXR5yBViUQ3apt+T/fZxalxlrUgAph91nCc=;
 b=ey0mzDAupM+DWED8Xnddg8WwHHnaMHkXj1eXUH5HIgf6GfiuBxPqEw97
 IShkCrN4qxQ+yOTRNClqJYdBurai7fK4xWbCJSaKPnAc+k6vDS2yQ/7u+
 Kg3eQo3KsUXHzqRTtntXS0D5vOru+BhPob46mEd20NrJNKt+47MqhN7P/
 3GQE0TW7YrByIvphZbxKiPSE2PBFoUC1LRp1Mw/TiNYryyVVu1o32oFa2
 hfCwojN6FIxgNhNq7AejLlVL6vgulp2prWFCdx1acFz8k7f7561nM/Paj
 5aOS8lCJ7tWZeHuBP+QOQ8z7XQGMznnz7QQqGyTzHasJy20Y/mQ+slRFk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="393471253"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="393471253"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 06:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836595490"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="836595490"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 06:16:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 06:16:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 06:16:11 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 06:16:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXYVr+qAgMbXrf6R6gZDk5ohCZ5Cr9EVqNd1rCqx81G7rXNoMWxlHspN75fLfW3pSYL4BQ3d0ZUCapcVOZccXnU4Hq+uLJOuYjm+9UjH/cOeoKgL1kLywbnWRsu30imndZQwK2sMF6ivoeRhR0C/ybB6ZDApIe44f8N//F/tmmY8GzYTa7zP5Yc/FjQlLAG1OgOneLpVaPzNjpZa0NlDm0zPZhERX/JCDsg2hnu7XJUTFyb6w7mWu+wjIM8vFynzcOG7vOH1eSW1S5KhL0aBZDvBI36OhJ4onFNgkz3zb+/6Y+sFehYaBPRvlHa29kftKMceYbW0M7vqaTtaX6/k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwrsdpBvu3eh5SAMwonySl1iCGfIhNCnV+vgwjwiM98=;
 b=HSzpqUQ/wZt5EFsXsFInJivW0FbvL2cwu5KZV2fnhEkknAMMgfjYZ5wqdl0CDHTucV5rsPO7Di6pNiiFu5ey1j4e/NCSXVo5coBMvKtXdcaud/W76e72lLFPSx+OW3PsdG0U/j9GFBUeBbRoo3n0LLaTB1HPBGkSCoMVCQxKAn7+coiQsZ+UZpgf2sWLkwaK/e4QEclzFErSHmagQ8cm/gwEYZUUWYm5ygZwVxAGzSjmcOQwbiOyb9+aD4NGQfhvah2d6fVn+KjrAliZo4wvPo8xi6S7m+Dm1ebu7u7wVLj9mxPhKE5iECTVmBP1MMwsKyjipanwqKDS5rpfLYbAHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 14:16:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 14:16:09 +0000
Date: Mon, 4 Dec 2023 09:16:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZW3fJehxYWB61ml1@intel.com>
References: <20231204105126.34751-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231204105126.34751-2-matthew.auld@intel.com>
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: e791b157-b59b-4fdf-ff8e-08dbf4d38f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jj9uAnFla8HEcrCpWXAHkV0w8rjRnc0LcjC1D+fuZxEPWkSzwd4K1avl7XcoWkN0JcXCIuhcLw6676PQ0EyjjSE9dAja6oWOlisc4XDPhIoV6OfWYNkTB5vUPbagZL+VMESY0ludV4/L1mSNfU33dWFrJtamSezSddCNXoN/yvRHf+uHJVx63uBuh4/d7JPyP6bJrxJE2ccPJkMWA9TGdF6XUWGnzQJdIS6rvHOn5MYQ9cpb1lCgbWxmdm0H4SjyWdW4r+j7md1GRPo8XhKcXMJjynsvAlmKPNqEiV3WB/kwz+vAMnCzw7yV7anYAn6nB/WzB3IM3UPfHQmN0y4P1eLplz+V1iNP+Y9h0F1gQ7EB2QYDs+ttlUgVSMyTKeKLoQ59unA3ZCTbrbKZ5QBpxXfSH6qFEsze/37NUQ2ONCIL5zJL2QKAVly7Z47Oq31q0c79ugI3FboTEtxiZvF4Uf0YSJpIKHr/BqhORKVD1xeQQAOQeb+3x9Cs09trYrclfDKQNvkNFA3uqu1dH8QloZ0eJWk1FNDZK44gD5pKUFrD2NUJ4hiJQna/6WoEYkKc8OphZGip1nHMR0MVmcxy8X3tE2hANOtiroboO2o9Gv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2616005)(6862004)(4326008)(8676002)(8936002)(6512007)(6506007)(83380400001)(82960400001)(26005)(6486002)(478600001)(6666004)(66476007)(66946007)(66556008)(316002)(6636002)(37006003)(2906002)(36756003)(41300700001)(38100700002)(44832011)(86362001)(5660300002)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QySqkdI+JphwZ+nehXJRkMRIVz8+c8/C1U7ljD8BTvnOLGViL1A+mGR9koVR?=
 =?us-ascii?Q?JREGp8XfZ5lgkOoOZwgYUEt5rsxHeTXskaWEXlCONqSDodrYRqqnBdBLiW5R?=
 =?us-ascii?Q?xu+5A8I79V6EvzZvCFhleFVrPsJawY42DLqtd3L8kUuAM7CoHLUHyIVXQVKe?=
 =?us-ascii?Q?qrKjc4BUPFiBALNBDPwjzA/sywq9WVyHIxXLk99ipSeRUV0eBfjCNzuKF7Wh?=
 =?us-ascii?Q?TR6OjIAvBcJDIOWbnC3aOw7H+nKo/3AnzJ8ZnacnyezOjJAYPn1f60Ny6KmJ?=
 =?us-ascii?Q?Tf7wAVOxRkSr3wqh/y1egYChCObLpIah0byXKjrcMm6LEOij+bKW9Qeo0OQ/?=
 =?us-ascii?Q?V+BX88Il0G5x/9tFGAjIa1DetLoYP4stR2SJINdA0J9WeWDjA+edorPJPfff?=
 =?us-ascii?Q?fHgn2zf9e3Yz6VzJ3GTv3DYuJS1BeJ8DxXOBd/DBRttPXhtOjDwSlRVQi7yG?=
 =?us-ascii?Q?pzOKDUBX3ws8SfBocR8JLLABMgWF9kX9KSfiRgf07XKNkPUUyf4KQPEs3puO?=
 =?us-ascii?Q?Trl/eQm5qnO4y5FLGQNugzQ2oCsY2wpwm+MTBROM5G0op85+ZRfKW2oR7tN3?=
 =?us-ascii?Q?K2Y7Ex5Fgc3svTl6jsdeu+8AZmTba4IiG1CqiQgKwwTjhQyjrdZlVVXjDc54?=
 =?us-ascii?Q?iSPNLLmbwRm1+uQh4+C3fa1mlDNmCiwNBP/mw4LGpVumxvsqmN9Lt4VJnt5d?=
 =?us-ascii?Q?fwL2lhiuV1LxgRzh9xoMkInoUUiL9AFAwGki6bRop+0f1AK9brpG0rnV1/BO?=
 =?us-ascii?Q?Gyul6vIyRdiN61gjt2LWKCN22PilNBIOXkGQzhtErq0j/aw8Y46zgl7e2acM?=
 =?us-ascii?Q?+vvrWgyvgmREUCCrMJ4qpp/LafHzAr4s/q3emV8CHdWW8Fm/mcUQLLLug441?=
 =?us-ascii?Q?ApuPMjloRCruHpOmxQSyyhenBKLeUB2HJD485GaY1e17cpReGedZMLPpocpE?=
 =?us-ascii?Q?T+rcUpHsTK86nYhDyIh6vmcN8Vwcp6530wQY1qNaKr1mUdxxA0e91If716HM?=
 =?us-ascii?Q?RlgeZ+/JtJAZMQQ+JaEuFMDIp5KFmNb5DF6duzauSLyeuoaUSM+hYmsa4lC/?=
 =?us-ascii?Q?GqH3QF1FUT8G+5R3rQfrDoqt7NY2O150NioYoTDy8m0LhP5euigaEoDlwbkq?=
 =?us-ascii?Q?PEosmIGIgm3aQEzb9z0a22+HKW4oEHWfGdu9IN5tNEzVFlJcuoqLt8Ne4c0L?=
 =?us-ascii?Q?OyPrqtnaSmHC7+wGIEuIGw7aT04VkNY6nK1W12dB8Ui5WEB4rJ2/kXfWUa0u?=
 =?us-ascii?Q?xp5kROF1sLeC/O5vFs9AfBUhljnA6dKISdIR7+o90BGHagVoHbGC+6We+h6H?=
 =?us-ascii?Q?Rxy+6Yth6/BgZ9yYljRL9w1hDHGX2OM3XAYIWYivzMoUslZtfcoj4lB7Yt9f?=
 =?us-ascii?Q?17ZcK+NlvokA+4pjInjVyVX8yVNaVKmSTN+836sSbjCRszYUC4dYBIvN9WKU?=
 =?us-ascii?Q?/aDEQEF6y7wOCgnhkP4DFG5C4DDdXHmEMlmVviVGfT+nBigizrBXLUbzwFxo?=
 =?us-ascii?Q?lFnmvT0dZgxBtgpde7caAVLQ5Bxg6EzNdUHq1olIG2+w9lCrmoUg1+rw+OWw?=
 =?us-ascii?Q?9GEM1l9Kk6uR3oIYGkWoWch462D6j41/5CFUokcs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e791b157-b59b-4fdf-ff8e-08dbf4d38f8a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 14:16:09.0052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/TMkIB9gDb3JL8FNA7ahN72cYWzqjHO/i4eYU9POkBf3XvW8c0ss1B61eDOouvdfvAqIRH14bN1a8RNFuco8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add some debug info for d3cold
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

On Mon, Dec 04, 2023 at 10:51:27AM +0000, Matthew Auld wrote:
> From the CI logs we want to easily know if the machine is capable and
> allowed to enter d3cold, and can therefore potentially trigger the
> d3cold RPM suspend and resume path.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 3 +++
>  drivers/gpu/drm/xe/xe_pm.c  | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6977f48b03c8..501b4489f9d4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -751,6 +751,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	xe_pm_init(xe);
>  
> +	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> +		str_yes_no(xe->d3cold.capable));
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index e31a91cf311c..b429c2876a76 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -399,4 +399,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>  		xe->d3cold.allowed = false;
>  
>  	mutex_unlock(&xe->d3cold.lock);
> +
> +	drm_dbg(&xe->drm,
> +		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
>  }
> -- 
> 2.43.0
> 
