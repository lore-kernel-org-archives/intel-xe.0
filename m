Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE756CAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 19:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD0510E58A;
	Wed, 17 Sep 2025 19:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XiP9Iu45";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63210E58A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758139096; x=1789675096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=it80qvw7aPKwvbGxF1I91tdivnLMN4432tvjhvPuThw=;
 b=XiP9Iu45RS/pjfZu8Az3QbgX1yqk68wu0BjWaeWNh2XqAcQMf27mo3HD
 V62h/IJbkOxgo1kSreuv/sow8dBwdKpMOUc0JJiKIj0a2zCtNHKzVJPVX
 FFpS3+q7iczjfCEoR0h3r5UGlBr44DfKeDExQGat4Po+kiiR/b++GXQGU
 UgsXhFluHIaa6nRpKfMjUvS4Z/qa3Jy02gsSN+so6XXeK5O87fZMGqkl9
 NWD0TziUFwzfU1cm7EQQGA0e2JGO3ydh0QSLFFog/6P/wmmrrw1AjyCzM
 95zPdRqQJeGQljZuc/531NU3BmY5ShjUNW7Sm0sbF0MNkK91HfOSFBRZB g==;
X-CSE-ConnectionGUID: pbbaxPD0QmaoQ+wFKOFLcA==
X-CSE-MsgGUID: flacXq5UTWC09d1wQ6RVjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71882830"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71882830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:58:15 -0700
X-CSE-ConnectionGUID: 6Y1Hrt36SAemaiqukbKwdg==
X-CSE-MsgGUID: pFi2IslqTRCfeuJVInQ6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="179328114"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:58:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:58:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 12:58:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJpVTgHtSAiNTo766MP2nbVCCJXqmMHQivuBJBFJFaLF6GWb0UUfkZLV3DOz/QByv/9xXsK7KnIxnh4MLbLgCKIojEmOK1HUJd+ZUTlL6asIv+JKB5wkonJIxbZHVQZkb96zQsEUNP49fOVFRkRJcQghZw8vcUBrSHk/Xu2z0Rj+DHcfbwVe7RtjcSLSN0pzZm/lzuMQZgGGVppTNtycDHr+57zy1YIcSt2xlhekwRtOTbvWTiw6h1axkiieFlH6cuNL2zx4MQtkQ/vV2rWuC4fVelSndoiXHG7lcOLDxlxqbb1H4mp2t9rwP9atjKVQdX7JK0F3uH6FuJuLCRLlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX+F1KLHqG8WUHj51Fg6aVY6hxoR0d9KlUHQOmzmjXU=;
 b=s1JxbLssI8hWeOHWM/nvtqxUsp/+VsqwILZGZz2RcxJE932KEOb84QJqLXXz39nX6fCYkPJFmjDSs3MLvaQ5t5CKzo54TzxYG8qdEteKP0u5ELgiQ8uXwJlGxU3s5jfCtfJlQX14ttQLabY/QrJpmXrUmMwBcYO9UkfSDdEF90xSd13MA2NZOJD+1jm9hCST0/EkrGJRlM82OCyopvMT0U1LgAg68hcwy+Qt1wsnH1CcF0X8nhjBWbL8sEhzhpTKehRAySULvJe2CtqjSktT0FEmNZkCeY9PxVLFyofnHa+Fd8zLCLx4UNhVWrHsliwHL8EtOCScdxpCUG5f/S+Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 19:58:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:58:11 +0000
Date: Wed, 17 Sep 2025 15:58:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v1] drm/xe/i2c: Rely on d3cold.capable flag in system PM
 path
Message-ID: <aMsS0BQ0SIjvH6_z@intel.com>
References: <20250917180929.2906157-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250917180929.2906157-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd4277d-0388-4c4a-5697-08ddf62487a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?osyFc0EXhBjsk0FVvkafy904c+Q0HeF6EiIfhm5R9RmoDnsXeORPsqzb0TBX?=
 =?us-ascii?Q?F93DLyAxBkpGZBkNbAIXXgpzCxsaL8JziV7vIJJhN+GijezHF396Hl7+jK/l?=
 =?us-ascii?Q?+AI4brOuqtBLoHzsgV33GSp7bTgiK40dHzhOHviQv/V7Zb2no9sAUG5eapPb?=
 =?us-ascii?Q?J8dQyyCq1oS0v4lGsPGKG9gYsdPbjtnQKv75eV8blCpz/lj9wMiJDnbRPZkc?=
 =?us-ascii?Q?ng9k5o+khXagPLz1zcDT25kEPBHMGGYWD/mHVNFgxB4jqkiAOqm9Z4/5269X?=
 =?us-ascii?Q?26GTNbdHxePpnQb2JVJD/bCYYkOg3QjixiZrFbIEjds3gh6zMny+VuF/fIGS?=
 =?us-ascii?Q?4c+BnohfP/UZoRANoVSPwVV3CrSDrM7VvArezIKmAbSKuIuyrywyoze3FGl1?=
 =?us-ascii?Q?rowtchtaIyAKKGq++urOiETfVJ9Fcb5k5OKYaJWKYdoleJARbW6aO8OMVAl2?=
 =?us-ascii?Q?o7fEj+EvI1ifZFqsr8ipX+zVLxVq8BLE00o70oFCJl2hNGQwnAdXvu6vtdc6?=
 =?us-ascii?Q?KHv+leQsODnNfGJGQ3k2jk2AwfxeREwtj2r1Tun8mh0yW3w9Ao6wNC5I07e3?=
 =?us-ascii?Q?IxWxNUNN4kyaQhXoHZNdYL0NnjxV8DIbDzUZg8Pmwj5IMz2Ta1coD+LSeH0l?=
 =?us-ascii?Q?zPBmMhyngSmDYpcEiAuEOYCJCli8uinXftfrnEE/nsBro21IynCKrEEcPUbV?=
 =?us-ascii?Q?rmZBpDpsdqj35TK4Ksrb/FLCFzZMuEF8G7bDq2JUB7/ij6NTz+af71Mep7+u?=
 =?us-ascii?Q?2Il5abHva1zetnnr3uV21K6F6Yf21J5ucH9HYJa0AlxrZm961ULy0N9PcXtP?=
 =?us-ascii?Q?LCakHsBCynpqyMKz+JtrOtN9AFR+WDM5M/9F3KpNPVgVVv1vRq06nVJDGt0U?=
 =?us-ascii?Q?XwQRcWTXBXeXdbp9F5a/qJZcP/x5k9S0QatMg0tfAuE55W3Gk36Vg3t3zvgH?=
 =?us-ascii?Q?wteLJTJbVN9ByA0LVwrt1CotvTcJRE3q/VSzIyPRiiLY1dJxe7ZprzIlJr62?=
 =?us-ascii?Q?ic0fOrtYwG80iSC2OIFeVfxH1BN5T8QyiR4eSPmxYQFrPBToJKig7blGXWXN?=
 =?us-ascii?Q?+dATiaJTIFmM/oQBWLKoct6uXSEh7JRAJ6OHAHwaYWgurUjDDj7BmDCCCxCC?=
 =?us-ascii?Q?kWwivXruFarsKjs9gF+hIy2/n1yfg6S2QFwLS+PUCxFOVVYkRdiiyByVzRxN?=
 =?us-ascii?Q?BQMYs4KBrUYMmmbYZ5SkK4QDPmL1ZlS026eEcYOdKx8/DG+xpa1mhwm6Oq8K?=
 =?us-ascii?Q?3gtpGz6cos09ipgcJrguyFmmC2A433LimsWnRs7eDKRlM1cxCS4t7MN6BwdM?=
 =?us-ascii?Q?3ram2TND/6MWf3PKc+HHxAX5T29LwRAptLNiVYOTWeIJyA7owuIf/m5WKh+m?=
 =?us-ascii?Q?o6QkTq6Ch54s0V7rsXvV3IVka9q46EJjaiIvU6exaQ8Kg6S5nXAc6k6LJmkT?=
 =?us-ascii?Q?Zj90O6SwOYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ms+8C0Hmw5Hsz03ahOj6n/UuOKyl6Hqc8CuiYbCEpk8DQqyRGGlw99b+AulE?=
 =?us-ascii?Q?mY3mOgb1v7holLfJ0x8T1FMiEFzXSs+4zfle3zKHJlX7S0g5QPAJHS4JVjhR?=
 =?us-ascii?Q?xFiFfpwsRxraBgll+NwiJmhvK3ORWpfP9ysjYkcCzO12WPIAEu1/uFWYPrih?=
 =?us-ascii?Q?GBqsfLF8dn9yzmuGucMAcJhrdn0WEKyfHBPWMDeyCuz/A0yzAA3LiFWfYfar?=
 =?us-ascii?Q?8dHi/Fl74Ky4Dkvh/P3EpcHgSJoH0rTCQgzdR/xkcCZlAYvo7snRn2DGJiSJ?=
 =?us-ascii?Q?OtLhpvl10MUk9AE+T2xz3fLhBln7xj5s5qQAtfrU6mHijdfsI9KnaN75m6Sf?=
 =?us-ascii?Q?kWMzvB6RCNs3Y+tbkWDGtuOKOQjMoTN+ApCyiuWxkvoijv90VRHfyYP9ByTf?=
 =?us-ascii?Q?nto/PvzIJl1sJQjcj7FAqk0AuRLfZmof4PTyPrMlhpUdqWQiZ8IJE2vsjYz4?=
 =?us-ascii?Q?eo/sOq2I+GZK/7um0e3PWdPcToQZaGI3cV6YB42mckUPRNLPKmVX6dzsrX+y?=
 =?us-ascii?Q?0tyvugDxdUsThwSRF0g/P6mSeJppTnJFUDZAbO/Rw1TxLXJAZo38f9MRbI3R?=
 =?us-ascii?Q?YZjRjCXnHqakCNMRd6Fa663BLf7Rxud/Ou1FRkH0GFUvmDrPqwueF5xapeJX?=
 =?us-ascii?Q?pSA/9154W4mUH27h7xrKh5X4Hs8o4n916Y3evggGwWN0X52Xj4aRr/euMWxE?=
 =?us-ascii?Q?wZp6nMKUi7IuXaAxIIIWYfJ5QRwS/JIRrCeTNQ3+YTlT+zx24ral2nfiD8bY?=
 =?us-ascii?Q?Yz345DI1cYr611uwVtFss9U/roc4n0uj8A4d4SSOBFAXlE0fe8mZ5+JLb7ss?=
 =?us-ascii?Q?7C6pq6u837YmlB6QixN+L/jJlBo5FrHBSxjQGMga15e0CqCF56pUTe6Tcqn5?=
 =?us-ascii?Q?5Ndl2Zbe6g0pKU3nx9jqsnMIj3Fib47WB3uf1XKZU0eY/M7OP96NFx5Ik5Hp?=
 =?us-ascii?Q?ikusZ0UVPUcs8LYpoiHSaU7I5I26naOnwH3+bzXcg0yAxYvnVfYuXcWAAhF4?=
 =?us-ascii?Q?tai/9XX6lKlJNoH0HSytO/x1ZxqKEP7CoM2iJ2FJYPRBAq8jYfSeOM4FwUvB?=
 =?us-ascii?Q?jrrpKE5HrukzOnYeZ3tbHa1VDkxmRk/mQzVW2+9pCKsI/cX52x5EJLakXaCG?=
 =?us-ascii?Q?MaxTORuX5IRjr2nOFt0I3CfHQOdjsnGacfe0F1xh6MEj7sY+AxMPK+rwOmLO?=
 =?us-ascii?Q?6LSLvbTarAvpsVMPNrHr03sAqGc8idJ/tEbJ23Ls4BE/U4hkgZY7z7IcRpf4?=
 =?us-ascii?Q?I/7/UdwMxFbL++jL132N/x5lc2hFxNLx1pIycrHA1h6eiIozDsDGl1TRvPkX?=
 =?us-ascii?Q?hfgwafwfPWmvuBuz02KAauXifBO83iXX37hiJC2CEh8xQlrgArcTLXBr/SSX?=
 =?us-ascii?Q?HnQZwSmjaA+iI0gSlUrXzF3fDNZSaFvxz3dz95jKz5GoQm5NlYUS6qzOrSsr?=
 =?us-ascii?Q?YjkpX3ko4muz4MgTNVMh/3Qi2+f1qHSHykDI3A36HFHRESPHJzzMOlbBonEN?=
 =?us-ascii?Q?pmUIxqeHfzG9VKUvvmb9zNwIVlSX5Be+H2iLR9TWsCcJBFAJvSMcNiHfeio1?=
 =?us-ascii?Q?eeL6SLT7Obin2AWuiaJHkaD8rku7zxfTjo1fHf2uLrFKux/X7iBlxLcijUp2?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd4277d-0388-4c4a-5697-08ddf62487a2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:58:11.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +koLmywG9LvFtLLz/XGwVb1DAazVZMbrJEzF6wS6uXXYcUgarJhSHwpvyfb8cU9afHomE7rgaISnM7fY2N/RCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7821
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

On Wed, Sep 17, 2025 at 11:39:29PM +0530, Raag Jadav wrote:
> We don't consider allowed flag for D3cold transition in system PM path.
> Rely on capable flag instead, which reflects root port capability.
> 
> Fixes: 0ea07b69517a ("drm/xe/pm: Wire up suspend/resume for I2C controller")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 17c7dd024343..0014b5f4ad07 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -198,7 +198,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (err)
>  		goto err;
>  
> -	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> +	xe_i2c_pm_resume(xe, xe->d3cold.capable);

something off here...

When do we need:

xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);

?

if we need everytime we lose power, you should simply do

xe_i2c_pm_resume(xe, true);

in here, since on s3 we will lose power, regardless the d3cold capable.


>  
>  	xe_irq_resume(xe);
>  
> -- 
> 2.34.1
> 
