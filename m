Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3867606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G7ZeuAwx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NwSENTut
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A03112672;
	Thu, 26 Nov 2026 18:14:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D7C112672
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716878; x=1827252878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k6lAJFmGNUF2uzmMUBhn9olosg25JDj3sB+sINrCLos=;
 b=G7ZeuAwxJJifvYwvch1sZXf8DccUwdzg9fKohS4LWXmPcXnbKk+22/YN
 QL5Ta7K9q4ZhFF2a6i1nnyUQBlnZcXjO1jkwx2Cqmv7MxbOKhWv+9nEt4
 SV6SDlCuDk9u+qqae9ZiXBYA02XaZZkgCDHaYDGj8lUxlCRqx2QoZNHoI
 KazU97UdYcRsFTMiQE1MJ+Vu9Xupr58QASTu3Vj+UYFbY7RwOHZZ4XivP
 5Itz1Ys27key7SfsIvghpecKVP8ZomQFnHusv5TrKKyH20EfDdfR09Lbj
 tpNO7jL7Hj+g2PGLoPPKzbj26RAZ9Bv30sOS9+Pu2nVXA+xOWIUbqZuAL g==;
X-CSE-ConnectionGUID: pedXm+d8RiWmLbjfJQMQgA==
X-CSE-MsgGUID: GbTkKt/eTjehabkzMtBbyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4561271"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4561271"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:14:37 -0800
X-CSE-ConnectionGUID: v3FDaAAuQ/+btf0UbEfubg==
X-CSE-MsgGUID: sS+7atJuTWW06i1KLC3Nyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="13994915"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:14:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:14:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:14:36 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:14:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3K1PzqCwg70PC6KIGO33zNIhXGBw/GjNlW2CB+kJ7dLyZVQ0idMCS1zMijCDUPxobF+o6VMZp56recql9dkDfgpzeHw+ntgPINJxGIp1GwSGMSGcL49A8KosD7z8iHXd6oGKeZPqJdLlxHM1dfgm/fMCXlJhABCUz0K2g1fzMzXdGsQDdh0ys3hjTgRkJPtRxFoKGfFTroYLg5ZA5FrkoY6ZwmvVUOMCY+DxuF42SJi5gIvRnf7nD2BuNcTJmlOKQeyOZKoQEmZHPHM+MWlCaprPMUdyGiWvXEHiLtgt6pxqhZFww9tvvAocuEjSKlEVzOsYrsLwvz4aPnlEVNp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUI/HyH8YVV4YD7rLTYE/J9ze6Ok52VqmcNrv6YUCoQ=;
 b=BWfZAORS71GkyX8ZL0X9pZIKS800zDSVY3MYdinYOv6SnABiIqPooXX6bdgTLEXUoy2r0wm+38qUrzxa2l0g62WCYxQxCjv4ylvMChnnf/MbRGwE+DYw90cnEKhB2KfsstB/ZxrxGiNJlrWZUVtt/amkvyu8lUdMdM3XAu3rE+wFHtNaZLMvDr9xYEqc787M0n7azqpgx0c7lg3qYJITMKuXyM4ANWKwluaMfa6GbwEWGxHMLxoRIchVT3saif5na+hRgLMfFuapayAcGOWFXPuvOrYgnPnmFiq4aeHxt+08xL5DLyWMHGVcJJDIO1rpaMksuRevfOqgQvaComHsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUI/HyH8YVV4YD7rLTYE/J9ze6Ok52VqmcNrv6YUCoQ=;
 b=NwSENTutx9xIrbaWnI/4apBH/VTxkLd+VkotQ4LPSXMlrY0ZJKlAP7+cRBGLzuS8zwjLQtdDuecc9AC3o7itwvg82kBeGUMTK3H4qiEFKfZNd/yQ6AciwpS5X1/7CWUHo1Q+KKiNknXAcmGE/yUprdc6q1RwOgXA3cvlObof1uM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 18:14:33 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:14:32 +0000
Date: Thu, 26 Nov 2026 13:14:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ras: Add SIGID logging for fabric errors
Message-ID: <awh3BIHiizBMoqoj@intel.com>
References: <20261126095356.2153941-2-riana.tauro@intel.com>
 <6ccd001b-150b-41a3-a6be-ca49d16ed9c0@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ccd001b-150b-41a3-a6be-ca49d16ed9c0@intel.com>
X-ClientProxiedBy: SJ0PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::17) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: f779ed9d-2293-4996-8102-08df4be91ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: jDducetWDsnBpIa2iZNTlH/9W3VpXhNZN8CDUFL4bOFNdIubS/1+qGk8SgJnMH74lzgTP63XetbAwj9Y6aHuCt6zA4ERE6w7laSp+wjvZjLh6KqdLJaMH7NhuXUeezinAzIkZK+Gu+XFOS3qCUEHpDMJaexY6HquGLyBFGfl3njt3iYTBUFoHiIcuqHEFw4rYraHoRX4PIpe0MYFBYPNjc9byUtVJcQLxB6+qq3TXZFbSF031qUAzR4SVnXnG18BRq9glx0qJub0ByiL7fr4LzvK6VRAPOpNQHzXwv5BY3HBTuF4rDLJvGwCD/7LI+c89xKUoxEZQ3ZxRkUMKOa7PDGrh34nWlWHLzI3/46iglckLx3vJ93cdnkNOysOie1bCAYNWI2DtGymrBznU2SjMy5Q0f/Ic2d3ilglQcMSaJs4JHWIz3Chg+k3Df36KXliu6uSCIch0DYjC5G447JwedYLJcZLRpuZyEU/eMi2a0Xshf6GLI6PWMOMo0f6whCT5qsiEV1IENMsgvdmpZgra3IX7haH7A5ckiraa781jWTfxXUTarjWSSwIEynZgLtpwcj2aZaA/FWEqWOoaSLnSFXw63Ead9Y3vNjdAN+2zv9V3a4A4QSDIuSs4sxDRMPVIvZpkGINswQCO7FflmCK3lCBiWQP5p79MM/C8yLg4ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hzq/U3oufObgBPLigxNqOeB0CYtpoTVGtKXNmXNa9K2stS3HJWVyjgRs6gBW?=
 =?us-ascii?Q?K/Dfqz7rzG7HM8zXpRr6q/oXnUGihco7hCfcHzCjy8N7b5g3PK3ZgTCUYdpw?=
 =?us-ascii?Q?VQcl3q4agRX/VryUjTKkstywucg6EYrfufIQeUYHWFFFssXh5GAuLEv7hNr3?=
 =?us-ascii?Q?Fdkreu7OXoBFd8idKrvhlSrkj9qlv3SDrrZOCIMh3eaqQyU2WjgQKm+cT1D3?=
 =?us-ascii?Q?NbRE/nSEkKCMnU0Ox5nvoPSVdriMQGGscjlilijNQQWNQCAWrrsbqY/bHpk6?=
 =?us-ascii?Q?7IyfysR7NN5gliQV/s74x6o2am14uid7OH+bGPzqek7YrP+6OiAxsA+90Z+Q?=
 =?us-ascii?Q?NrK1Vn18MfG6g3hjAgFDGs96IaGUJkkzfFKY97oEt2z4U/QdHlsB5FCOCakM?=
 =?us-ascii?Q?wnDQvWsDhesLDmdASd6KAT9j4KX4/zvElFo5fGdBF3+x8Y3JspyRggk62NT5?=
 =?us-ascii?Q?WzfC6wccHEN0XzD7PIYhtlx9mspI5lU2X9rDPo2J/hMsQYEcQgFnigZHkWIp?=
 =?us-ascii?Q?zukc5WcIVePk34ZcSHHNXbk+RtfhIkYVCCnDTl7Z+21rFaVcPOsdzeJg2Vvz?=
 =?us-ascii?Q?F+HCaiegSXhJaw89WvOLT3OUkXJj/F2kx1IT+U/DICtgJ1BHatHVFFrhDtr6?=
 =?us-ascii?Q?Ykso/DEhvFwjHN6AHAwryHi/nz/S8yqpTLltJnNK04rbs8nMhE1JhMnjsO8m?=
 =?us-ascii?Q?r6FWKtvpqsEXTqWN0I+jVg40U76j6oc6mEBFFpQhcC//hIWEEKw4FtnVyZMU?=
 =?us-ascii?Q?T79hv29D9ccc+nuxg2cTdjwVFaDoHO73ChfEFhKpP6RtZzk+JU9XQJ+c6e1T?=
 =?us-ascii?Q?++7P4sYpVw+gmM/U1FPcO2wNWxMeMsk63QZjG1pPCidn+TO2TipTdTEwJGHn?=
 =?us-ascii?Q?3IGSrIofRRII7MeYOdfogy3GOW0hDAEhRrugKZdTEZ4/dIMloDO9Ei/6+0Yw?=
 =?us-ascii?Q?FrIt2sfPA2CFFIqHLhPaek4VMWV+wLi2vIV35qhgfckX0kELNWGH84oMUmMg?=
 =?us-ascii?Q?vjxeE3qtliZfmrEkSLgoHJOSC1vkaKgIdWgtP/FsCXvum43PBdlYHstwtLli?=
 =?us-ascii?Q?hfMmdZwuw4iy0IOcWsifSzxl9Lf75wYPkCEK9/dN5gYje4xZ5+lv57Rqm48A?=
 =?us-ascii?Q?3/k31EePJx62B/qJ/vuaYNcqT2xdIgSImft6PW0xmgBUQsAbFtSVKdHnTcWU?=
 =?us-ascii?Q?6BKjTC/r02KlOqHFUhzd8oRoIuVXWdljTWcZDwZmBT6rFaB+8h6XKWCQpvdj?=
 =?us-ascii?Q?KnKqbeGzI54xseywpERVFjDqQYbsybc5lBunG7hJmplGa6TiTwaQBQdlcCmi?=
 =?us-ascii?Q?RhrDsYdVB4JcxRrUrXNredOBVv/GF39Sbes7hbzTSQfha5rdQ0iL1S6nnxQr?=
 =?us-ascii?Q?PkENBMbqooSVrmASwIDLZn6UB4XOS7tzEdIlzNMNIt8nGTNWdRZ87h0EdV+a?=
 =?us-ascii?Q?IFx8KsnSFke4YNvOXAHra4hdQFkKg1tmmGBQpZmj5jxHNX/37PAsf/062Pnb?=
 =?us-ascii?Q?HK2SBCvN1B2pTJq+/XPrBOe/uIMBzq8VQWXSPWVIgf9IN0Zzzf0d9i+gfez+?=
 =?us-ascii?Q?VsxQ2sILxqs5iVhrYiSSmQYMjjNpdxcq6ejLaUBHhB/XKPic1o6z6RxaELkb?=
 =?us-ascii?Q?vhLyjn9Bpa/QEAf3wRfSwMoeLChWX86EDwTajdVl5lgTbtt64E6+5lxABSkv?=
 =?us-ascii?Q?fVyTKo4eBfLonkbqpqLjqIAZ1vG4fWdhBsHZDOdmlEFRdVX4jeigqD80Lg0q?=
 =?us-ascii?Q?ZtyJDvJ5GA=3D=3D?=
X-Exchange-RoutingPolicyChecked: dh/lxf24xEw/bTewsz6SYO9h5z0wN+DX2Ej2NP27ORwl9Y3QT/wA2XPCheo42KljKODSlUhNEwc3A60gXb9aXsUCEDFsnyhKeMRPpYPTzoN1IgZq+3AM9TIlPgE1EWCCQpadmIvXe+b98B81kfbg3BY6udCczSM37Els3i57CPx1Xfvhjr3es6MJKli3nuzPmzTdxEZqv2Dq2/JmTo3QUsj7pskJaknIF95/iFc9JSGyDiD8OM7HCDpgOixBX1l2CdmodWvn24NG5FKGCI/X4PX+urHFulx4QF30b6PEV1mkC62vca24cIq4C6PhYXXGhRrbBFjzebTRaIgrdeaRPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f779ed9d-2293-4996-8102-08df4be91ea5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:14:32.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ye9qR/KyzcYzrhk3X08aMVNkNTDPs52RMqo3oXzUQc0w+lElXWLtkdVbA+ZCtrz5zs5pZwD8D+AaZceoFNUog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 04:55:38PM +0530, Mallesh, Koujalagi wrote:
> 
> On 26-11-2026 03:23 pm, Riana Tauro wrote:
> > Fabric errors reported by the system controller fall through to the
> > default case without being logged and without generating a CPER
> > record.
> > 
> > Add SIGID logging for fabric errors, which also generates a CPER
> > record.
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> 
> Looks good to me!
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

pushed to drm-xe-next. Thanks for the patch and reviews

> 
> > ---
> >   drivers/gpu/drm/xe/xe_ras.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 9b04be3405ca..87e721a7fd74 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -888,6 +888,11 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> >   			case XE_RAS_COMP_DEVICE_MEMORY:
> >   				action = handle_device_memory_errors(xe, arr);
> >   				break;
> > +			case XE_RAS_COMP_FABRIC:
> > +				xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC,
> > +					    &arr->counter, sizeof(arr->counter),
> > +					    "error detected\n");
> > +				fallthrough;
> >   			default:
> >   				/* For any other component, reset */
> >   				action = XE_RAS_RECOVERY_ACTION_RESET;
