Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC2FC282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E910E4BA;
	Mon,  3 Mar 2025 17:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGVuz7Vk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB14C10E4BA
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023895; x=1772559895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DrpNZb1aaWuC5rqHO3/8NG0U1hcR3AcTggpXrBFpRCQ=;
 b=PGVuz7VkWLHSh6Firi8yrTrowJk/I76TOa2Cdjei3qg7B9KiZ4B3aVfD
 cEcU1qStC4ifcemBszqEG9hao+4ThV9UqsHe+NotekGU6ew4pJidwJ6Hn
 N5cjiGxdY4OVu3/QdWY40ppwqHZ6IBv1fCcqKmDmzz1Af8xCjXOn+4gky
 3w/idoZk6B2d43sNdSSe1CoKax9dlUFDjJS0rNFrhkcTVkH/KFE/+7e7B
 k8/lvsB7go970H2MrEt2mMxGYr86QtyT6cYq2KAIp/XwjKZNEQ+i9Uhg4
 cqox9j/YvpHyZ0W0y5n81AmjbADhYinIWVfMXliOPbDnKSb1NTk8bD5A5 g==;
X-CSE-ConnectionGUID: H4fDMmVmSuCtRnWsB7J16g==
X-CSE-MsgGUID: n96Za+IaS/elgs/WUtKbaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41938652"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41938652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:44:55 -0800
X-CSE-ConnectionGUID: ME7oQiAhQ7S1f0ZdaPc6iw==
X-CSE-MsgGUID: qktAIFNTQRW/EEEfAJ4LGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118104079"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:44:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 09:44:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 09:44:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 09:44:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2bBXe0eCXxmdne+dqi9l05pT0NA3Suby44cwW2ZSbGwkeJ0vv/CrgG4MabcyXmKMoa4SNBQ1HF052+5sxVYUQi9JOKo1w6k4DcGmd1GasCf+usyPqezBTMZarR4RXRuYnyq+QIKJiaVmQ/o9Ovv77W0rjmG00aDNO/qE9d7TWtfQMhFcGU9A/DyH+c+KzFyWcgeGFCvet9lRcNamz0WAVZhjkJgkdGwyXm1ldKTqe0R09I5OC0SV8yAMpHS2spj4GPVSJ/0rMxmdGhKtXEtFM/pYQ3dxX/Jl40JT/1WhBWR+rnnYlVvkjxRM2pD40tAJ7Lwz2nAbDSw6l1Pxcduhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1tpUZyT2w308wHMqdfM2O33gbgcNuQOEgTShQ7/k+k=;
 b=LYdFVeyWp8MXbUAg6k/32YcKBE6Lq0l/FKNKju3N+VSPPfXBQ139dV2XJr+i7SDfZvKMbw+QzU8zgt4xUwW5ahJOKDZjdK10maXpVzk34wziCaq+1JeF+dGoUS2k0Xs92QrUTDPTNJDphzab+I5KnaSOKnn9KsrX2bgwmeVgWJMUg4PwTbNmlwZECl8JD1T/X60EKT2fPIU2bi+zNcwFingQ7DAwN+gvKXx5JhZI6fzZZxF6EColCwbY1iDKFgpnUQ0yupwcdSTNBxOoCITmx1L0I4Xvv5UTII+/Jquy6DsHGpxFwEA6lpjj/Pxc1l617MqMBJIeRz3F8x663vW7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 17:44:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 17:44:09 +0000
Date: Mon, 3 Mar 2025 12:44:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v1] drm/xe/hwmon: expose fan speed
Message-ID: <Z8XqZMxo9WTK6rVs@intel.com>
References: <20250210100515.2205584-1-raag.jadav@intel.com>
 <Z8VZud-t0j1bMSpv@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z8VZud-t0j1bMSpv@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:303:b5::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b40ff7b-eec0-451a-f62d-08dd5a7b004a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6wu5CY58rIEDFQaGhLYbNVtw+qi/hjsaLfUpv/DZJjqMPmSrtgpydV6HKScO?=
 =?us-ascii?Q?QQJZEJ6YLLOnCywdE46jFszpeSQm39MAJ+FvoM6eK8hASGQBjypjo37OhpGe?=
 =?us-ascii?Q?8brgMpNCnaI/3cnAZYgn5CGmp8ZgeHyeevCE44XHglwyhAPPZRb3QTfCNsU8?=
 =?us-ascii?Q?K20uzGD3AyErh7mVuAbR3WCOI/oLZyl+VVhJS3E5Y7n2HfLFkmeTnXdsrsAv?=
 =?us-ascii?Q?LlkuPDZjy8NLtNBc2astwMB1VvfqcDnToYvAkRziwWOvzoqxRxNhVQfbh6IA?=
 =?us-ascii?Q?sM2MRRrv6+DHUQJVzCKiUMW6QH6fbRJf5FJywNQPLzO4KDqfcXEXZGCCD47D?=
 =?us-ascii?Q?TangZr2T8Z55ArS7ZNIbm86Na7cu0WyAIvvql1wPfBvgz5G55Ki2r7IZCj5B?=
 =?us-ascii?Q?BbzNKDDBWcnIgcIhjkBfR0PyJBKDpcUPrVOsbaqCpkr5zn0uDa0+eX5hw1tM?=
 =?us-ascii?Q?3NtIW26j2rPGhQD7t5XkqtBckNQi6qbXZ5r50ymjnQeuOdirhrfEs0hqw0fK?=
 =?us-ascii?Q?51+l45EOanJxYz/E3YViETlZAmfwwQwuxZA7ChiBcFlLHFUjzfDAyUxHGeUF?=
 =?us-ascii?Q?98UX5Lkn7F9WFVYJ0Yjg2/Tj6M3qNYt34oCvEMF/vod3e12DtESZ4V9rumoa?=
 =?us-ascii?Q?B9m2e1S8fGCkeqkZxGrOit4QCes4kuY5Mt7OOPgj3K7+fI3TU9W35QgjLp9U?=
 =?us-ascii?Q?3vsH0ykDMY6rgin6z9jRdd+ksOCg5YaEu67m8TqgRLx0SKU0/Bl1M4CKU12F?=
 =?us-ascii?Q?gBZzkxjUnIvtmD43HKNJTkcgMzAHy38Kho3wW6MnqMTDRIbH5orrfZ+GkTFp?=
 =?us-ascii?Q?U0M7jTGWTUq/yAY8F0sdGr+yQUwWHO6YAHsMh964f0QzBmHZFH5BsIErypCx?=
 =?us-ascii?Q?j+rMuFxX8cvPCQ+tys0V8Tr4k/Z2di5qQhL/URMiXACT1xKe437I+78Lhpi4?=
 =?us-ascii?Q?WFVqihsCwyNbot4rUXY34cyeGtJndf+qb6zYzr/jQ5Br4PDXcV6nqBja/pls?=
 =?us-ascii?Q?rL8K+2KZoOIe1i5ex/Cx3hNuUTkDiu9H0HpHZtksWpr9fteLOFJg4jESCv/c?=
 =?us-ascii?Q?8z904aFKPRjPH1kTT8qKDa1WXoMtFfy3L+kDktEyLZuZ9wRSdF1Y8f+MxRu/?=
 =?us-ascii?Q?ChFvjCH120FEefQ2k8Lz8GOe+hFFAE2xXtmVxhQfqqtdsxWAoAdz4nvqwiT0?=
 =?us-ascii?Q?m6eRwNh5xPsS3CFtEJQvVDn3D2kGluFKlzOMfFY4Rrq3+sOy6pfzaUE10gO6?=
 =?us-ascii?Q?ZYf0vbTBKZ0fPitsmlbOz8E46FYfris2H6COLFz45DTtxEUOT95rnJa3lDJC?=
 =?us-ascii?Q?94tKHKpWHft3VNGzwFz147LI8yls35ySD8KYwuwxJbNEV0f4WsBh6/Ms24e7?=
 =?us-ascii?Q?CT/e/744zocEWkUvJasMOSWv7TQt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cnFj/q3Qvuh8XumcaAcXUTOWKFifnJEtfpoKzp7C34YMukX8AHTk+WthwJqK?=
 =?us-ascii?Q?QeQo4hvRVq9DAMSvQJvRZXRFwUG9+3F1jk826nNsaSGjAJI8K93ltB3n+oa6?=
 =?us-ascii?Q?yECOi456gls42xMsrZigcNk3KYeV3+TB8zaU7BYDXbjTywGm9m5cwXJ0TVPe?=
 =?us-ascii?Q?cNwurZMFOn3DNdVF21eyCkqygIQWMEBzCqpbXrais1Xas1CgdsFur3D7jpTC?=
 =?us-ascii?Q?yNd5N0YD3vxLl2ouiqPRmCaEkWZV97YnCzheRupqKEJfUt1iWFwKjObmZRKL?=
 =?us-ascii?Q?LU8clm5MluErdKeAkjUTxai/ywJ6YIfvATZvgNpuRCP9GUx9RsuH5QiGwqgJ?=
 =?us-ascii?Q?qmdTHmWTzUGVkouuQ18EgxoNz9fpu1/BdJ1Znc4rcHjnVDX8RNqGFnlMQGKR?=
 =?us-ascii?Q?RNcQWtcp8af1uL2VvB8gNx7nyERJZ5G6Wn+S+EiPjmAexyZGigQC+719lK0+?=
 =?us-ascii?Q?Q9b6+mkv2SmnGkGqinAAnICjpT8WFgVSfE60S3ajvR6EAstyxf8H6Od9FU0m?=
 =?us-ascii?Q?ZSaUrs39GmqwUjmTDKiaV2GHWVudEPJbJKXwtx953P5PV2pjlSciJsQm99To?=
 =?us-ascii?Q?vGXx2FCGx+WAEVFYyjLF6/SIjJtEatijFVYKElJ14Zm16qaXWeC/RdlPTPx8?=
 =?us-ascii?Q?uTBH89pG3E3crjz4tkfpI9zfEejgk3YtnteNh8cGbWjmceXmVtVJQ7YbBE7h?=
 =?us-ascii?Q?xZlOMJkp70j0SCel97GGrftMUHlFaum/5P/5M8MSiKAS4fDxJ08jCT/xJpGw?=
 =?us-ascii?Q?7yEIL2e7g1/xSbKtW8BydNZh+hWSKa2uv6OdKwPznF8CzzWNEBTNa5ThvYR5?=
 =?us-ascii?Q?teYBcLXVF877844vrkz5vHv3OK4uGPm95ZClNXxRX6CiCX8JeIH82dGD5IYI?=
 =?us-ascii?Q?ODxUzLfUfG9s5ImU61L2Ix1skiCsz0Cy+bn2Z6JoEBBGxKf6IIbh+EJEtquZ?=
 =?us-ascii?Q?NqOWTsu7cXvs/y3qRS2h4bmGrCUPrOCptpSexQB/JaOlwKxv17e9q7TGEmcd?=
 =?us-ascii?Q?tgWzyPwTxwn/0G2TavST2V+P/vSccY0RYkLGtqUqpsUEpZBk4TqDswcpm0As?=
 =?us-ascii?Q?sLGsTuKsENmbdAiBcE7GZJmbndUWUz6zzEPVhDt2tARG5SUH5LCd/fcEo690?=
 =?us-ascii?Q?qvZCoM0FQHRmwWPYcFBLa89qWC6dpIV0Db4ha0hDjPOXwzextUe//vLVraq9?=
 =?us-ascii?Q?HT9AYkGpfjxrgRS4vxtHhFMz2xWtx5kN+iyjl8O2wQ8v+w+HNqX7kLqslJ7Z?=
 =?us-ascii?Q?HbuD4owZCC/55E5lRfJipE+xwpF80qBFndn+ux48thE1iZsQ+7jgbR8fqJG4?=
 =?us-ascii?Q?D9f23bmvGAvu/OeowcBclvWWW+9qq9yubEZmMMn5a46dWW/DjM7NNnwqKRNF?=
 =?us-ascii?Q?a3pOT4GRKQIkSb3qdXXiTX71lUviuyjmeqRwnAwGb3ugJXTfzrnPRIH51BIX?=
 =?us-ascii?Q?4rusIztNEGS1/NhUyVVZVCG+qxHQbFjwuOCwjfUMn4MdDiVmaWTdKyOGCOVc?=
 =?us-ascii?Q?eMprxpGAjhC/vxZg2qVXmjfgGFjIVrvci3zLhtYXuQLWWKI5iNzKvjnXk6Tb?=
 =?us-ascii?Q?ZffavXhFr+Ct+S/CMBxuJiNoStnLL2FpyaexxmpMl8utLnkSacxnV03Prj21?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b40ff7b-eec0-451a-f62d-08dd5a7b004a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 17:44:09.0967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNySjpolTQ816Xd6p45lqC+ltZmkSZQDrTryWuq12HDVSvNr6vWIQnJyYaslhBFbYNXel+mbiqlU7HEnCPRNXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
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

On Mon, Mar 03, 2025 at 09:26:49AM +0200, Raag Jadav wrote:
> On Mon, Feb 10, 2025 at 03:35:15PM +0530, Raag Jadav wrote:
> > Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> > which will expose fan speed of respective channels in RPM when supported
> > by hardware. With this in place we can monitor fan speed using lm-sensors
> > tool.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> 
> Bump, perhaps we can apply this if no further comments?

Can we really ignore the BAT complain?

It looks a pcode interaction on PVC and hwmon interacts with PCODE.
Should we trigger a rerun of CI to confirm?

<3> [108.256503] xe 0000:aa:00.0: [drm] *ERROR* PCODE Mailbox failed: 1 Illegal Command

> 
> Raag
