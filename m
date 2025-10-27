Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B36ACCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 19:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AB010E558;
	Mon, 27 Oct 2025 19:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2mEosYn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE6710E558
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761592742; x=1793128742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cwWg3mf2+UzvbANoM4/HSIPQsKDvJhilMK2Kzr8CNwE=;
 b=H2mEosYnp6t8UCuSnzIz7zzAiIN4wxowbn5IuUF0/8WG0RKtXuS+oIzr
 sY+GY/scnN8xHpA5anwjgW+momgBs+pNA07HqqIrZL0xWJmlD0sEhmvDz
 Pitlnzk088pVncfmDiY0zM/gwnHts1xJEcjw8Q9Hdl99+yAKOQpQMiuAf
 J5O7R7/QDbo+eht0+3d+XLTcf+ZmaOYOHyiJc7CVvn2zRFV4n80tbe/JD
 kzIK8hBPexLXcFdb7eiH3ZAq0TSwJUEAkZy1sG2aK4QfvNT8E7+3629UT
 C97FQcnLnj49G9lEAztbB7eMeLEnfvkC39FVaJk4iigPkMRL5TiMwEpl+ A==;
X-CSE-ConnectionGUID: CZPCI4IQQfGG8y7h7XbSlA==
X-CSE-MsgGUID: zuVUPObTQnGsMccQAtBiww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73970444"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="73970444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:19:02 -0700
X-CSE-ConnectionGUID: AaLJ8SOhQcGsXi7CoczepQ==
X-CSE-MsgGUID: d0g/+aQYQumkDf+SsHXWiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="215792055"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:19:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:18:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 12:18:59 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:18:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzoG6K1e9KF2Xx3O0bHowb5WKlFWMjCbClD/bFFGz9P2RMkt9WR4NCPw+vx9TM93kX15UlKJpPu2C1Zz/pN5oZy3rb2XP5KavPIAbZj/V4HEn/FMs0LfwG+PSu/P27fCS/slWJKC/J0WK8Ohhx52OQeiDJHjmjtBYIrtcjy/CVoB9IYRV5BEuafUCI0fxV9GiMzzAIgBdsP9rTzSSslcK/nTErwTNAOCyzx1b9rudOzC9aHqt3oueY+h1WrKntpZUTOcs/tFCcAPNsmSBW9BSBQ5+oura9XdCuNfH4A1PhKIbcPyN4doRA5Eh1ieLXMLBr5EmJ4WpOmZ3UPr/CFAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6FpoHT1w9SuSgc0G5+kd7kXF7g+9i430zpUneSFffI=;
 b=gc5Epa9rnv/XLj+0ksngNVLcgNr3inViBNWNG/0cn5HH5jnrt5xc3njL/va4lBqHhr1PDgSKiJ1tjijKi+xRehx7nKhUrGMERkgAG12anjZvDOrUDVLgbrtqWVdM9D9ZIl97P5u5Dbesv+rZTWfgBsfE2A9Jc+h+i8eUvnNBPUA1cg8BSUiDncIvXac9wi8TbwSU7Yctx5iKGdG1M12+93b2vsyLn6E97loy6dU2hXBdgg23RlXWkfFGx+6AseZULDMcLYASD94RZbcon5QOaEkrXQpYxg5H9powO6yLupm7mEOFAP2O2Zl20CdEEDhQWxujfwFe9SqVjf21GF0KlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8990.namprd11.prod.outlook.com (2603:10b6:208:56b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:18:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:18:56 +0000
Date: Mon, 27 Oct 2025 12:18:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v7 3/4] drm/xe/pm: Assert on runtime suspend if VFs are
 enabled
Message-ID: <aP/FnjCgKj8e/hix@lstrano-desk.jf.intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
 <20251027123057.3738059-4-raag.jadav@intel.com>
 <aP/FTqwD8y4wT+6v@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aP/FTqwD8y4wT+6v@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: b448baee-60b3-4725-2786-08de158dacc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oawKZAuGhEvROeuQpnRLSG+zPLX9S8ECAJIx8MXM2iAD1q/VLuyXrcmHPh1q?=
 =?us-ascii?Q?qdUMM69IUVawGbkbrVgkvm8YrJwXB/4j+4rmCUH6zofejgsE+RCon8JZd9fs?=
 =?us-ascii?Q?HLfvD+j80C1SjtOm1YmYJ7oC/K/2iI07iYtrLF19290KFKi1IfUIW+0uT6f5?=
 =?us-ascii?Q?8sQZE4pp0+yGZTH7UggU1c6SqfW29y6Ks/rGunKPa1Kr7XbPhE5XOMNcUoz9?=
 =?us-ascii?Q?qSA+ofvHtGinYPixMX0BtAH6fxaDOjhkr+L9kdob+4Wul+JpBOdTdTMP8aPb?=
 =?us-ascii?Q?AD7n4tv498gkF8MuwbxaJA+HS+vMoWeB44BXdiTo6+aZlqTOPxQHAwusdBrT?=
 =?us-ascii?Q?6n6lyVib5lDktAa4mMRuXEN+4fd+Ajb2V30CX3LruLgsebjFLgIeq+Z59tOE?=
 =?us-ascii?Q?pKxs69dYnqDe+CKlekX4fCBsUbGINdNcfhyfx78wso59ZXXhyCJgoObgheh7?=
 =?us-ascii?Q?j9NQRq2sBqLwy7V0HhBZAgMkn276X8GyTGF+kRyb703Ns6+8ACNsQkWLF1Wz?=
 =?us-ascii?Q?UYbKbhlhOCc0hJSlMmEFJHFg6Ylp1dpaumbUfYhVaiXbkE8SsBfbZklp3Mwf?=
 =?us-ascii?Q?ksQ2utSQ/ZYxsz1YKT+pfIwNryhKflx0Xx82/AOSsRJSmyPPxabhssRPi7A5?=
 =?us-ascii?Q?ZHwdWFQ1MB6hUlEDvDOw7Hfzk7jsDV430+cTTc/G/KxnuchZXEN7Ycsfgzha?=
 =?us-ascii?Q?x5O2EE1OukK45+9nAP9KmqvxdzPfeeM6ZGD7jNH5YmtBGzqf2HarVvPImUIA?=
 =?us-ascii?Q?5SWkopCNTnZJylXdlWoymPzCEzbMd4Vg1Q6o50uqQHaxMhZsMmiVOxvtWp1w?=
 =?us-ascii?Q?7kcNrVR9spELjYe/xb+16oxcxMfX1gSfKlSnlgqdHoaMIZftPVToPKBfHTku?=
 =?us-ascii?Q?y0vKEc5tgiKqWKgvbN3if+LchoTqF6VwHrkckCbhtstLyajXUPS/GSvL4f3O?=
 =?us-ascii?Q?0DHXDTC4CcxrFW1EeeF/zhObKqSvEkESZIvssNDBEyf3p/Shs++ELU8YYsuF?=
 =?us-ascii?Q?+Xkf0UaYNeEme5lnJrsiKQ65Re01396Wc1dZRfqhKKewmnOYxmi1y7+pKWZq?=
 =?us-ascii?Q?wkcfEs+j1KZ5zzmIUSP7mxqyIpy6BIjiPyA2IXAAmqvcZWW/O4tjUrczAJUs?=
 =?us-ascii?Q?O01eAY34QNxBXZP3sZDPJ+luVJHmklShE/K5VYWGDwGcdxPmbpm3b1nFNdPU?=
 =?us-ascii?Q?gS1JRyJqRX189sYuGeOs+rjZO6Nw9atp+KFCSCK9ZMl7oLXzrKGETI3eI5Th?=
 =?us-ascii?Q?JIfUW7sgSps8hxYLWIf81a5ok6iffK2pnBCeOpTojQRBaOjTWGsb7VT9pQLc?=
 =?us-ascii?Q?vkaGVrndlodnTlVCtvJcYewBe152F6hKowsjoQFt5BkHVlZoX6qjl4KlR2CN?=
 =?us-ascii?Q?k7/fN+9lkhSNAU4NtDDjqUU+cK8rDt8/vby56NCiTSmQrhwNrODe7cXB0GWS?=
 =?us-ascii?Q?qy9bKposchaix6y7ytAFtYWqudCwEKsE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5520IxJbCK4xtDNVcF++KvShOL67yFZWCuZWeI7gtHpOMq2A0iaFKT3Lee0I?=
 =?us-ascii?Q?TMfKGvXLiMHWWXQwVJ5oR38OfFkPpZ6OYPyIh6m6AArWOjUsV78U/SfWW2MS?=
 =?us-ascii?Q?1VRlWUg0naisQJ7+cW843pMcBPrKP54pEgxGEzI2e5HrS9/hdUnuGQHCIQIP?=
 =?us-ascii?Q?Vn9gQKrHJ9e+sNKRrxmAaUv/qJH9rb76N6j8hQjIlWmTb5wsr+uakFW3LTiZ?=
 =?us-ascii?Q?5DwtnR3QJmVVgzqq3YfQ+GeKKJJE2XQY+PZqySltV0uGjET9yS7qJISrxR74?=
 =?us-ascii?Q?Od6ry0jOt9QswmM6X5VTV+95DiVcq7WxzIIJ2H5GPH7Ku8hjIK88fIK8wDCi?=
 =?us-ascii?Q?MBVYAuo7dh9Pn2GkVH0wWgJ+ozj4oK1kjER+NtMynAeUCQ/FlzQs/CrF/V/b?=
 =?us-ascii?Q?UbasVSV/t4hiNBDY133qxnAuau8XG7lBIBPwJZQKPD/n0tu2KpgJynA5A1N+?=
 =?us-ascii?Q?4eg7wgDA9xcTOmlnY4QAqkGsP7xsQr7We5iajt8w2tTHmWMoEPNja8r1eZzC?=
 =?us-ascii?Q?qjekB27nqFcwfTDKeoDLctlhH5gmgr+dGVfwwl/jvfYbhjOps8dJAgu6IClY?=
 =?us-ascii?Q?ZWdKBoihA3h07YiAABTP3DEkjFftxNTphEZWEjEMk49uj2MrKFlWSgq/o22X?=
 =?us-ascii?Q?CCuz+mrt5ukTZdtjL3uPrufc3GjWTe/2W+aQG6oUILYPdCF1pSrZ24ESgm3s?=
 =?us-ascii?Q?6Uq2aUUSswD69S/8W1SihOZBeIbjlM/m6U1VxtBNNafxHiIEOv86aHwip4ar?=
 =?us-ascii?Q?LfVkK7VMarTdtPpSLRYynjjRgKqzukSSH+wpVDbkeLUpmYHzJbRT0Tl+K7T1?=
 =?us-ascii?Q?COovqgriqOa70edT8nf6LoCl7K7EiwXVF/aWSOY7WeuQg0vqlBlsM8xnu8JA?=
 =?us-ascii?Q?wICvL2XBbJftYU8G2StwpDgxE1XS1IOrXN9wNN7ChD9K162oG2TGPpHqCns7?=
 =?us-ascii?Q?5WHgLgcyfQpg1K9VV208MGzKQEycF9f9Ita3af58XjwORN166sIb+5zIaa3K?=
 =?us-ascii?Q?MlbKLKVfxn4zZ/hrA5TSTfYU+ViRY1dxh0ySgjXe+OqHWDDs4h+IJRvoQMHV?=
 =?us-ascii?Q?NKn8NByOa5yogaum5yM46eUHnMNVihDN+aHprkzhIB0R5qsK4GZcCpijOt7N?=
 =?us-ascii?Q?yCHlBNJ3NcpkPUzgO24OIOBIj1voZl9IdAYwhjVpajzAYkFo2Oeg9n0lG1hk?=
 =?us-ascii?Q?J8K7PcozMYCH7zUlmHJXvLMqrwPbaYhTVGYY/d+knpdIfx1nbnkgN4E7a7Zj?=
 =?us-ascii?Q?DCbJW3lANwl4DCGA+AIyoEBIdcZyIk5hmxc1bQHpkNxBxs8/ffBdxk8rO5WM?=
 =?us-ascii?Q?bPepiyzcXtCAGzZePE6A20KSzYOtl5oFSGo+fCoINBR2ibJ3Z/UjwQuTF5n1?=
 =?us-ascii?Q?femLVMC2B4b7eaVYbYQjgaQ9qyKpNRHp9YJRjN8PZPFtMLQ0appOKY/wAKW/?=
 =?us-ascii?Q?W/D2rUX9xntG7FiakYPTUaSSxoYxxhclui4rNZQyrkJEsx/WiEzvh9MtSmu5?=
 =?us-ascii?Q?PkoSk0JfAZox0MQrFt7MgrBzIhpP6T4wUOiKr6N5oeM69Egl9YKiT5tKwlzJ?=
 =?us-ascii?Q?rFRrQPH2uwMdW99Ip57wnx2QJsdREuNiatJKK1zBLtnWYxviSSMyneO7uS3v?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b448baee-60b3-4725-2786-08de158dacc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:18:56.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pcHKEVpmUVOulP/HhKtH8u1tSwcioNKi+TyDyHNd9cJfWkyd7QdIm9CsIur2e9Qy4TJnLw0ScJeTHVDzxn9/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8990
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

On Mon, Oct 27, 2025 at 12:17:34PM -0700, Matthew Brost wrote:
> On Mon, Oct 27, 2025 at 06:00:56PM +0530, Raag Jadav wrote:
> > We hold an additional reference to the runtime PM to keep PF in D0
> > during VFs lifetime, as our VFs do not implement the PM capability.
> > This means we should never be runtime suspending as long as VFs are
> > enabled.
> > 
> > Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 6e59642e7820..ab4b8c48c86c 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1152,6 +1152,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
> >  	struct xe_device *xe = pdev_to_xe_device(pdev);
> >  	int err;
> >  
> > +	/*
> > +	 * We hold an additional reference to the runtime PM to keep PF in D0
> > +	 * during VFs lifetime, as our VFs do not implement the PM capability.
> > +	 * This means we should never be runtime suspending as long as VFs are
> > +	 * enabled.
> > +	 */
> > +	xe_assert(xe, !pci_num_vf(pdev));
> 
> I'd write this like this:
> 
> xe_assert(xe, !IS_SRIOV_VF(xe));

Actually this is addtition to the above assert.

Matt

> 
> Matt
> 
> > +
> >  	err = xe_pm_runtime_suspend(xe);
> >  	if (err)
> >  		return err;
> > -- 
> > 2.34.1
> > 
