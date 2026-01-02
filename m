Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E30FA3751
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jan 2026 23:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AD810E2EE;
	Fri,  2 Jan 2026 23:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFJHSNWq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572A810E2E4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jan 2026 23:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767395714; x=1798931714;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5qoiFHLg87O+DIWZeGTvYdWnGTrzbBB1u3TiQBn+AFU=;
 b=gFJHSNWqy93eq9Msbnc4Bq8oqKxHz7w0TVkQXWoo4qXffs4gLgdXJEdi
 JVa0IDfsithv0/ALC6iHw6B/nC1WK2yDck4q0qdxQQBty/FgYXSj3H3Y1
 jaPgiMkKZRpCg1UcveM3BsHq+t6cdAIzQSqk/gAYyGwa21V+J2h6+Eu4O
 ehARNC0IB4oPOAvVWuSkWlaQSohbbXw6rPXhx2ClypouHd4pMRi5eXwmS
 QS3sfcAC63i65fJHUfSlLyGTQwonJSSyJBglWQhvumuOz+sLGC7jjpEPE
 qXLDIDcVVljStmo8teHpKwj2Ap5fRh13+Nueli9m1Gl94N2+vdpQ019kv Q==;
X-CSE-ConnectionGUID: IJRb3vOGS1+Z+Kq9MYgaEw==
X-CSE-MsgGUID: DqudP5LoQDaWHF1hdZnQ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="91533882"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="91533882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 15:15:13 -0800
X-CSE-ConnectionGUID: 68buxxLLSn64sx4qKgTQcw==
X-CSE-MsgGUID: EQnKAELJTbOJOi7m/UIyWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="201532471"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 15:15:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 15:15:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 2 Jan 2026 15:15:12 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 15:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naU3SUcSBEZiA/PW8zSrgXJfTlxTGob95wQWQxN5AA84s42BytQgsxZgBfJ/9eJnWL4tVig1U6sWugT+Cv4+21urDFCgjBnZ050SjnmEYiK1duBApUjNh3ue5OVBhOI8JZVF0ixHDDPhfOA9kBVKMZvzcE3EV8plzywIh2SJzSN3e4WuegCS5QhgPsdoiLzcq5Pxo6oFIXZp+bl85nfr54U6/cumutQ4kF6IYMAFuOMRLoq3Td1UuNljasx3oWYQMmmiKBsEiVS96BgSIICWHNXx9CqQ2scN7SBsN58eW34Zd6Et+lQ08zc9Fv/Or4EgrlM+YbfA49SxmIAvIGMn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKV2B03u9oGLBaDI6n9MCrEwtj9hcIO/dU2ZL8Q5yOc=;
 b=XRguyNitE1UrjkztKXGmrNImLkfa7BUIv8lcXMN6xW04mOyleHP4maiTbIMit72U4BPgpaW/2Tn8hMknA90B01SNb+SbMMXWLi1JwAG62oGJk2PMgp8YjA8GLc1E7D9kSii+i/KlBi2ZQFV4q8hFfncDO2/LhsAfmwv3SsvvrgItMH25onUViOBrh5J1dlCDnbS1n2S69G2zENo2cGygUjK4tLsI5PX9q6fG0CBgU6Lcz7bU7IiUkeh6fcM9PAicXSSXw9y/YRSixDiHK1g2BQQC6iLUbWVFP8xXmgAynElEazW9frQZmrpsGjqNvT3K2jL2W3/p/rkOWrPjuo29fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF263E38237.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 23:15:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 2 Jan 2026
 23:15:11 +0000
Date: Fri, 2 Jan 2026 15:15:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
Message-ID: <aVhRfJqsBeF72Xp9@lstrano-desk.jf.intel.com>
References: <20260102165450.561614-3-anoop.c.vijay@intel.com>
 <20260102165450.561614-4-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102165450.561614-4-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:303:b6::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF263E38237:EE_
X-MS-Office365-Filtering-Correlation-Id: fca78dc5-a397-4e47-c830-08de4a54c6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wcBNdaV6ZCR9OfrkEJL4pkTntMDzwktKjdW8vRasu7kRDYZc6jg2ZPCbLb?=
 =?iso-8859-1?Q?7+WwxSrE4Z6R5jNe/az84K2xbLj+tePb7s3NyF6tNmGBuml2hTcM/jr+90?=
 =?iso-8859-1?Q?AxlPyiZsOcZuvsRacQJ9lKOBlVgrLFlPNVaFiDB2dPK74s4Dh/TJP9kmfS?=
 =?iso-8859-1?Q?cC99g/5aHia+ZmW6CQRW6dryg+/qJ6FS8m3OQITPXV6c43U0gNiqrQu6nF?=
 =?iso-8859-1?Q?TOItLoYZUjH5XeeyaYMFGQlJ1G7gC5Vhvf1Tc1KtDUkipVJErFQ57rDTa0?=
 =?iso-8859-1?Q?gGmhBYtnWxNHRkHiMxx3+APYoZ2eDvdvW0TQ/xSUVVhJleu01U8GxRvz2v?=
 =?iso-8859-1?Q?sRvCK+RbK47ibydxb9TSFP9b9dZfSjw9XATnq+Ay1cUGTV6owtVImB/JIP?=
 =?iso-8859-1?Q?NStNNSLnkuD31CxlHiFK1oOekaij+bG8oxWt3cLN9/i94pBZTObD4FUocD?=
 =?iso-8859-1?Q?SNdI/OH04QzWvXBdh5r4oIOhuFOzzb4VoLIw8CxgL/kWv+EZa08/OXTZI2?=
 =?iso-8859-1?Q?MyTwxql8FEPeY3K/Xqg3yr84qOYoVZ6DgN4MhKZ8H9xH83sDT9iZqt0ucc?=
 =?iso-8859-1?Q?RrRXerTi1vUvDLRR6LbCNULDOhSBtvLUAzlTL3JSMJyEgPtCtNFyDCVhQR?=
 =?iso-8859-1?Q?kWmpudtMlMtAEGKWo8QOuhsCXxALG13dGVrxMOT4eu1KouBuR1FS8zn+qw?=
 =?iso-8859-1?Q?uWNH9prxbsnzRAc+oQsFBBSIFSusulWfpKjj+dLkygFftW4PHq8VWLuC9w?=
 =?iso-8859-1?Q?JtrV6nC2ZFUPKIe7Zk72w6QQ9Q4trE8dvHPqZzH+TqdUzpTNIgAEsFa3pj?=
 =?iso-8859-1?Q?wPzrxh9Wq5JjdF8aew79IwIuIWWHGmCwzRwYRQQP+3POAwplnrP5Hmpf4o?=
 =?iso-8859-1?Q?At6kGbfQJqmBd9bIWX6/6A6IX59z11pGegUdB460IUjvdRCyQfoW4i5xt5?=
 =?iso-8859-1?Q?tlGlw0i3kNe67NGBoFIKNSBhae6QnZgLFgGcDZCn9tWVWJOIyKtjCIfGe+?=
 =?iso-8859-1?Q?umM+OJHDD8IKAnkDm/Eb4X0tVv0mRhexGOuSlmkjVqKLubWuXfFgriN/Mx?=
 =?iso-8859-1?Q?i/sl1yVZ3Gx8Gx/vQ1FZLRyrFB6HU6D4CUAFdiEWgxdl38Kre+hr1xORb7?=
 =?iso-8859-1?Q?AVdR97Q9FKamd2Oysf16dMdRK0OlZE67d/wGzsUQGVyMvTDKOA+pQCP4w7?=
 =?iso-8859-1?Q?08Uh8oVEbitSY77psy4xNhENMltSfr6zhy1dfB8BycayBtv+iVqvJfJFuV?=
 =?iso-8859-1?Q?y+y6Ek+DI/4tfexnW21aCTNAXqBHEh+dnwlgzYFz57b3eyjgnMKjomNyKg?=
 =?iso-8859-1?Q?5u7loCaIC8y+8P6z/7/eIAZxQ4+buHpjqy1ESo1GKNaXeJ0dsfAysNO80n?=
 =?iso-8859-1?Q?GReIqJXhJlfMRjbTNuB+PPxpzog5mcVMGWBiFxWZbC7LrQGu/Mk4R8QDAf?=
 =?iso-8859-1?Q?BqYlaRjQMjIj0D6C7kJnvz99/I/1/AtMutcKNouMYEOFsrNgiR9/9aOqCu?=
 =?iso-8859-1?Q?PEuOrAMdnkqtNh8vUoDSAB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?enlQrqSMCB385o11ksHcm/UMgMmztRQ97IC4EIFWnGIsCbzGSeB+zuTB9X?=
 =?iso-8859-1?Q?vIEJgGGivaIZ+16CLbV3gkiJ6ZX4Rj7M0O5KvRsHS5rEurSjBE+weRe7lz?=
 =?iso-8859-1?Q?FrgZ+0TtFO0n3DXLFHCQGNhnEh37fcKCRik43TadUnPDT9dx6AgslxbQVQ?=
 =?iso-8859-1?Q?38YODEi09FMrHO2FG87cPvPAI5tj2Z7Cs1YEzmP6uy3QDsbyuW8XkDgWwV?=
 =?iso-8859-1?Q?t9F4QU0RqTnvcsHawwLnu5A5Kv7TRvaFwG2pvrzGiYzafaRElMFQa4JGiv?=
 =?iso-8859-1?Q?TCStFkVspinXmm6zNwMC1Apkb0n2uM/FDBVJUghyp06R122TJgOYlu1jHm?=
 =?iso-8859-1?Q?OMEdXW1vAeO/PhZ/l9aYymZWnzXrXoqqp+8Rg+WdPO+NlWJK8fiL0KkFPL?=
 =?iso-8859-1?Q?wZjVyflbahS/pR4mYAdVOKPcf1lBubgeqfEqVeKYMtmQN2OzwFSJCeLv0t?=
 =?iso-8859-1?Q?kJ7/sbXYcD5bnmmDYipTnxVdZr38aVTK26GjVXboisR8TGKX9HV/rZtoHJ?=
 =?iso-8859-1?Q?tmr3iGeI8H57p04cP8t3JQLXk3m5rZ484K/wAJnVyqitRR/Zjw8Fu2C8Vv?=
 =?iso-8859-1?Q?kPLLvd2Yl4nw2zifumG9CmdyMo3JyeTffDf/JnlIJWd8kdnB3cYa1WcJq8?=
 =?iso-8859-1?Q?xw6JPQQqmmee+rfZWM7HT7Dhm3bs6pPq6JDardChPf2El1z06/PC1dF+da?=
 =?iso-8859-1?Q?X20B0hkU181OdXE09KYSswAmbX3vN8p1WuTgHzupGaiLRC/v+4a83uRxFC?=
 =?iso-8859-1?Q?wDCctL2ePNg60bTxNnnYzZWtRDRgIDmBQQlnv3R9E7TYVCP4cWYS+5lplY?=
 =?iso-8859-1?Q?/xuXe0r5A2Oxql9aUFgyCuPbZCkYcQqyG1tscP3I+v2lutWKEz7tS90Ogh?=
 =?iso-8859-1?Q?L3E3ASQHFeOOM2vX7TlMW6q51gjvGqhCfcxiJ2HV7+0FN2ah/N720CmZvY?=
 =?iso-8859-1?Q?4mT1DYgzCDzJeUe2INP0q3UZhj/bFnVObXrzOM3PCJStadvRxSuJF1uy2P?=
 =?iso-8859-1?Q?23xwY1szo4vunmbjrHZxhFuKTqQwc71NS0EOThWNxceeBMlDMP3A8Jnmpb?=
 =?iso-8859-1?Q?VPZvZmpoe7jv7llCpiyHcZlaVUJFqvuaeJc49vXF+CdtFB5mIvPF9fhCTH?=
 =?iso-8859-1?Q?PdqZP85tCeAfy9pJPGfl2YuMVjc9rTjT4hWR7e0WtDU/49LHg938Jtspz0?=
 =?iso-8859-1?Q?jSIZ11mvn3UQTd1EN8xyeOb7dN0jpzUTQC5JY/zN1GYRPY5gE+yCG232PC?=
 =?iso-8859-1?Q?XT1N94qoh7dvaAdb9kUntCRvMQxUytjGpG11vxZFZcEwWUG2957ugEvZg2?=
 =?iso-8859-1?Q?jFzjlFDnid3ysQLQpmBFbh+l3sPu0NJWhy8BTXjM2Sr5BMRuBzOoc1/8KA?=
 =?iso-8859-1?Q?BC+doDXVdXWKTFaE09/bC2gX9qgH7smsm6WchZSPNNj95wVBG10i9uSRps?=
 =?iso-8859-1?Q?YPO0j7VmIDhcs1UTO8C4P+i1Rem3eodlG+KNzhtjwwKxIrMXbslO9esKrd?=
 =?iso-8859-1?Q?xLYYncNFmUKa90Hk9fXsWtFqaOTk/GC82YRi3wYxZRJZaWS/sgXOgMjrmX?=
 =?iso-8859-1?Q?NqncQDOZqcHSS6VjPR/08i7O868iO45R5Zgb8g1PIU9ldrl1HWcQTkvLq8?=
 =?iso-8859-1?Q?r3ifcYJQyJFvw8Devg/Q6MfnssOT1QLi+L4/VTpBp3unUXqgrlHmTRTu36?=
 =?iso-8859-1?Q?SYlPsgPL1bv4l4QCgJLQgyVuyTI7QmCvhUyzguaHAEx/xraEPqfhjXV60I?=
 =?iso-8859-1?Q?WzIkbog1+KMuO0zwanoX1ckyrTVsC4nIOARTZU7lOG1bNRyEzyv3/Uwys/?=
 =?iso-8859-1?Q?KLVANG8p/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fca78dc5-a397-4e47-c830-08de4a54c6e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 23:15:10.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh3tF5i/AUpopaf/k9Xs0rcu2RGXPgAdVBHblNTEmq/pGk5pVgjoBFPfZEgAHjeFPz3ylLZ9FtnXYf04gaj6qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF263E38237
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

On Fri, Jan 02, 2026 at 08:54:50AM -0800, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add a new system controller (sysctrl) component for Intel Xe3p dGPU
> platforms.
> 
> This component provides the foundational infrastructure for communication
> with the System Controller firmware using MKHI protocol over a mailbox
> interface.
> 
> Key features introduced:
>  - Detection and initialization of System Controller interface on Xe3p
>    dGPU platforms
>  - Mailbox communication with System Controller firmware
>  - Fragmented message transfer for large command payloads
> 
> This implementation establishes the base for future System Controller
> feature enablement and firmware command handling.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Drive by comment - this patch needs to be split into a series of smaller 
patches for review. A single large patch is highly unlikely to get
reviewed or pulled by a maintainer of Xe or DRM.

Off the top of my head, a sample split could be:

- Define xe_sysctrl_regs.h
- Add has_sysctrl to xe_device / xe_pci 
- Implement xe_sysctrl_mailbox
- Implement xe_sysctrl
- Call xe_sysctrl_init during device probe.  

Matt

> ---
>  drivers/gpu/drm/xe/Makefile               |   2 +
>  drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
>  drivers/gpu/drm/xe/xe_device.c            |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h      |   6 +
>  drivers/gpu/drm/xe/xe_pci.c               |   2 +
>  drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
>  drivers/gpu/drm/xe/xe_sysctrl.c           |  62 ++++
>  drivers/gpu/drm/xe/xe_sysctrl.h           |  18 +
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 409 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  77 ++++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h     |  23 ++
>  11 files changed, 649 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 2b20c79d7ec9..947fbcac65d5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -121,6 +121,8 @@ xe-y += xe_bb.o \
>  	xe_step.o \
>  	xe_survivability_mode.o \
>  	xe_sync.o \
> +	xe_sysctrl.o \
> +	xe_sysctrl_mailbox.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
>  	xe_tlb_inval.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> new file mode 100644
> index 000000000000..6627a9c32c4f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_REGS_H_
> +#define _XE_SYSCTRL_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SYSCTRL_BASE_OFFSET		0xDB000
> +#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
> +#define SYSCTRL_MAILBOX_INDEX		0x03
> +#define SC_BAR_LENGTH			0x1000
> +
> +#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
> +#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
> +#define   SC_MB_CTRL_IRQ		REG_BIT(30)
> +#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
> +#define   SC_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
> +#define   SC_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
> +#define   SC_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
> +#define   SC_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
> +
> +#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
> +#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
> +#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
> +#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
> +
> +#define MKHI_FRAME_PHASE		REG_BIT(24)
> +#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
> +#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
> +#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
> +
> +#define SC_MB_FRAME_SIZE		16
> +#define SC_MB_MAX_FRAMES		64
> +#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
> +#define SC_MKHI_COMMAND			5
> +
> +#define SC_MB_DEFAULT_TIMEOUT_MS	500
> +#define SC_MB_RETRY_TIMEOUT_MS		20
> +#define SC_MB_POLL_INTERVAL_US		100
> +
> +#endif /* _XE_SYSCTRL_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e101d290b2a6..805d48dd954d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -66,6 +66,7 @@
>  #include "xe_survivability_mode.h"
>  #include "xe_sriov.h"
>  #include "xe_svm.h"
> +#include "xe_sysctrl.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -1032,6 +1033,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	err = xe_sysctrl_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	err = xe_device_sysfs_init(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a85be9ba175e..6295b2c35d4a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -29,6 +29,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_sysctrl_types.h"
>  #include "xe_tile_sriov_vf_types.h"
>  #include "xe_validation.h"
>  
> @@ -340,6 +341,8 @@ struct xe_device {
>  		u8 has_soc_remapper_telem:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
> +		/** @info.has_sysctrl: Supports System Controller */
> +		u8 has_sysctrl:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> @@ -606,6 +609,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @sc: System Controller */
> +	struct xe_sysctrl sc;
> +
>  	/** @nvm: discrete graphics non-volatile memory */
>  	struct intel_dg_nvm_dev *nvm;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 91e0553a8163..b6dc3030b673 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_soc_remapper_sysctrl = true,
>  	.has_soc_remapper_telem = true,
>  	.has_sriov = true,
> +	.has_sysctrl = true,
>  	.max_gt_per_tile = 2,
>  	.require_force_probe = true,
>  	.va_bits = 57,
> @@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
> +	xe->info.has_sysctrl = desc->has_sysctrl;
>  	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 5f20f56571d1..53e44a32883d 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -56,6 +56,7 @@ struct xe_device_desc {
>  	u8 has_soc_remapper_sysctrl:1;
>  	u8 has_soc_remapper_telem:1;
>  	u8 has_sriov:1;
> +	u8 has_sysctrl:1;
>  	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> new file mode 100644
> index 000000000000..e0e7b0ecf2bf
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_printk.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_types.h"
> +
> +static void xe_sysctrl_fini(void *arg)
> +{
> +	struct xe_sysctrl *sc = arg;
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	if (!xe->soc_remapper.set_sysctrl_region)
> +		return;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, 0);
> +}
> +
> +/**
> + * xe_sysctrl_init - Initialize SC subsystem
> + * @xe: xe device instance
> + *
> + * Entry point for SC initialization, called from xe_device_probe().
> + * This function checks platform support and initializes the system controller.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sysctrl_init(struct xe_device *xe)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, sc);
> +	if (ret)
> +		return ret;
> +
> +	if (!xe->soc_remapper.set_sysctrl_region)
> +		return -ENODEV;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_init(sc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> new file mode 100644
> index 000000000000..fe90d6577d54
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_H_
> +#define _XE_SYSCTRL_H_
> +
> +struct xe_device;
> +
> +static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> +{
> +	return container_of(sc, struct xe_device, sc);
> +}
> +
> +int xe_sysctrl_init(struct xe_device *xe);
> +
> +#endif /* _XE_SYSCTRL_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> new file mode 100644
> index 000000000000..940ea535da2e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_types.h"
> +
> +static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> +					      unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	int ret;
> +
> +	ret = xe_mmio_wait32_not(mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				 timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> +					    unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	int ret;
> +
> +	ret = xe_mmio_wait32(mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +			     timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
> +					  size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> +	};
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	memcpy(val, frame, len);
> +
> +	for (i = 0; i < dw; i++)
> +		xe_mmio_write32(mmio, regs[i], val[i]);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
> +					 size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> +	};
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	for (i = 0; i < dw; i++)
> +		val[i] = xe_mmio_read32(mmio, regs[i]);
> +
> +	memcpy(frame, val, len);
> +
> +	return 0;
> +}
> +
> +static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	xe_mmio_rmw32(mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT, 0);
> +}
> +
> +static int xe_sysctrl_mailbox_prepare_command(struct xe_sysctrl *sc,
> +					      u8 group_id, u8 command,
> +					      const void *data_in, size_t data_in_len,
> +					      u8 **mbox_cmd, size_t *cmd_size)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t size;
> +	u8 *buffer;
> +
> +	size = sizeof(*mkhi_hdr) + data_in_len;
> +	if (size > SC_MB_MAX_MESSAGE_SIZE) {
> +		xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
> +		return -EINVAL;
> +	}
> +
> +	buffer = kmalloc(size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
> +	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
> +				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
> +				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
> +
> +	if (data_in && data_in_len)
> +		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
> +
> +	*mbox_cmd = buffer;
> +	*cmd_size = size;
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc, const u8 *mbox_cmd,
> +					  size_t cmd_size, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t bytes_sent, frame_size;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Mailbox busy\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +	bytes_sent = 0;
> +
> +	for (frame = 0; frame < total_frames; frame++) {
> +		frame_size = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
> +
> +		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> +			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> +			sc->phase_bit ^= 1;
> +			return -EIO;
> +		}
> +
> +		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
> +			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
> +			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
> +			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SC_MKHI_COMMAND) |
> +			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
> +
> +		xe_mmio_write32(mmio, SC_MB_CTRL, ctrl_reg);
> +
> +		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += frame_size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
> +						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> +						  void *out,
> +						  size_t frame_size,
> +						  size_t *payload_bytes)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 frame_data[4];
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
> +	size_t hdr_size = sizeof(*resp_hdr);
> +	size_t payload_size;
> +	int ret;
> +
> +	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
> +
> +	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
> +	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
> +	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
> +		xe_err(xe, "SC: Response header mismatch\n");
> +		return -EPROTO;
> +	}
> +
> +	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
> +		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
> +		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
> +		return -EIO;
> +	}
> +
> +	payload_size = frame_size - hdr_size;
> +	if (payload_size > 0)
> +		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
> +
> +	*payload_bytes = payload_size;
> +
> +	xe_sysctrl_mailbox_clear_response(sc);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
> +					    void *out, size_t frame_size,
> +					    unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	int ret;
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_clear_response(sc);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
> +					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> +					     void *data_out, size_t data_out_len,
> +					     size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t hdr_size = sizeof(*mkhi_hdr);
> +	u8 *out = data_out;
> +	size_t received = 0;
> +	size_t frame_size;
> +	int ret = 0;
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
> +	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
> +
> +	if (total_frames == 1)
> +		frame_size = min(hdr_size + data_out_len, (size_t)SC_MB_FRAME_SIZE);
> +	else
> +		frame_size = SC_MB_FRAME_SIZE;
> +
> +	ret = xe_sysctrl_mailbox_process_first_frame(sc, req, out, frame_size, &received);
> +	if (ret)
> +		return ret;
> +
> +	out += received;
> +
> +	for (frame = 1; frame < total_frames; frame++) {
> +		size_t remaining = data_out_len - received;
> +
> +		frame_size = min_t(size_t, remaining, SC_MB_FRAME_SIZE);
> +
> +		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
> +		if (ret)
> +			break;
> +
> +		received += frame_size;
> +		out += frame_size;
> +	}
> +
> +	*rdata_len = received;
> +
> +	return ret;
> +}
> +
> +static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
> +					   const u8 *mbox_cmd, size_t cmd_size,
> +					   void *data_out, size_t data_out_len,
> +					   size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t received;
> +	int ret;
> +
> +	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out || !rdata_len)
> +		return 0;
> +
> +	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
> +
> +	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
> +						&received, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	*rdata_len = received;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sysctrl_send_command - Send command to System Controller via mailbox
> + * @handle: XE device handle
> + * @cmd_buffer: Pointer to xe_sysctrl_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using MKHI protocol. Handles
> + * command preparation, fragmentation, transmission, and response reception.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
> +{
> +	struct xe_device *xe = handle;
> +	struct xe_sysctrl *sc = &xe->sc;
> +	struct xe_sysctrl_mailbox_command *cmd = cmd_buffer;
> +	u8 *mbox_cmd = NULL;
> +	size_t cmd_size = 0;
> +	u8 group_id, command_code;
> +	int ret = 0;
> +
> +	if (!xe) {
> +		pr_err("sysctrl: Invalid device handle\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!cmd) {
> +		xe_err(xe, "sysctrl: Invalid command buffer\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!xe->info.has_sysctrl)
> +		return -ENODEV;
> +
> +	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
> +	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
> +
> +	if (!cmd->data_in && cmd->data_in_len) {
> +		xe_err(xe, "sysctrl: Invalid input parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!cmd->data_out && cmd->data_out_len) {
> +		xe_err(xe, "sysctrl: Invalid output parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	might_sleep();
> +
> +	ret = xe_sysctrl_mailbox_prepare_command(sc, group_id, command_code,
> +						 cmd->data_in, cmd->data_in_len,
> +						 &mbox_cmd, &cmd_size);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
> +		return ret;
> +	}
> +
> +	guard(xe_pm_runtime)(xe);
> +
> +	guard(mutex)(&sc->cmd_lock);
> +
> +	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
> +					      cmd->data_out, cmd->data_out_len, rdata_len,
> +					      SC_MB_DEFAULT_TIMEOUT_MS);
> +	if (ret)
> +		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
> +
> +	kfree(mbox_cmd);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sysctrl_mailbox_init - Initialize the System Controller mailbox state
> + * @sc: System controller structure
> + */
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 ctrl_reg;
> +
> +	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
> +	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
> +
> +	xe_mmio_rmw32(mmio, SC_MB_CTRL, MKHI_FRAME_PHASE, 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> new file mode 100644
> index 000000000000..3e472418ebd0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __XE_SYSCTRL_MAILBOX_H__
> +#define __XE_SYSCTRL_MAILBOX_H__
> +
> +#include <linux/bitfield.h>
> +#include <linux/types.h>
> +
> +struct xe_sysctrl;
> +
> +#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
> +#define MKHI_HDR_IS_RESPONSE		BIT(15)
> +#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
> +#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
> +
> +struct xe_sysctrl_mailbox_mkhi_msg_hdr {
> +	__le32 data;
> +} __packed;
> +
> +#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
> +#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
> +#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
> +
> +struct xe_sysctrl_mailbox_app_msg_hdr {
> +	__le32 data;
> +} __packed;
> +
> +#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> +	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> +	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
> +	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
> +	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
> +	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +
> +/**
> + * struct xe_sysctrl_mailbox_command - System Controller mailbox command structure
> + */
> +struct xe_sysctrl_mailbox_command {
> +	/** @header: Application message header containing command information */
> +	struct xe_sysctrl_mailbox_app_msg_hdr header;
> +
> +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> +	void *data_in;
> +
> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> +	size_t data_in_len;
> +
> +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> +	void *data_out;
> +
> +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> +	size_t data_out_len;
> +};
> +
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
> +
> +#endif /* __XE_SYSCTRL_MAILBOX_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> new file mode 100644
> index 000000000000..88a34967688b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_TYPES_H_
> +#define _XE_SYSCTRL_TYPES_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_sysctrl - System Controller driver context
> + */
> +struct xe_sysctrl {
> +	/** @cmd_lock: Mutex protecting mailbox command operations */
> +	struct mutex cmd_lock;
> +
> +	/** @phase_bit: MKHI message boundary phase toggle bit */
> +	u32 phase_bit;
> +};
> +
> +#endif /* _XE_SYSCTRL_TYPES_H_ */
> -- 
> 2.43.0
> 
