Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF9DC282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 14:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA9510E8D0;
	Thu, 13 Mar 2025 14:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgI/v2wh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B556A10E218
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741877564; x=1773413564;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uYxiZ9CSAEdRCviIFbO6unKzCfGSs1Z/0X3SN3hZyOk=;
 b=jgI/v2whARDlkbEUanW+MWPAsar9YABztHmRv0vYApsw8a0y+VSxJxKr
 f8FR80JOEO39ulhOgwGvDR8zOoTX2wNCnen6zuCnKCFaFRhDGG8zkBRmG
 +yIpAdDNw6d/nJLEduUor8R0kPnTJ4d3n0tWloGrH3IJR71Z6dTuY+ROa
 1EW6DyTTBSu03+gee8/B1Gp+S80OV3KrvN15e/bLTwRtYGyq91yuWn51O
 84WvbzUl1KSAQsrMGACtfjtlAv6PCYv2LCLkq3TEle85IlE/canlmkHp7
 I+ohWjmBEMqjvsuwO08VRUDCGm8v209A4f+p64EMne9Gf5HlMIHrO9kmc g==;
X-CSE-ConnectionGUID: 6okYVCSLSpuhtVtVOW7CNg==
X-CSE-MsgGUID: AgAAyQVwTGyLZtCvfT1h8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54374009"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="54374009"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:52:43 -0700
X-CSE-ConnectionGUID: EYZH1JL/R9y1EbsEM8TBFw==
X-CSE-MsgGUID: yEIA79KeQqu03cCJRy6kQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="125869482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:52:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 07:52:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 07:52:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 07:52:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsIExuix3cjjTqgM+raqsnVtx4hjvSJS3KdqusjmpYOwq7KxVWZ5cajH5kFIV58lfb6dI5i828vHbq5Zu7Idfwlye9MUIFU31Qt5QludXFKORT9zvTNtmMaKD0frYSZSG8QGR8vxgABNuPfIbKCXTPbZu/W0XuBmPh8OIrTcoxRxuytwq26n7mkpkU6UoLJWjadoqBE96R/KkeXIA7Tnzs3NkFSk1PcKY46IDZ1wyLVZ7jXR/ng70a2dOC+t7fCWX3IjUow6RaCdmW85GkgS5Dv5lmv8WE/2X5yEUBOPgiqvueuFwy7KrMC3fqblk37U7L/KkHu1J+/DvHKDdmksqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekHxb1gyiu0mC7O5mVhuoFrAkjkHkG1hpcczVCQusyc=;
 b=lQ8rpqJBYN+7OPUfJm01XKCwTX5ZdSKZ1eOJRz2dm6SdbY5EaODeujdCtatb7uvyCdnNRLa1b15wfn84yqOf+iyzMLvDtGD7uSG0p0EYibTUBxKX05LIYM1ksjbAXvxJA2henVoNik4J9/36Aw1HQW1F2p38ZM+PRpi9ChLMq/xCigjWrE2CkJgn7VC6Kspo8ywhDroTbYP6xQXKkTfvi6vFkr1l3DPusvWU/Ww6LHg3yxOWV3hWjpBOycqKEKnDmtWuEL+zCaVoj4ltS08PhD8gYtAMYPcnAVOmGGkw1cJnhd6PF3qLA7SfJKgrnNuNpdUI0A1Vh4xe1K90PGiDFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB8783.namprd11.prod.outlook.com (2603:10b6:8:254::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 14:52:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 14:52:39 +0000
Date: Thu, 13 Mar 2025 10:52:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <Z9LxNEDuyjBFhUuA@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <6d82e345-aef5-4629-b7e2-4b9281d919ea@linux.intel.com>
 <8e2ecdef-8709-4b9a-a79d-21da5429ee24@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e2ecdef-8709-4b9a-a79d-21da5429ee24@intel.com>
X-ClientProxiedBy: MW4PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:303:8d::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c7da7e-4c27-4e61-fb1f-08dd623eb389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?b4Wjt6KZrcmM7/EEsz3Ys/oLchdnOE9BRdsD/dlLxOGnoirTl94kWpK2ll?=
 =?iso-8859-1?Q?Pl99cIbyCpox8KsOh5nEO3fFLnFkh+Xfye+OGfZiMB27/gKoCaE0f7ZNJr?=
 =?iso-8859-1?Q?id0npyc7YCgiv9r4ojhki01Ig8BIYQTwV1WvXWcXj0R3Hf43vx36qro0H2?=
 =?iso-8859-1?Q?4rlav23TOUplHpXsKfpp5AQQnjFj6IM+3QaAij3qvrLfxGkn8qlEpDLBfI?=
 =?iso-8859-1?Q?ufLZP9wtXQIt0KS7vNPku+mQEf7P/V2BWu/o5o9XL9GiAAU+3o3uH1i+KW?=
 =?iso-8859-1?Q?8GFei4DG/6qylrwgAl/cayhHGsWCsNXXyS3+CVOYROs5WNTaGhPAR82IvD?=
 =?iso-8859-1?Q?jw+o+MZYLUHkSWuuhZimkHSgBld4iJo85RfinEwgw6OS8UMxqy7j1OWu97?=
 =?iso-8859-1?Q?52/bd08WeLEZRrbmsNAby2bxYeLmYMRhL7F/sLN0Q/3mcuDsFbw6r/piaL?=
 =?iso-8859-1?Q?9dy+olcU4XQJ9ZiK3h/OSEvNSqbVT5lHy8LHzqnAcBXswGVjRx3GtJpMj3?=
 =?iso-8859-1?Q?VBoe4piPnUAytvqUSDxAQnXLGjgUlpU2ymcxZmUb9Wz3SL9WxvFwA3bId6?=
 =?iso-8859-1?Q?smIFFri/+w7Unx9UhGdxRlRDp4qrswtCDyft67LlAzyc27sBeXsi210Hf8?=
 =?iso-8859-1?Q?isLUnOP+tFfDGP5pEczYxtbNr9lDC/voU0decSBz/U/dSJAfdOBikiVzO9?=
 =?iso-8859-1?Q?bJP6NoQiyjm0MwGBZo4lPSOH0+UBIhwaFYrUpBbj7AY5Zf3uiN61NocSLk?=
 =?iso-8859-1?Q?8VLNecmX5UgYD54Rk1SXglotk01MIZ53G6jCHg3HBblUpSWbzydLiaGqj7?=
 =?iso-8859-1?Q?SKq+HfMNvW8xVSPl1HNdO9MxEZa4wYkolK6SFr1+6rbVRM1jEAN98u4WSU?=
 =?iso-8859-1?Q?6M90DYET3s2dJJL6DM+bYhIo1x0gtFbAFzulZ2vKC/mv4pNVAQCWiHHNVW?=
 =?iso-8859-1?Q?skW1SsifOdmcLZcPg1nNl0jR4mjiHYCz46nBWydB+VkC8Kt4Xil0T8WFki?=
 =?iso-8859-1?Q?AqwmCp1XFPpShr6bPV1hpzMkhUT7j8M5yfhdfEN4PfM6Zb/S7Vjq0nm7Yk?=
 =?iso-8859-1?Q?ygeO6wxsMs0TaEOqhEfQ1v7l8RkyjB/PhA941Cp9Gk4roa57YwMbRNKou/?=
 =?iso-8859-1?Q?01+W8iVxO+geTQh7QRhaN7qd/2ph7xB16Chwz1zfva2/oP4btF7UZUC60U?=
 =?iso-8859-1?Q?UMHf+MCbNOFU+LvPJYTcePetk6XHS/h6Ldvh5D+xNiIcxLaXDPuTp6+8fD?=
 =?iso-8859-1?Q?jPXDG9edwXmS7Z5kBIbr2z9RdHsfmgXdzxeJmj/CjHbgfbGQBkBWvf0a9m?=
 =?iso-8859-1?Q?PtH82VeQyy4qUZap3qWkV6ZGFbkbFZsJijo29CMOUReEjjLzj54rP8VufW?=
 =?iso-8859-1?Q?80o+phwCmZ6zpev/fDxCrIQhI/ywABsrkjUfmgIDbokfpMwpPahpKxTeZl?=
 =?iso-8859-1?Q?bf9AeXMKc9paH3kw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LvX7/z6DU9oSGXIGsh/1O/gNQUvu0hLAfBZ71KFHC4s3rC2Y9XdXhPNkSd?=
 =?iso-8859-1?Q?a99SYx3ifsCvh8vDYUqC0n4P7fAkZ52GF9zKeNXeictdDHZ1pdBWpfXsAg?=
 =?iso-8859-1?Q?mbi2B1tgiWXluFCpJdirJQQVRMjjSr0BUVzIEwDmi0PJCjlZkXPNiEJmn8?=
 =?iso-8859-1?Q?Esb2bAw5hyRqVLy7Kk5r4jbBsPscogs0IcW7HB4fLiHeq02V9satJX1ZKy?=
 =?iso-8859-1?Q?rcxxaSy0nSv2UqH+uyDN4en5/epJhA19DOA0nIjWM2xbRRWAT8MDSfCOn2?=
 =?iso-8859-1?Q?uV3PWLDQOpa7r28NA8arK2Z6kxFgQJBV7xYkTp8N+whN94u0qvjKGPUzja?=
 =?iso-8859-1?Q?Gcj6YX98aabKuXg18aQT7i/V5CCRcmooLsxpQFHRgjE6eGPsXidNmA8srn?=
 =?iso-8859-1?Q?+B8QPZ0ZTZb/FIGFKtWa1ArQ17NnR7WMl/VZJgXTadMEnj6U8cs49mMvqE?=
 =?iso-8859-1?Q?+Y5UlIgZNQiw6H7CoUSXSGUWF7OjSUCJQb9jNJAE/cDimIDT+8jN/Ggm6e?=
 =?iso-8859-1?Q?ezWXcJOotWwIoxgUQx3S/0HjCg6CXOyx8cudNRjtlhpposhPGv8ZYXht4k?=
 =?iso-8859-1?Q?s4SQoADPTQydzmHdCf6g8X4bVQnPHCM5mlNuJB+l4cRjjzEnhznYeSAyBn?=
 =?iso-8859-1?Q?GxJeIrbAMhdjuC45a9x7qi9lXak8MXesr3tzvgz4zotxpPmmI8w577sSvi?=
 =?iso-8859-1?Q?684n4qgge1Bl6yG5KJNUctkHOcWtvbtdOtqwmK8A/7jQSvKABUVlZuOq0D?=
 =?iso-8859-1?Q?BkGA2e1CBQFGSxI2T5dLQ3kwIJeVjBrnMiw5RkIiTr4q5pHVW6dTP/AR/N?=
 =?iso-8859-1?Q?6jD1mlB5gIdtBBMj10FTCpwTKyAxFhBa7FXgkE82RF30I3pjdh9cGgo8VQ?=
 =?iso-8859-1?Q?MkofQ7aLtaT4Hf20z3exHl8XPjDc15E6E/EfGoDVDq6EO6ISFxMi5c2WAM?=
 =?iso-8859-1?Q?h5OX+YNVfc09R7K1Qy8YqctRyn+WH9TSup+F5s7+mRHBYDi80M6LBCTMhc?=
 =?iso-8859-1?Q?6Tk/0jNgv06FaAH2gpcE+jM5lGewBQlwMY4JLMhX/i/3zC3L/JRof06xKT?=
 =?iso-8859-1?Q?mX0aIaebsPdCMZynNIqf0CSyE/wMXz5xFvluEqkOuj7czCcz5PiYMop4cC?=
 =?iso-8859-1?Q?UQmMZm9w9FMyj7+wiWtXOHD3w4NoWVW5ALgcU9gGv2ys/kYRoRK9QEb7Qq?=
 =?iso-8859-1?Q?DyBxn9h5S7M2QVl8IbCEu/oId+FzJNmn0mWlfFXzQhz3mQOGRbBTUq0n8z?=
 =?iso-8859-1?Q?2bG0caKwfdIakKAhgfT8r1ZwniffH/U2n4SRbCZ+Kfm6HQ0Xb10lst8HQi?=
 =?iso-8859-1?Q?KyujFSIwuQjQtnD4qiGk6MPdSAz9zLsS1EUQ5KjgVXgBRsHuKY8WIjcZ4b?=
 =?iso-8859-1?Q?13m4Wkq+oiyoM4JwS9Y7pjcQl+5gZsWy3qM8v+s4k+v3pg33uw6teGCPL6?=
 =?iso-8859-1?Q?7tNCZWtdbAB0+B1s3ycqIX0GAnkdq4RwywT7OAKA6VRAKNdf4EptFMoxn5?=
 =?iso-8859-1?Q?u6O4d0tuB1olVrYkECa2Ax2ktatAnCCq96e/X1byZXeYwJkh5YLaCEXcX0?=
 =?iso-8859-1?Q?TQqxReEdZcpG7K59o+YucDVTnWmOA7e/5iWuU5njh20BG9VurTYT/oyrzc?=
 =?iso-8859-1?Q?KnGc+44wCa2zULH7TRe3G+r/Ik+1+dJBaRJJLOHNobkboYMggUgmbn+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c7da7e-4c27-4e61-fb1f-08dd623eb389
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 14:52:39.8686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oq5rjYiUWqh/cx9fcP/ItmABYc51QD/p2qWwYmC7huMuR87gZWy2ZjPBQHovxxnOFN7uhnc8TOgk4ceSyJ5c0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8783
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

On Thu, Mar 13, 2025 at 11:48:41AM +0530, Riana Tauro wrote:
> Hi Aravind
> 
> On 3/10/2025 12:44 PM, Aravind Iddamsetty wrote:
> > 
> > On 07-03-2025 19:54, Riana Tauro wrote:
> > 
> > Hi Riana,
> > 
> > I do think we can achieve the same functionality with module param and
> > we needn't reload the driver
> > if we are doing unbind, Since the driver will be loaded event after
> > unbind we can modify the module param
> 
> tried this.  We can modify the module param using sysfs and bind similar to
> configfs.
> 
> If we want to configure any other attributes or move existing module params
> to device specific then adding configfs seems better.
> 
> @Rodrigo thoughts?

Yeap, if we make the param write-able and document that it is only checked
at probe we could indeed use the flow

echo <bdf> > /sys/../xe/unbind
echo <bdf> > /sys/../xe/param/survivability_mode
echo <bdf> > /sys/../xe/bind

and accomplish the same.

on the good side:

So, this is the future prof case. Because if we start seeing cases where
the device fails at boot without the FW request for the survivability mode
we might be forced to have a parameter anyway. :/

on the bad side:

But we were actually aiming to reduce the parameters that we have
because that was getting indiscriminately used and even recommended by some
distros' doc and wikis.

Another problem with the write-able param is that people might expect to

echo <bdf> > /sys/../xe/param/survivability_mode

and immediately get the device in the survivability_mode for that device.
Then we are going to get questions and bug reports that this is not working.

But well, perhaps documenting the flow properly in the param description
might solve this concern.

Lucas, Thomas, thoughts?

> 
> Thanks
> Riana
> > and once we bind the device back it can check if the BDF belongs to this
> > driver instance and configure the mode accordingly.
> > 
> > Thanks,
> > Aravind.
> > > Registers a configfs subsystem called 'xe' to userspace. The user can
> > > use this to modify exposed attributes.
> > > 
> > > Add survivability mode attribute (config/xe/survivability_mode) to the
> > > subsystem to allow the user to specify the card that should enter
> > > survivability mode.
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Makefile      |  1 +
> > >   drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
> > >   drivers/gpu/drm/xe/xe_module.c   |  5 ++
> > >   drivers/gpu/drm/xe/xe_module.h   |  1 +
> > >   5 files changed, 114 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 9699b08585f7..3f8c87292cee 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > >   xe-y += xe_bb.o \
> > >   	xe_bo.o \
> > >   	xe_bo_evict.o \
> > > +	xe_configfs.o \
> > >   	xe_devcoredump.o \
> > >   	xe_device.o \
> > >   	xe_device_sysfs.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > > new file mode 100644
> > > index 000000000000..8c5f248e466d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > @@ -0,0 +1,95 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/configfs.h>
> > > +#include <linux/init.h>
> > > +#include <linux/module.h>
> > > +
> > > +#include "xe_configfs.h"
> > > +#include "xe_module.h"
> > > +
> > > +/**
> > > + * DOC: Xe Configfs
> > > + *
> > > + * XE KMD registers a configfs subsystem called 'xe'to userspace that allows users to modify
> > > + * the exposed attributes.
> > > + *
> > > + * Attributes:
> > > + *
> > > + * config/xe/survivability_mode : Write only attribute that allows user to specify the PCI address
> > > + *				  of the card that has to enter survivability mode
> > > + */
> > > +
> > > +void xe_configfs_clear_survivability_mode(void)
> > > +{
> > > +	kfree(xe_modparam.survivability_mode);
> > > +	xe_modparam.survivability_mode = NULL;
> > > +}
> > > +
> > > +static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
> > > +{
> > > +	char *survivability_mode;
> > > +	int ret;
> > > +	unsigned int domain, bus, slot, function;
> > > +
> > > +	ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
> > > +	if (ret != 4)
> > > +		return -EINVAL;
> > > +
> > > +	survivability_mode = kstrdup(page, GFP_KERNEL);
> > > +	if (!survivability_mode)
> > > +		return -ENOMEM;
> > > +
> > > +	xe_configfs_clear_survivability_mode();
> > > +	xe_modparam.survivability_mode = survivability_mode;
> > > +
> > > +	return len;
> > > +}
> > > +
> > > +CONFIGFS_ATTR_WO(, survivability_mode);
> > > +
> > > +static struct configfs_attribute *xe_configfs_attrs[] = {
> > > +	&attr_survivability_mode,
> > > +	NULL,
> > > +};
> > > +
> > > +static const struct config_item_type xe_config_type = {
> > > +	.ct_attrs	= xe_configfs_attrs,
> > > +	.ct_owner	= THIS_MODULE,
> > > +};
> > > +
> > > +static struct configfs_subsystem xe_config_subsys = {
> > > +	.su_group = {
> > > +		.cg_item = {
> > > +			.ci_namebuf = "xe",
> > > +			.ci_type = &xe_config_type,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +int __init xe_configfs_init(void)
> > > +{
> > > +	int ret;
> > > +
> > > +	config_group_init(&xe_config_subsys.su_group);
> > > +	mutex_init(&xe_config_subsys.su_mutex);
> > > +	ret = configfs_register_subsystem(&xe_config_subsys);
> > > +	if (ret) {
> > > +		pr_err("Error %d while registering subsystem %s\n",
> > > +		       ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
> > > +		mutex_destroy(&xe_config_subsys.su_mutex);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void __exit xe_configfs_exit(void)
> > > +{
> > > +	xe_configfs_clear_survivability_mode();
> > > +	configfs_unregister_subsystem(&xe_config_subsys);
> > > +	mutex_destroy(&xe_config_subsys.su_mutex);
> > > +}
> > > +
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > > new file mode 100644
> > > index 000000000000..491629a2ca53
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > @@ -0,0 +1,12 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +#ifndef _XE_CONFIGFS_H_
> > > +#define _XE_CONFIGFS_H_
> > > +
> > > +int xe_configfs_init(void);
> > > +void xe_configfs_exit(void);
> > > +void xe_configfs_clear_survivability_mode(void);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > index 475acdba2b55..15b3cf22193c 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -11,6 +11,7 @@
> > >   #include <drm/drm_module.h>
> > >   #include "xe_drv.h"
> > > +#include "xe_configfs.h"
> > >   #include "xe_hw_fence.h"
> > >   #include "xe_pci.h"
> > >   #include "xe_pm.h"
> > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
> > >   	{
> > >   		.init = xe_check_nomodeset,
> > >   	},
> > > +	{
> > > +		.init = xe_configfs_init,
> > > +		.exit = xe_configfs_exit,
> > > +	},
> > >   	{
> > >   		.init = xe_hw_fence_module_init,
> > >   		.exit = xe_hw_fence_module_exit,
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > index 84339e509c80..c238dbee6bc7 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -24,6 +24,7 @@ struct xe_modparam {
> > >   #endif
> > >   	int wedged_mode;
> > >   	u32 svm_notifier_size;
> > > +	char *survivability_mode;
> > >   };
> > >   extern struct xe_modparam xe_modparam;
> 
