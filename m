Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150E4CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 13:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA1210E780;
	Wed, 22 Oct 2025 13:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fc5mtWV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26C010E780
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761139884; x=1792675884;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=X7/vmENJNs7Ycj+rWAiGE+eK6zbenJcqv/3OIzH7B/k=;
 b=fc5mtWV2b121f3+kz0sWKFK1GBPjGjCzMp/IdH8p7vphZ8ug7k4azFBN
 3XIhIkObGCZ9c+qI8Z2Tv+ZV0k7xcshwCo+CtOFYHfHuZk92cr836vKyB
 luxgEYbZR1NHsRzDpG35MqrIWZ7rUWsfWvAhud6so1b+TmuByKU5MvSR6
 /sf47VmRWVq9+/XPmod33byLCDNA9FUfRICUM4o/6frO++5rQbFd6KJy+
 f798Ir+0f3OUErrQK+VJi1GwxUGl+RFPvBbxCxJ3YMIzigjwHvp+Psrga
 ZasGs3WfVkEXaWDzZmrM73PYhuxrtqyq+LmgzDcU7Gos9kueQG13QZ1ee Q==;
X-CSE-ConnectionGUID: u4v2p6Y4RgevRuIwlUUDpg==
X-CSE-MsgGUID: 2oAWUibSSoWbB2C8qCNSoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63182914"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63182914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:31:23 -0700
X-CSE-ConnectionGUID: +nFq6FwdRFGexx5ionq96g==
X-CSE-MsgGUID: 23mUzPN+SKC7ZWK3EkHmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188280433"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:31:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:31:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 06:31:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpRM556A9uCcR9pRR3zEN2Zmc0zueYjkjA5/I6a0Np79bGDa7twwg9JRLgFvPXI8posKR+FqAYdHjtKloA0Zh2lGv1Rj7TfIo9VM1BF1b/ol8AAftX0WwUWtF0eGsyl2DzHovEfDQbF1qKvpK7d6rUyDenFAAKrLa50XIiZ/BrObSYEwknoBu/9tw31lwkO907nFB/dK8LP6msNVEOcZCzUAfGMfRCEIf3wF8Hevr+A7XbZXwBmwri7iTKoHOhJhB+E8hVZ/8jV/Zp4gNVI4xe/axg6t3jEPJlDYPKtPdvAH74D2Gk39RoZH2xWoKMjKVdb9ud1locihpYLp2PJ8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ci3CGXHp9B8LEVjSEUb/GzW2RHsXFhzi3qz6KS9WRKk=;
 b=MYWv/BMtMxwNrY10tB0PziV6l8KO0t15efZdiBxqNUcO99nsegUYckNuX4MXGUZ2g7mLQcYNDYjiGqcQTGSW8LJoFzgXw7TuQR8WRjIsoAkzdnNbfX8bO4hoOJE+JVKnbjys+fuzfiTDElExUwtl6a4pmPeh3Hjc8T0Z6VhOT3UOVJUe13XfbAjIcT7mfUO76k7obkfcjc3i+jQ6kvSHXzUQpakXfhUFDJ7wMFGg2RWbbHcvSOyA3rXZDZTAovmY+fwM3iaJPr7em2S3hTu/OIk3sgMekKALby0OzMPKYkOz69Pf+jJrwHSgZK9Ek2X6e1RrtklGNUHO5rTZ5i1Z3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:31:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:31:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <iy5fneu7goe5dzqmawkkep5pdtkbr5xn5s6oyqklzm22gdsul7@25wccgtulxgk>
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
 <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-1-27b03971bc7e@intel.com>
 <176100466430.3231.16362806979991981230@intel.com>
 <iy5fneu7goe5dzqmawkkep5pdtkbr5xn5s6oyqklzm22gdsul7@25wccgtulxgk>
Subject: Re: [PATCH v2 1/2] drm/xe/tests/pci: Convert GT count check to
 general device check
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 22 Oct 2025 10:31:14 -0300
Message-ID: <176113987409.3231.6079039608938116945@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc6f611-2f45-4861-8221-08de116f4887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHE5cW91MStncTFtVnVXYml2WEx0dHBvU3cxMElQRzl3bUNMSllQWTU0djNC?=
 =?utf-8?B?cDBTL0ZncGZrOEJtSkEra3Boc2NjZEZ0ekQ0eXZmdEpUZTVYNVlGcDcwajdl?=
 =?utf-8?B?cW1IOGRaVmRnalVBaU1oNFcrUjBQRS8xcXRyYUsrTGhDTkRkaE1hb0ZFR0Mr?=
 =?utf-8?B?MjF0S05uTS9qREN4enRwMWx0MFhBQitEMUJwbEVFTlpTcmpVR3ZZZzhGQXBF?=
 =?utf-8?B?dTFQeFZxTUo2elFwYndxNDdTNHdGNDdXUjlPNUlrMFR3T2l3QkJKKzNzT2Ix?=
 =?utf-8?B?OXVjRUNqNXpUb2NENnZDODJwL0l4V2U0cS8rTTU3eGU3THVYaDFVWVBNSmlF?=
 =?utf-8?B?TkhFQ2pGWHFsbDMzNmliM3VQcWoyQkM2VjBmWjFUQTd1QjVRdGduKzl5UDVE?=
 =?utf-8?B?b2RQSXdjaXNWNjlBclNWOVF5d095NzRNQzB1dC9SaTJtb242NThycjY1TmRZ?=
 =?utf-8?B?QWgvY1RPUGNMSldJVXpjS3NWQTJwRjFNQVdjUFdTQkxYMkZ0aGRhUjNxZEtJ?=
 =?utf-8?B?WlBCVzN2bGUrdHpkeTFkUkUyM2NBVi9NM08wc0pQb2VPL1M4NDM3LzdsWmo4?=
 =?utf-8?B?dXErWHZ6VG96SFBrc0xjWjExU08zdG1qdVgybjBRUXNIZXl2Nm1IeXl0VGpq?=
 =?utf-8?B?cmt1d3RjZFFHdWcwWExtQWFjaURTTkxrUVA4bkZjdkZ2bkowQmt4dWhoR2t0?=
 =?utf-8?B?VlZiWHVpTjhwUUVFei93eUo1RDROeTVkZFN6V1NyaDhnZmpPc0F2VHpKaVJN?=
 =?utf-8?B?TldiNkIvd245aEJLYVp6Q2NaK0xSblFzY2pweXNNVmVtYlBHNUNuSVIzS3B6?=
 =?utf-8?B?MkhRbGpLWGRMdUxGc3ZsTnMzYTNHZlJRTlZzVUFCQTl3QmY5RmlhRktYZWVq?=
 =?utf-8?B?SFN0ZXpCTWQrYjdUVG1FY2pRZEZhT0dJYWdCVW50NGxBd3lTSHFvTmlDOVUz?=
 =?utf-8?B?NHg3ak9qeDNtWEtRRVVMdFROcWVTNytnbHZjQ0p6TG9UWEYzSmhVVCtxTzN3?=
 =?utf-8?B?dEVRMzdQdllqdjRWMmNZSEhlUWVvRC9sZFp1aVBia29FTXo0azNZaXVNelFG?=
 =?utf-8?B?QjRZWFRkdDZMSk4xVzBRMGF3ME1lbXdKaGF0emVSOGRYTkZzY2tXUUJtN2VL?=
 =?utf-8?B?SElPMEdZbjhRdXZiclJNQ08yaVF2V2tKajBuSzd6ZlFqV3pZR1E4TUk2cHZ1?=
 =?utf-8?B?QU9YK2dqb1JySm1Nc1N5SlZSaUxvc3FOQVNTV1lraVAxRjA5ZWFUVDY4bmxD?=
 =?utf-8?B?WTVHTzNPWDB2SDV3eTZEZWhZS2JJQXVEOXVoUVBWZjhGTE1Wa2U4dWVFVTB6?=
 =?utf-8?B?VFRteW1wSW1oSkN2R28wODM0YmErTTlER1BqZHd5MkJydThGWStUWUFYK3la?=
 =?utf-8?B?dko5Zll5bTk5LzROaVA4TVFtdkVHS281VkxEa2ZCa01wcU5Kd1pLbVRhVitU?=
 =?utf-8?B?dGtSaVBQL3RZa3F2YVVMWlBDVDE4V0pZYlVXMWN6UERDZ2ZpeFhneGZjWElD?=
 =?utf-8?B?aHpheHBtaVN2Vk00U1FLY0haSE5mMElYQ2RIQnhSOTBaWmJRYUpFR1BpZlF2?=
 =?utf-8?B?dXlTUUFPZjNRZmFTdHEzUHIwVmlveWRDT1FYYnhrT1FLeGFrZldtcTMyeTJz?=
 =?utf-8?B?SGphT1ByM01xdGhvVXBNK0F6bGR6L0M2TldXQmRveTRNQmpLa2d3MEdmZUFV?=
 =?utf-8?B?RjdDZTRaOHlEOTgxaHA3eFlvaHUxNXhpYklEMWppaUlSaEwvMmxJc2IweWYz?=
 =?utf-8?B?dGFqRm1vMHN1eWh2OERHMlVqT285eUgzcjhaRXVHYmsra0ZDblU4bk9zOWpT?=
 =?utf-8?B?dHBzNnE2a0Zya05SMmQ5MWNqNUpEWUhDN0I0WTVReFZrNmhaZ0R2ckFPREw3?=
 =?utf-8?B?bjJBcm0vLzVpMmpEd2loVUI3RjhaV2h3MUs5Z0lCNFlEeTJMRjhsNmFSbXNL?=
 =?utf-8?B?bzhEdkt1T1EvRjdkbzFBRkhudHRNVGVlVkhlMHY5KzlnZnBZRHRkZG9xZiti?=
 =?utf-8?B?eGdZWjJQVFVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXpDL0h0NW9HaS9PS01DT0NzcDhWakNCR29OQXlYRUhaOGhpYTZBT1doejJ0?=
 =?utf-8?B?VzZvdFh0QUVTTUN3NEp1ZE1mdDhCVWI3UTc1OUJnZ2d6SVAwVWpjMURuZjVX?=
 =?utf-8?B?TzNqTHhjK2NpQWpiYk9YZ0hQNFBiQ2FPMnFvMUhEYitGNW4wZWxSV2pyU0JD?=
 =?utf-8?B?aERSMCtmSzM1TkhnRFlFUGxGOTY3QVV1bWpFaGxyb2hrMWlhTTFCYzlLKzJ6?=
 =?utf-8?B?MnJBWlQrTitNVW93OVNBUWFHNktsU1JpRmQ3MGk3Mml6MHI0OUdVcFJvTW5i?=
 =?utf-8?B?eStjQmxJUmtXZEoza1ZFTDJpTkxiTlhaR2lWY2xSOEFkVUcvTkZmdWw4bkVi?=
 =?utf-8?B?eGZkWFZ3TCtVa0h2K25uamVaMnlRbDJmczR1UG9xVk9oK3grakl3TkM1REJr?=
 =?utf-8?B?K01UTmF5ZVFkZ0hTaCs0dlN3S2c3T3UvMW9aU3Ztb0hpMlhLNTVhZU9jZUpK?=
 =?utf-8?B?WjRZUHZHMnhxckNnTUpHNzBiMGhuYXRlNTl0WVhFcklDU2dWZHlobHI0eUw2?=
 =?utf-8?B?RVpnUncvTk45ZDJNM3htNlhxSTBYWHZPeTc2Rkd1MVUzSW91am56Mkp6NVZv?=
 =?utf-8?B?R2VDZ2laYnZ2eDVVTGdXWkFNamJPdnZuU0pOQmRpei95VHNPL2FUU3ZhcWxW?=
 =?utf-8?B?Ni9EeFFnMVA0WWNPV2s4SUQ4V0JaaUNYVFhPU1NvRGtnY0JGaGJtRGptLzhs?=
 =?utf-8?B?Y25wblJqM21mS3JMRnh5eG91djhtVGxySDc0QmtJRExqS3V0cXJNZ0R0ZHN5?=
 =?utf-8?B?YUZ1ZDM3OVUvaFZGQmlCTm1EM3lLcEdHcHBHTHM5MnVtdXltdVd3RGFHVkFK?=
 =?utf-8?B?UDIrSlJWOEpJRjVDd0tOWkNvVWZ6NDFGbTBoQk1CaW13dzFGN1BLSG9RaFBW?=
 =?utf-8?B?QXB1UnliemxHMk9zTzRUbmsrcWduaE5lL2k5K29Ka1Q5dFUzenhOQWUzc1Iy?=
 =?utf-8?B?UVJyWGhYeDd4M1FKdU03RkNXV3dCRVgyRUpPamU2UmJCTXdEdm54cyswRi9B?=
 =?utf-8?B?TVJDTjU5L1p5Y2gvUytpOHpUYlVUVEREODM2NjZCeVBvSzZybVNueGQvbVdI?=
 =?utf-8?B?ZDZxRVdpR1JvUVMrMS93dTZVc1kzaDlTSWhVZDlzdmFVdldtSDZhSWdSWWR3?=
 =?utf-8?B?aFlReHd2Mzk4dkt5d0JsaVZOQkdWa2I0dnVNaDRwWk1Yb201TkFSbXFhZmNx?=
 =?utf-8?B?d2xHUDJIZkEvaHBtanZ0dUsxZE85REZUT1d4Q1l3WksxbGpITkI3a0t1R2Yw?=
 =?utf-8?B?RXIxQWZnUmh4YnlZSGZMbTlERVkzKzhjVys4ZkRUeCtkZG9IdjlKUm9obEcz?=
 =?utf-8?B?SUIwRlpOYWZsblJ1QTQxdlJrSlU5UlVGd213ZmlYNnBaNm5QZnV2dEIwb3R5?=
 =?utf-8?B?N1FwZzh4VHV3azV6MXJZWjFDUWR4SjVnMWF6QlJ0UWRGK2ZmM044ck1YL0tz?=
 =?utf-8?B?SFNSZzNrcGd0OENiaEQzZE12UGJQZnluOXZva29QeEg2bkFHVFdRd3lFaHJT?=
 =?utf-8?B?b1liNktxdFRlcTY2ZlhpcTNtby9EUXg4TlNrZDFWUHN1VVVKTE9MUTdSSWhh?=
 =?utf-8?B?cVlWVUxISlBESHhWUzhFZ0l1V1J3ZzFzUzhpY0pSZ0FCVW9PZ3JCN0RMaWZ2?=
 =?utf-8?B?L1VLaSthRUpjWXh0RFFLbitQa2dXYTloQUVFdU1CMkhIdkpzK3NUUHdDTTFY?=
 =?utf-8?B?QXBVckJoUUxZRGtzRzRJTDRYMldoK1lISVFVWU84NmpyT3c5dEhBcVNlMDlD?=
 =?utf-8?B?UXlsbVcrUmtheG9keXRwc0VnY1dySHVXcFB5OE5uNndVUEdxamJRUm1FVTRn?=
 =?utf-8?B?WVoxUXcydDNReGJuOG43ZW9CZEdKTDRYTnhSTnVWQW14SEtTNDl5UWtwa2I0?=
 =?utf-8?B?T1VMZUkzT2xneWZ1Vk9VT3lmRXpXdDc5WTIwYVF1UzhscERROUxRY0lnS3pS?=
 =?utf-8?B?MzAzYkpObXJjSkxRSGRsMmU1UFhUcU9iNHBQVnA1UjJGL05nY0dERENwU0s4?=
 =?utf-8?B?SXAxMHQ4ZXFRVFlFcVFKSlE3LzYyOEdpcVRUdkVRazk1eDFGWHpMVHRxTnlI?=
 =?utf-8?B?eklkSE90MndLelhnS2lscGlyNGtnWFJlS1N5VzVDR1F4T1o5dGVGSEJHRFlU?=
 =?utf-8?B?aHJBeDVmNnNoc1Y5aEQ3NUJMVjlxVStRREJkcGFPWXdlTkdwT24yejdJYldY?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc6f611-2f45-4861-8221-08de116f4887
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 13:31:19.0913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3718Dpz5EfZM5jUHBZQtdxdoD46j4HkSyYsxkUM6gu3DWAMIi7PS++ECPZDtwgMwxSqR0KJ2VGqYXwBjsp6c3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

Quoting Lucas De Marchi (2025-10-20 23:07:47-03:00)
>On Mon, Oct 20, 2025 at 08:57:44PM -0300, Gustavo Sousa wrote:
>>Quoting Gustavo Sousa (2025-10-20 20:45:56-03:00)
>>>We already have check_graphics_ip() and check_media_ip() as general
>>>functions to check the IP descriptors.  The check in
>>>check_platform_gt_count() is simple enough such that we can convert the
>>>function to a more general device check.  In an upcoming change, we will
>>>also add some checks for other members of struct xe_device_desc. As
>>>such, rename check_platform_gt_count() to check_platform_desc().
>>>
>>>While at it, use inline (unsigned int) casting of max_gt_per_tile to
>>>keep checks for each member localized; and use KUNIT_EXPECT_*() variants
>>>of the macros to allow multiple issues to be reported.
>>>
>>>v2:
>>>  - Use (int) instead of (unsigned int) casting. (Michal)
>>
>>Whoops. It's actually the other way around.  I'll fix it when applying.
>
>or just follow the kernel docs[1] and don't add changelogs to the patch
>themselves.

Okay.  Removed them.

By the way, do we have instructions documented somewhere about the
general policy for drm (or maybe also i915 and i915/display)?

By doing calling the following git log on drm-tip

    git log --no-merges -- drivers/gpu/drm/drm_'*'

I see a mixture of styles: some commits include the changelog and others
don't. For some of the latter, we can see the the changelog is in the
patch email, below the "---" line.

If there is some documentation on the subject on the DRM-level, then
perhaps we would need to list xe as one of the drivers that opted out.

>
>>
>>>  - Use KUNIT_EXPECT_*() instead of UNIT_ASSERT_*() macros. (Michal)
>>>
>>>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks!

--
Gustavo Sousa

>
>Lucas De Marchi
>
>[1] https://docs.kernel.org/process/submitting-patches.html#commentary
