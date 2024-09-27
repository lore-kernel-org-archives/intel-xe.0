Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D2ACDD1D3
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 18:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A2610E346;
	Fri, 27 Sep 2024 18:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eb6ZStn3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E0410E346
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727463463; x=1758999463;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uaqSOPSCKVM/KsvB6dLeMZQ6VCtuMUDpxFtBPAQDD6U=;
 b=eb6ZStn3y3vkxd0nBWbE9VV4F8JmBVPLQ0tJzoA8bi0+Yc3CJSn+j41m
 XDe1bKiyfp/zYFizq2QBklduTn1cvibbO4Bu6cChvgxicXgCryfeT/2kZ
 JZ8cEd+RiCOxBvUyNKPKXtXCJ+xEB+yM3As6CqiW5jA6lUHm2ei9Uxo2P
 jcXCseoz7kqCpZphDqIbc5G50AdMB0ina/fMywd2zCQnWf80f+EzsdATi
 EFXWGiKgmdYadjs0u7/EL9E4a/w8CYUWGmJEikfYi2BujOc80QPWWr1Ex
 W6kioXs9rcu37oRkBQMHkTYcejFcDMDWPUcso2AgiQNz2q+XjdS/53uiO g==;
X-CSE-ConnectionGUID: Em0edmcYQeWg79vOwhqkNg==
X-CSE-MsgGUID: e9TvuDIkSlSKFOuzyTImnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="14240241"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="14240241"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:57:42 -0700
X-CSE-ConnectionGUID: koUdabLeTCOHdlJU32pGSw==
X-CSE-MsgGUID: Dq3plTvBQQ20/+T7m+a1nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="110115862"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 11:57:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:57:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 11:57:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 11:57:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWD7Afqt33ev/npc2x0v61hlxXBnU8lETghOz0r914r4T2+uXcAkqecI7bTd4SC/k4cDGi3iG0/8kBuHGhfgdQqbJBjL6wPdtbp5FLbv+wePy9aGBPECMDx2k5TrJYsGpa270i/bgzdw3foNL9Di/bUPpAJQcNeGCN+x8kr9F+FstwQwO2rrsBGc8nDky79Gzd2QXEO0VbOx2ObnXnRC9FQ5iurKAbks4Q8YKmcqJIge7XZhvHeI9vqkJ87T9joCRRLrI9qeHbyjm9ani39BszYgvS/15UFWtHCB+OOFsiJXw9VETmIc9/oQjyXHW6ShG236NZLMZHDnbIdA3B8t8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtKFmJca7MVlYeYNQjNxg0pzntTFUt5Aqx9twJRXQ9Q=;
 b=X5JX2T5r4hdcyTgMnSPuj7XNXHlDKNToxueS2X0XF9jlQGulVUgvTmvmJBj/V8hjIRZ0v669kjHTV4AGUbmFjmnkGLHmW3zcR1PlNk67g7tt/I/xdexed0DKwpkpP7pwK+v2fZfMuslksy6BkRNrNmEGqSDRUi/wCsvxxIm8VIpwcipztmi/xTW1uZd/8qJ+fMK4IncT+fYuJOdColzgrSgWLs0flGYMeOItgBiUoOHWg78MNMM0BIcE+2hYf8Kkg9DNOO8CcI24cbE7jky9othnFZgyRHCy1CqvX4xQu8toMGRSSGCd/Iynmjxfb1xcCH4Le3HeFR2oaFWg66lFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Fri, 27 Sep
 2024 18:57:39 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 18:57:39 +0000
Date: Fri, 27 Sep 2024 20:57:29 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZvcAGXqFzE3Dm1Gg@fdugast-desk>
References: <20240927151207.399354-1-francois.dugast@intel.com>
 <ZvbtcCe7ZuW_GzP3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvbtcCe7ZuW_GzP3@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0022.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f6b1f9-61da-4f63-ccd3-08dcdf264220
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?j8oI/0gCd267mxLjIilCqgdxxkIr8PGAZypSQJ45jsbWsiakf+AhfseZ9o?=
 =?iso-8859-1?Q?6YIoV9wWiMhRqa/tXRQNueU7+KnSF21LJ5OeLHcSL9QzPF8JsZXIWDzeEX?=
 =?iso-8859-1?Q?Cbws6nC+axyKb2CdRt2jbdxtKCxx2VfCHzrZ2Y1Im5gmmhyvdc1YYZnqln?=
 =?iso-8859-1?Q?wpMUE9ZtzQeIIkz8REP6xVNRUAT0rL0rwggl2gTyKkwbnMZSagClj80WeP?=
 =?iso-8859-1?Q?AW8vWxYZfU1GF7LLnmIehHnL7YfskOfOwH8qpXxo2NQKAhgcjCR/ygpQc/?=
 =?iso-8859-1?Q?UuW/nUYvNAcZnMK4a9oMRnAI5wwttlRKp2Z/aKQ63dwveE51XmamOiFO0Q?=
 =?iso-8859-1?Q?wXflFp79TGtkV90UXMO7sNwpdRxNDEKG6qXT5etKA2itOVokmK0yMftbf/?=
 =?iso-8859-1?Q?QoWfPbvaSQL+vZy/5thtL/Is/kHzeDn1ZMSIASLlZlGp/k9b53+lJ1jfRx?=
 =?iso-8859-1?Q?Z/OEalBi6d6fX8ABohe4f4bgeljMn63x2puaGWwGai4YzTyuU85Jx5nmc0?=
 =?iso-8859-1?Q?nbHMYIUjnIjwA3RJbt9kUcS0379sKehi3yV1+xN9PcT7FUHwyybpiuHTHR?=
 =?iso-8859-1?Q?INyJZfqc2QMwPJR/XjJLvW57D2f7tEmTLhR2VvdIvByWskMiYTHfvNBBhB?=
 =?iso-8859-1?Q?6CnctH48lvHsVdvnflTKVzrMlupKU0YO8JJJdLXg8PnrgHBw2Td994C5i3?=
 =?iso-8859-1?Q?6fv2wf2Z3NfSFmK3vZDZgIWyZ/yVHPAIMUhYXvz7QmUijFVf5fxvfnQTK3?=
 =?iso-8859-1?Q?CHsu/gc1RCJmvczl8MDNJoEi2+o1/xobGe2J3+hRE/edXmQjupRa7EcFGp?=
 =?iso-8859-1?Q?a1hsPoNf6Nn6qBgdQSvqCwDV7z6zq9m1XIBryw0nSVVd8mYFVZPOdBqK5n?=
 =?iso-8859-1?Q?66rnSGGFHr2EDep9HuyDhjSlo/d7BOK3NYwZ59HgHBhFCnRkOe174KYeL6?=
 =?iso-8859-1?Q?KwUlA6keIEH7+wLFeNir7NNhk0UeTAUJ+wTyjfrIO+xv6G/HZt7cNmFa3o?=
 =?iso-8859-1?Q?t32QEV/6qU68p56P54Bh8/31gauUTqQDc2/fzMlOssVpu7IQiSuaMLTkJ/?=
 =?iso-8859-1?Q?ED3E5MkRzod/rh8wQQxWomqy2TjM4MxDR3CobwlT9aj/kx1U2VQ+lJcIB8?=
 =?iso-8859-1?Q?vTyyC8t8FHoVmkHQOb4LXpOm8/sOMlEKaYJMJErbayVtQPyvSXUIGxAtXL?=
 =?iso-8859-1?Q?np9EENmVpd4ZJrtNSAmUAMDfdZAHA6C5cGjlhqXJJ4S+e8PzC7fOAsAz7l?=
 =?iso-8859-1?Q?fj2CGvGfe7lujn4dZ8p1HCDTIgqCKqE4FoYpvO/Jiw+sZ9IHroYrqSxFlj?=
 =?iso-8859-1?Q?SY+mAFkQ6k2kccUTzKPdzCd+cp62HS8sa0Rpksn+L/k8JFLiVYTSV5QTCl?=
 =?iso-8859-1?Q?nATpYgirhTn2CqghUKqWEUYlmrtwpskA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eFPL/GkwoODk/6XoqkV97FO8+DSw/FKWv0ZNavJRoPB1Ej3g49qpGBUnfP?=
 =?iso-8859-1?Q?pqI28sER0FCe82fxfJjKZ8iVzo56C2qI8rLQmgLvcfzKJqqg1WVrKlHd0u?=
 =?iso-8859-1?Q?F4odetvRqhZo3/LjD5HUQnuBLHXPXciiWFZ1qXwDKh0qXDs+fQokDsA0It?=
 =?iso-8859-1?Q?FK2uNL96aGFEz4ocN415apwB9VGBrM5wZMa4GyaS0zRR//P5gLQxJXRUhv?=
 =?iso-8859-1?Q?yXiddKa9948Lp4b/Ntq4KJ0waVaOltDjDuJARLDcUF8+/4kNsRqNvCIx32?=
 =?iso-8859-1?Q?JmKmw5z5nOGClcSAD0aEc6dC+7uSxY+DztjsXCdiKyNrf9EZYL7YU8vBIJ?=
 =?iso-8859-1?Q?25wdO4MuW11Lt6t4Xl6lWwqBsilUHngNaEHa+Nr7QlwoMvYmnXY+2FhbAM?=
 =?iso-8859-1?Q?HLGbAuMrCECr8qzcbyRe6So3mlx/aB4BRZ+wzY3MA04mTWpAS3EFQdlFSl?=
 =?iso-8859-1?Q?EHlh6Xen7YmbTTvjdLiNC865vZCYzDkkrgGg2Ae76EL169N5ir7L2XTVTO?=
 =?iso-8859-1?Q?qHSuApAU5J715LBtYEf2y+VwsEWIqNgJREWJmrmmlP9Ih89NxbwlOn2hNj?=
 =?iso-8859-1?Q?82w0Ymkm7PxQT/dbF6bt6gab+GulaPncyRhF17DcIWpvRvKOZXHJc7yBvx?=
 =?iso-8859-1?Q?hQzCyl4JVK6hGhUmaF4b3z2B1bJ9p/FMA/LACIUCDrWJm+JcvP6EK31M15?=
 =?iso-8859-1?Q?rvZus0dDFzF9TTXBdtS0NLrHa2qsjT6Yzlu3475nJC2UckX2ARVsrsnes+?=
 =?iso-8859-1?Q?lFfmlTsKjJhPLbP2jD3/B92d5fuAtZzGKGNLJ6m2EmLbTTDmNW8JLPMj7a?=
 =?iso-8859-1?Q?ZkhvjDQ9jAiYpl8hCeOjlWhu9JcJFBzLS518jMItCKA5CTI3slx8JrM5Cg?=
 =?iso-8859-1?Q?tPNp2MRhD2RNw4sxjGCN+Xz3MDasMylEPvO+Lur3T5yuWIgwGFiG4FnlMC?=
 =?iso-8859-1?Q?YkkuzaKMdvIfiggMtuVRMu3dCZwDopIkAmQzkj1oVx3krmXrg7YVdCXaf3?=
 =?iso-8859-1?Q?xzU7npcYWc35cPyLGGjwY/WXkRd79Gw2Pqgi02cbM1Hf2ctcSkpzBJpava?=
 =?iso-8859-1?Q?1yKzMC3Mnqif6tZlOoLrlMtHIFDCpwWj3gamNlhXwc9PEsR816olelyL+J?=
 =?iso-8859-1?Q?2TtSlJHTpVOrhCeCeHMhw9BjBmmk+4JmvWpxZbq1vujQRfOHNbGirgYCZ9?=
 =?iso-8859-1?Q?NHYqj3N6C8DbGPeJIf19vFgW7eU+O5jLLe2Im139qALr2fDNWaDJwa0xnn?=
 =?iso-8859-1?Q?X0px2SjD2QK7uclnQtt+SyJRTiYt7rd9VLoKvx0EBry+yKY+CctVYhBU/H?=
 =?iso-8859-1?Q?PgSnnYYId9/bX9o56I3Zx+6hWyWu8DPaMAun2ICvl+8p2fO9Fox36MAINy?=
 =?iso-8859-1?Q?DYDwtvAzXpwAYoRqDEEIxVh5qLkIn/VJ31i7p3W7lA4Iw6suQrd+cekjmb?=
 =?iso-8859-1?Q?57sbxSi9mteBjRwZapYEdkuDBjBu1+grc2Pp6QgWRD7Q1nqw0ahdD0vlnB?=
 =?iso-8859-1?Q?ifJ6BcsrrCKzaHQULYxGgPXdm1gp55xaYRN5BcvSi1wEbHtn+mbwGTiZg6?=
 =?iso-8859-1?Q?LLIZbTfBSJvuiRML28wjodGumN+XiBrLrHAVpaosgjGBLsyXdT1+9vM1UG?=
 =?iso-8859-1?Q?DEw/IWwMP1Vi0HpruBNivpfUxVAThW1wQSosgwN3jHULn+VC8MG4iTBA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f6b1f9-61da-4f63-ccd3-08dcdf264220
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 18:57:39.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrDs6/hzRD4aXXL1sY3gDHZ0zS9f5zANAkQROJEKE/hNRbEZdz0UBMA2qXRdTITmlPEmA+uYlQ9ftKetOA/cKacLwj987rSb2+Ioo2EnvWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
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

On Fri, Sep 27, 2024 at 01:37:52PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 27, 2024 at 05:12:06PM +0200, Francois Dugast wrote:
> > The kernel fault injection infrastructure is used to test proper error
> > handling during probe. The return code of the functions using
> > ALLOW_ERROR_INJECTION() can be conditionnally modified at runtime by
> > tuning some debugfs entries. This requires CONFIG_FUNCTION_ERROR_INJECTION
> > (among others).
> > 
> > One way to use fault injection at probe time by making each of those
> > functions fail one at a time is:
> > 
> >     FAILTYPE=fail_function
> >     DEVICE="0000:00:08.0" # depends on the system
> >     ERRNO=-12 # -ENOMEM, can depend on the function
> > 
> >     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> >     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
> >     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> >     echo -1 > /sys/kernel/debug/$FAILTYPE/times
> >     echo 0 > /sys/kernel/debug/$FAILTYPE/space
> >     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > 
> >     modprobe xe
> >     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> > 
> >     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
> >     cut -d ' ' -f 1 | while read -r FUNCTION ; do
> >         echo "Injecting fault in $FUNCTION"
> >         echo "" > /sys/kernel/debug/$FAILTYPE/inject
> >         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
> >         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
> >         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
> >     done
> > 
> >     rmmod xe
> > 
> > It will also be integrated into IGT for systematic execution by CI.
> > 
> > v2: Wrappers are not needed in the cases covered by this patch, so
> >     remove them and use ALLOW_ERROR_INJECTION() directly.
> > 
> > v3: Document the use of fault injection at probe time in xe_pci_probe
> >     and refer to it where ALLOW_ERROR_INJECTION() is used.
> 
> I now have a feeling that we could have a xe_fault_injection component,
> that would be the only one including linux/fault-inject.h, the only
> place where these wrappers would be declared and everything documented.

The intention here is actually to avoid adding a driver-specific layer as
was done in i915. There is no wrapper anymore with this version (and the
previous one), only direct uses of the ALLOW_ERROR_INJECTION() macro, so I
am not sure what a xe_fault_injection component would contain besides an
"#include <linux/fault-inject.h>".

> 
> I feel that /* See xe_pci_probe() */ everywhere is a bit too much as
> weel...

This is an attempt to centralize thorough explanations and refer to it as
suggested by Jani. I believe documenting it around xe_pci_probe() makes
sense for the case of the fault injections brought by this patch because
they are only relevant for the execution of that function, during probe.

The approach and documentation would likely look a bit different when we
extend the use of fault injection in the driver to test error paths and
unwinding in the IOCTLs. Also, in that case we might need wrappers as in
the first version of this patch.

Francois

> 
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c    |  3 +++
> >  drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
> >  drivers/gpu/drm/xe/xe_guc_ads.c   |  3 +++
> >  drivers/gpu/drm/xe/xe_guc_ct.c    |  2 ++
> >  drivers/gpu/drm/xe/xe_guc_log.c   |  3 +++
> >  drivers/gpu/drm/xe/xe_guc_relay.c |  2 ++
> >  drivers/gpu/drm/xe/xe_pci.c       | 19 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pm.c        |  2 ++
> >  drivers/gpu/drm/xe/xe_sriov.c     |  3 +++
> >  drivers/gpu/drm/xe/xe_tile.c      |  3 +++
> >  drivers/gpu/drm/xe/xe_uc_fw.c     |  2 ++
> >  drivers/gpu/drm/xe/xe_wa.c        |  2 ++
> >  drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
> >  13 files changed, 49 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 8e9b551c7033..ad70a1bdd476 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_device.h"
> >  
> >  #include <linux/delay.h>
> > +#include <linux/fault-inject.h>
> >  #include <linux/units.h>
> >  
> >  #include <drm/drm_aperture.h>
> > @@ -382,6 +383,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  err:
> >  	return ERR_PTR(err);
> >  }
> > +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
> >  
> >  static bool xe_driver_flr_disabled(struct xe_device *xe)
> >  {
> > @@ -550,6 +552,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
> >  
> >  static void update_device_info(struct xe_device *xe)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index f68af56c3f86..47bfd9d2635d 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_ggtt.h"
> >  
> > +#include <linux/fault-inject.h>
> >  #include <linux/io-64-nonatomic-lo-hi.h>
> >  #include <linux/sizes.h>
> >  
> > @@ -264,6 +265,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
> >  
> >  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 66d4e5e95abd..04485461aa20 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_guc_ads.h"
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include <generated/xe_wa_oob.h>
> > @@ -418,6 +420,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
> >  
> >  /**
> >   * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 4b95f75b1546..816dc897e29f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/circ_buf.h>
> >  #include <linux/delay.h>
> > +#include <linux/fault-inject.h>
> >  
> >  #include <kunit/static_stub.h>
> >  
> > @@ -209,6 +210,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	ct->state = XE_GUC_CT_STATE_DISABLED;
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
> >  
> >  #define desc_read(xe_, guc_ctb__, field_)			\
> >  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index a37ee3419428..651543721ce5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_guc_log.h"
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include "xe_bo.h"
> > @@ -96,3 +98,4 @@ int xe_guc_log_init(struct xe_guc_log *log)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> > index ade6162dc259..8f62de026724 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/delay.h>
> > +#include <linux/fault-inject.h>
> >  
> >  #include <drm/drm_managed.h>
> >  
> > @@ -355,6 +356,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
> >  
> >  	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
> >  }
> > +ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO); /* See xe_pci_probe() */
> >  
> >  static u32 to_relay_error(int err)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 41445245a287..7ffee06fab13 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -770,6 +770,25 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  	pci_set_drvdata(pdev, NULL);
> >  }
> >  
> > +/*
> > + * Probe the PCI device, initialize various parts of the driver.
> > + *
> > + * Fault injection is used to test the error paths of some initialization
> > + * functions called either directly from xe_pci_probe() or indirectly for
> > + * example through xe_device_probe(). Those functions use the kernel fault
> > + * injection capabilities infrastructure, see
> > + * Documentation/fault-injection/fault-injection.rst for details. The macro
> > + * ALLOW_ERROR_INJECTION() is used to conditionally skip function execution
> > + * at runtime and use a provided return value. The first requirement for
> > + * error injectable functions is proper handling of the error code by the
> > + * caller for recovery, which is always the case here. The second
> > + * requirement is that no state is changed before the first error return.
> > + * It is not strictly fullfilled for all initialization functions using the
> > + * ALLOW_ERROR_INJECTION() macro but this is acceptable because for those
> > + * error cases at probe time, the error code is simply propagated up by the
> > + * caller. Therefore there is no consequence on those specific callers when
> > + * function error injection skips the whole function.
> > + */
> >  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  {
> >  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 33eb039053e4..40f7c844ed44 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_pm.h"
> >  
> > +#include <linux/fault-inject.h>
> >  #include <linux/pm_runtime.h>
> >  
> >  #include <drm/drm_managed.h>
> > @@ -263,6 +264,7 @@ int xe_pm_init_early(struct xe_device *xe)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
> >  
> >  /**
> >   * xe_pm_init - Initialize Xe Power Management
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > index 69a066ef20c0..ef10782af656 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include "regs/xe_regs.h"
> > @@ -119,6 +121,7 @@ int xe_sriov_init(struct xe_device *xe)
> >  
> >  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
> >  }
> > +ALLOW_ERROR_INJECTION(xe_sriov_init, ERRNO); /* See xe_pci_probe() */
> >  
> >  /**
> >   * xe_sriov_print_info - Print basic SR-IOV information.
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index dda5268507d8..07cf7cfe4abd 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include "xe_device.h"
> > @@ -129,6 +131,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
> >  
> >  static int tile_ttm_mgr_init(struct xe_tile *tile)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index eab9456e051f..087fb96f707e 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <linux/bitfield.h>
> > +#include <linux/fault-inject.h>
> >  #include <linux/firmware.h>
> >  
> >  #include <drm/drm_managed.h>
> > @@ -797,6 +798,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >  
> >  	return err;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
> >  
> >  static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 22c148b1e996..94ea76b098ed 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -8,6 +8,7 @@
> >  #include <drm/drm_managed.h>
> >  #include <kunit/visibility.h>
> >  #include <linux/compiler_types.h>
> > +#include <linux/fault-inject.h>
> >  
> >  #include <generated/xe_wa_oob.h>
> >  
> > @@ -850,6 +851,7 @@ int xe_wa_init(struct xe_gt *gt)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
> >  
> >  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > index 93c82825d896..ada0d0aa6b74 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_wopcm.h"
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include "regs/xe_guc_regs.h"
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> > @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> >  
> >  	return ret;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO); /* See xe_pci_probe() */
> > -- 
> > 2.43.0
> > 
