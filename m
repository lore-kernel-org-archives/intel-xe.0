Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED3FC3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 17:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E4A10E0E0;
	Thu, 27 Mar 2025 17:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dl4XYG90";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B97C10E0E0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743095705; x=1774631705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XMP/E+1hqOEw4BRVYtbvsN5S8O14QD9YwRCAQDdYzSs=;
 b=dl4XYG90pbFW7ispCp24LyN7IqP3vpuCKT87Uc7CXM2CrB3kD58O6Plp
 WKDtbmPGRRpFIWfirZn4BfFN2OE/dippGO4eYrZeu2BZqMezCL6dwKW1A
 oDeFA4cI1B6a/Y/itcKTzd/StE+THYn2CBGJeteLXREVi2md3C/O2fbDv
 QWi/ES2TVqFSqSKY0K+efz0POqGEsy5lVlfbzDlsNHWmsnO8y89kjT6mP
 IETAUT6cAbu2xnkX5iZpIX2xuwO9iEoIIsUw0XRM/IgKyV4mSH3EegRPP
 GLDhu6a034WDDUhQKY3J8SQqDb2px1NC2/0khXI7K6QnvZGq1R4vVLSwp g==;
X-CSE-ConnectionGUID: cHHWekbkRX2k83CfU3Lxug==
X-CSE-MsgGUID: tbtNfVosTayXRRv34NgXtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43598552"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="43598552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:14:51 -0700
X-CSE-ConnectionGUID: QwImv8C8TQqGauecq3vb8A==
X-CSE-MsgGUID: +wYQ1+OYQdOtJFC72lI/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="162439175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 10:14:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 10:14:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 10:14:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 10:14:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUNlaZG3K2u5sbajMxKK5QEZ1UC810HwLY1vrDw3etxL8AFg1kQGUt5vsGh1vRN03f4/f3F4uyMx1s6qni019ZJnj+Hx/n7h7oyAfqJjlVQVxEQJZGosCSC5ioZjTqGxjrG+8l4b32M1l+Q5xa5/FKYYEioIl+K6NHKPgrzofa8i6oK+yyEsdvKlo9PnfjYwUTVAhPvQi4QWGs7bweWtZKChpRUwoCr6Q/byHkxczCYvZ86Vp8kKzVi+neCwAJQniemHBKVkZ4O9wyfE8R0Mo+UWQl8mrE/71/3hhwFUSpCK8voX3KPYzDCkiGvB0Kk4aQTr8s3gmWtgt6u8A3Wc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BN+Q5+MZUTomwPugzsysLb4VYNBNWGbXzWqMMPb2gY=;
 b=r97l+khUEIhWoUlGzrJl6v+1IU3O2DMih7g8z1amrtg5g1dniaDtut/nb5zEjgw0NPNlMXX0XdK2HPUB6kwvG39PJXSeABDtv/tqccADncyZ9Ek+/rMQg5ksI+zs16feSIApH3knrt62PSCmDbLfjlqxY7Pf5t6FqFnXbFikNAB3LgFwS0h25cxCdPiBv7w9qYXS4W7sZOnOG7tWuicM+ukear6WH9s5O6ZD1RDpBI3BtIXwLbxlTAKtl2zfEprkV7+lTXd6jlDAIw6zEe5f27CyJBHOpRbh52wF1C/rdJEPN2ULTVK7gyhMxkp3ayWcJffvQUxvvNAT5WG+JRo50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 17:14:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 17:14:13 +0000
Date: Thu, 27 Mar 2025 13:14:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rafael.j.wysocki@intel.com>, <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Message-ID: <Z-WHYbhu1QdjUFPR@intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6d1050-42b8-4cd2-8013-08dd6d52cbca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ozO5da+x/D/Qq7xCHPd2ixu4n86F2ANjM9xbpEZtGbUJPHsQj2ZjJBdguq9E?=
 =?us-ascii?Q?BTRUnISUD36+HaPtn/3Ao9PdmWq86B/l7+WOiysCzxq7nOc+pOchhh/jbok8?=
 =?us-ascii?Q?koqky/+qcl0fBvRTg7AdhhRmHRFVACOftCaztPNqAZD6Hy1N+tc2tNyUHEMm?=
 =?us-ascii?Q?3pP8Vf9/X5FhH+xUgyOUUVXUQWjxk4mLNH1jQ84Ix+/QntQoL3j0eBaqUaLT?=
 =?us-ascii?Q?ZiAIenwL2pahJh2QrbCuouHbGdkjqPBDB7aZrrYjPXbDspLIz5blgoS8lyQ1?=
 =?us-ascii?Q?jyAPrKfsjo6T0dqYY77WiYpe3gxQTE7xX9Z6qEgV4SFrtFBqyLXuk5CCm6gy?=
 =?us-ascii?Q?CvnmmTIe6fyYqqmcQhNyJIKhi5QCWQRSOC+Ho3AyI4qX1msQLOp94u/xc8wy?=
 =?us-ascii?Q?b2lDxBGQlBp3FuoripW6SL14bpxKH7zRKS81+kw2xTcgmakkTSVWEedh1IUj?=
 =?us-ascii?Q?0ibUqv/fuc0YUtLHhWP38+0MM5C2r4dbO0MH/OSiR2srkAdXHKBEYsv6+aAF?=
 =?us-ascii?Q?iv+gR6g2sooiU2KcAKZBXQIqHDozYTEQ8Vw/77yA8LBfNOS0mSVlE/74zMDV?=
 =?us-ascii?Q?gALD+46tTv53cX0zK41pjfacYYVTP5kV8Bh3PJlPNeQddV9b4z8lzb3C2VZm?=
 =?us-ascii?Q?CAJVrB9V60JgunMH7GurfUeP7t2lyZ/lSU1Rm/Hfwx9RXwVtWGUbn4YSAlpC?=
 =?us-ascii?Q?CmVO0scfmLZWU21Qhg7Z0fuktEiC3MkDgmGIYOkA49wTseeKQcObU431FMiA?=
 =?us-ascii?Q?RonGQhUHzgxJIaWwzjVIPcq/05yT8+mWti1iq9kchLtRqT3svyxd0anM3qCy?=
 =?us-ascii?Q?kEzu/AAjJYFx6pUKaH2ivh8HSV2/KX+o2NbLKlN+hCEs/ywTTfGAQKlDqt1j?=
 =?us-ascii?Q?Y6PN2dFX/jOlFlB45fSGYI0buaTIIOm3pXlrbg3zWkYgfA3splwnlNN+NgQ9?=
 =?us-ascii?Q?nFJdhEH1VwJ7NRZoraxBOBKXKvkJR9CiMtS6aDSZrEqJ7FDJAcGbqBkONGwj?=
 =?us-ascii?Q?Dhcj+ScQezI9WxRZ272vWXZ4tz1dKekz1r1xbiESKdajGRTqdKH6W/41A8zp?=
 =?us-ascii?Q?niDNw+oy7KVc1wrvbT1YJu/nc32feUXnwxOaQVsUKYzCY7uy9855ag6W9FDR?=
 =?us-ascii?Q?nNqp5N/go5Q1/3wLnm4JDuXmWzSTxuql/OVDlPcBWvHBbqH9J+dcUROeNw6P?=
 =?us-ascii?Q?pm6ClONJmZMPdBK+GQSw+HgLWZarH7uXQfBt41KvVguW1bMU3Q49K7Wr2Rni?=
 =?us-ascii?Q?K2gxwdQxK/T54p/EgubB8S6meWBCQjMZDJQaKRsEH7b0zCKqkpmC+OYn6AoJ?=
 =?us-ascii?Q?3nDV17hZK0qcAWE+8oX7vPFpuYJjtQIF/fvZLyiCBqYivaRcvtUdpLIu0Jik?=
 =?us-ascii?Q?yftYzBkhT0jlBM1TE6jESm2kmKdg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XOrO8XW2VzLY56l+mAWeFXRrstRmkRjyyGUdYvc4tKkrC0kYAqn97a2jY1P3?=
 =?us-ascii?Q?m6JjSGLiAgpjp2yD68YeLElNAq8QXQpXbocvZWA1fFInrc+7NENOc6hzRTZp?=
 =?us-ascii?Q?OBo3gH/ljCIeB2ab3ZrB5l8JQcWp3BFiqVSq/iTnQkFWXO+QNoMHBxfpdhOD?=
 =?us-ascii?Q?jpkCj1tCS00rSajz7QsLnXx++JKReEdNnBMMR5ropizoXWuHrDKngEl8Epk9?=
 =?us-ascii?Q?Mu/f87HIESRFijmUyaIQx9r1ExeT6FNvxBJwNi2CpY2QgjF60DxD6ox5VPRK?=
 =?us-ascii?Q?yeO0xdtX/6M2cl67yPqi6nI1E+/cBxoqEeqmE90N3gJZERxCSFhDdAaLs3op?=
 =?us-ascii?Q?8OWlJzFrUDeN0llX7IOq1oHKW1ik0epaGpU/x1oyWZWm84ZIvEF/dQUgaiSA?=
 =?us-ascii?Q?hLcPJCjIQ2m0ZPwTPwOE6KIp7KfiusyUDv3M0a5HFvDl7Ihhstk4eAOAEsaB?=
 =?us-ascii?Q?UYf18Xw+JpaGkTyZgUISD4P+QAT6qjjGMPdhr8O0taysrb9u0XEMnw5dCENI?=
 =?us-ascii?Q?6IMy5tDBUm5pgVGo1QAZ+Hx2xLutRNnAdHkafwRky1sFTf/vlL4cqN4tT6ha?=
 =?us-ascii?Q?LC5QzhSNGCf1PpOxcKQzt1F8WdyyDMsyfkxt+7zWG4JzSjY3WQGBS6DvrEA7?=
 =?us-ascii?Q?JKMekXauJWTbxDfKA0BSTCuw5A+oyenGSKFMhTvRSn/hHZbjnmd8H0tTm4DW?=
 =?us-ascii?Q?kfYjwtb3QNjaNSCpQ54rMGOhJNO9r4hl5KbBbiMvVaFaqDP2kK5K3S7PjYmi?=
 =?us-ascii?Q?hIsmxkWpipqMtiT5O5SfN/wfQtRttn0Fb8n6bAqtMNTKGoUuNSeHj81Op5AL?=
 =?us-ascii?Q?0HGOGR6vRM1p1f0R9LfM8vuI9e5hJAuS+SWlG5LuxrhWE74HTxAqMYMlThtY?=
 =?us-ascii?Q?hyNM//XC4b4c8hEwZ8rgJGZY/XbsnIDKOdnLuSmT2xkESW65XxWG7GGXjayX?=
 =?us-ascii?Q?mlmrwOHrdeu5/z1TX4bM+vAcVr/Bf5jTG08cM1AZT42LZoaTIQQO7TBR0rRY?=
 =?us-ascii?Q?6+Iay0aOfrYxLHITDUEG/LDNGkj4yM8RoMrOAFU5RLwDoBMZkKXk2OPTZM0h?=
 =?us-ascii?Q?NscuAh1hnmMxeer81crDnOVXs4jcJ77HCjwM7c8ihkE80jBk2/gwMu2A6k3b?=
 =?us-ascii?Q?+2zxqYDewaM5xowtFFdCcT+69huhnZul9LD7YdXxYM3GHXJxRjvA2ZurXe3T?=
 =?us-ascii?Q?yhBy3HBCpmg+Nz+mOw6tgj2YixbbXeS1a2c03jkZO0J3LBL+/NjNarD2+ucq?=
 =?us-ascii?Q?UR+w6xXIgwG1nuDJ1Z5YUY/q5zvW3PsWxqjeaRFGBcexwGu2byQEMfpnc+Gj?=
 =?us-ascii?Q?FnW+JWzgQttl9jaT1qY4hsJxqdfIrJaXM/8DOQfHUhlezkqwTu95BL13NflQ?=
 =?us-ascii?Q?Y75ve/aZIzyI13isDwTsIXzrYu6I6UmDTXvRU2PKUahdA7GItq08t+GwAkgQ?=
 =?us-ascii?Q?sbdhdW+iHzu/6tjsKW2HAEw+brmaER80U6uhCMQ/imP40FfVuccbo0W/iFu4?=
 =?us-ascii?Q?ymVblIHEo1XGwx5GNce2pafg7GbvqDHB75fVPUfpCONIs37Efi/wMXfSA6SQ?=
 =?us-ascii?Q?UDKu4H2TnF78eFs5cE2/FUjUKi85yE7RYr/Sl3sJzNJiWPGo/oABvnem/WCo?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6d1050-42b8-4cd2-8013-08dd6d52cbca
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 17:14:13.2567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsP5CGV68CawjhzG5V05Qd6zwesZ5vKGgyUPUDMgaEg7bs2wLCY3XSa7mX+vOpTrzMNkKzV+IY4epAG9gn4Lwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
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

On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
> 
> On 27-03-2025 21:49, Badal Nilawar wrote:
> Hi Rodrigo,
> 
> > According to pci core guidelines, pci_save_config is recommended when the
> > driver explicitly needs to set the pci power state. As of now xe kmd is
> > only doing pci_save_config while entering to s2idle/s3 state, which makes
> > pci core think that device driver has already applied required pci power
> > state. This leads to GPU remain in D0 state. To fix the issue setting
> > the pci power state to D3Cold.
> > 
> > Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pci.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 7046e7e9a6c7..3317d475be79 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
> >   	pci_save_state(pdev);
> >   	pci_disable_device(pdev);
> > +	pci_set_power_state(pdev, PCI_D3cold);
> 
> Another approach to avoid calling pci_save_state and pci_set_power_state,
> allowing the PCI core to manage this.
> Currently, the above change aligns with the Xe RPM suspend flow.

Either way is fine it seems. Or we don't save the state and let pci subsystem
handle that for us or we save and set explicitly. So, let's move quickly
with this option here that is already fixing our current issue.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Regards,
> Badal
> 
> >   	return 0;
> >   }
