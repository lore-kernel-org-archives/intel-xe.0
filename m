Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99613C27C79
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 18:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6310ED8B;
	Wed, 19 Jun 2024 18:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbPjH0+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6E110ED8B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 18:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718822785; x=1750358785;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fIs1ifYuAB4KUvEbZwxuDAZo81BYhhwtDkQk1u5B7f8=;
 b=SbPjH0+r1C4wglOyA+RvMifJoq141xIj+ekJ1CnJapfu4CdfaoWw0np6
 ZA+ahGZrnMxv0JBHT0ABr4b97ky9qjrmYCVap7Sd45mSGSFbRHvqOrHXM
 Sear4elQ1JCMYeOBEfZDl0zvBMLGSjDxMLcuwdmo8GLpa+ldBb1vdAonM
 UYuysjRdiwZULZYoMXQ6PGNayr3mLASQhhhwsgr7EZH5y2IBCd9qpwFEk
 futZjzGuZb3nvdPWBPXOyra2sEM3TKchgl/5D5GQjXabLjFtA8hopXse2
 PJ1fWEMZFYl6rNJm+v6Bwa9mVufsBDccRhiiiU8rfcPGuL4Rgx/qSe5RR Q==;
X-CSE-ConnectionGUID: Jg6gLCtVTvmS8e2RKCVR/A==
X-CSE-MsgGUID: AXn35Pw4THaokbvWuE74qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27184399"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="27184399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 11:46:25 -0700
X-CSE-ConnectionGUID: dDDjCKCZQYWm/WlXFzdkhg==
X-CSE-MsgGUID: 3lLtclB+QtukuUA4KzOA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41957449"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 11:46:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 11:46:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 11:46:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 11:46:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 11:46:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICscaX3dyyYazro76vzKomvSn3QmatIt/m3LpsX+W70DD8U7B9AIuxEyeeAyjPmjSTW78fUp9FTQZi4WzFmq+37t2HMNDBrRNJHTlqlT7T0trzyxBFFf7mZ2KwWSf7yhFCD45hc2qfvM8rjMve2qzHP/EgT3EqSOqCG+xjGjUyUmqk/iAkMC4gCbB0yLRNq9h/jvof9e4G+BBWq2FYps0Ojh/E7dfz6mKEC+LhsS0PHcYGUrLJ7IhG3yGMOv9D2tAEXgBweHFhxJO7waSFQ/NG2+AcBJtqdr82CazTuQrONlQ7DkXvOOd6cuDiKm/x0lQY1MsYAh+IzJfiXgEG69MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+ZJf8wVZxoJUfLzrv1AZbnc6PrcdUr6BmaiM9RCYoQ=;
 b=VTnT+qMMCE3UliDp/EwSqhrzTpXv++qqxodT98n54rgZIJk28dtHh2N8yIGsRtMhfOOP7RuucXARdlgBmPwO30W51cPdVpjTe8Fw8+qR7+L2H3J4SIswzA3gTCM04/oQaZakb2HfxZIWOIR1Cnipkt2u18Nrhyh0D02l6M5+NTLnJHE6pHJ7kRV/HIBq/JDoK07VSP2F7NkJsmfxd0yJj0+vfM+CqX62gSnnbEpRJBLBcWKv9Q0r9PbBdy3aJccmowMHydpDcIytZSwE70C8EdJ09wiP2bmhZ7t7cuMSDfKySz0/eleaSWeZ9Oaoiv5vmV3v779Swhjat9KOwZxrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 18:46:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 18:46:21 +0000
Date: Wed, 19 Jun 2024 14:46:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnMneufY9h2NRsRq@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
 <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
 <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
 <ZnHtdMLEHFAHMqRr@intel.com>
 <db44e9c4f5ee7a57ab083772cb7f6684d1a31169.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db44e9c4f5ee7a57ab083772cb7f6684d1a31169.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbccfe6-ac75-4004-4c23-08dc90901cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yzAuGKPo60auVmCOj3jxAJEUk9Fkwf2F4V+X3RwNNEzBBpMArUTmgsZnym?=
 =?iso-8859-1?Q?OfiKSp4iaFxYN35qnV5rtcPcXfZXPgFoVULwhDCLAQEEw9ixsEwg8GW/NP?=
 =?iso-8859-1?Q?H5hSQ8F3uzUn2I3oo9aMHzLdredZJd4dcoSISS7xoMPMZkhWcIFcat+pDH?=
 =?iso-8859-1?Q?mrHkJSoUe7MEPkJx4Wyhnun1Tln+gQ1nDoZwwu8z975kkLL+DfmvOXmLoa?=
 =?iso-8859-1?Q?eewZJ9DRawMju8ykmpLN5e66qP1euHhclY5U94fZbapgpEr91ooB9cjzuD?=
 =?iso-8859-1?Q?pLHXxqTrDIABrzAg9ocpzTeVnd7pGm9J3GJe3I0CIGkuDBtb5DdnQHkz1s?=
 =?iso-8859-1?Q?BvA5AGtf5LJY0/doqjwcEH/qkfO8PvnmNlUgjM7FudQR7AezdxABP3IleH?=
 =?iso-8859-1?Q?NaiSkh1eWxeZPAoCjst35CvADluodSzEKm2i+oQBhUzR14dzo4feGiEUps?=
 =?iso-8859-1?Q?dIMmolyW3Y0ze5G1BjO/QnR37HL9bfUvoCF8wGayAmkFPIof1fmTcYZHj+?=
 =?iso-8859-1?Q?wWZe+iLv6IvzWIV2j4juUkHErPpzG7cETWc4f6cKJR/WUAzeCIgn5B2NWK?=
 =?iso-8859-1?Q?t1+IGgxfZvw8bAnfeA+VXVk+pGRsmLHXjzEw7xrUnU0Ct50FKpeWQEEKQT?=
 =?iso-8859-1?Q?1ybEfN52c77D/KsNhAAAidpkbp7HGf1tnpA+jPIhT/W3AOnyv5TQyZAang?=
 =?iso-8859-1?Q?eFw5EPA3MuAVVhylvPNKkrI4ll32Whr8oPIEn60CCI176e7E+LthnxJSlM?=
 =?iso-8859-1?Q?55shMaR57TGHWiXjYno7J0Cpib81ZQK3xwJTyLXLJFm5OAti2k9N+6XsXO?=
 =?iso-8859-1?Q?ce4zHZFhVXdzwbWm6/HS329QRlD4KhK9M2e3WiplKBKy5LpPVNPCQnM3ml?=
 =?iso-8859-1?Q?nTMIq2X3IIY47UMpImE2ftG2UghjTTCR3OMj7oAD35YKmQvWg2HJJh+IIU?=
 =?iso-8859-1?Q?OsWxJE2pA2/k0aoGORh2np0+4bdaXYXOPXomcdlpGZ2E4FRzAan6bJ4ScE?=
 =?iso-8859-1?Q?ZstehANomc9mZoUBSy5LhEbLwKK/t1nLVSz+CYXyLiO4xvICVQWCPbbMtz?=
 =?iso-8859-1?Q?sSdXQP01ikirVaiT276girAVFQxr51AU7OWz8bNIC+WK4vGtyjRMTGNpuv?=
 =?iso-8859-1?Q?6QD+T5ZLm8cBFdYworrQRNMJhhaa1Usl09iV3suZRnPnf4mqCXoN9MLkLC?=
 =?iso-8859-1?Q?qN2srhkjqEpktPR5/UKlE/Lpw1KdZJSjhLLl5rSZ4Ns5sHMNZPdT+BAUuU?=
 =?iso-8859-1?Q?ZoJvXoTik+cl5m51lfQW0FcGFCJzDue0D1iMV2dxalHREJNmLWveFlmPkt?=
 =?iso-8859-1?Q?GYLB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cviYP4lBnhX6wsto8Nc9xZdkIxOO2NWRUfqwB+GpUduw2bKFUHTmPMRKoZ?=
 =?iso-8859-1?Q?47LC5Jv75RtdtfizJg+FmNmlEXgr119ZUVzmnpiGX7uK/p5cANcrB/e4o5?=
 =?iso-8859-1?Q?uXXB6hIeQPR0GmROFUZn+qqRLecue98G1FRgmO6rYB+pN2tIjpwsWbYkSC?=
 =?iso-8859-1?Q?QSurbTJUq8QFFAACUZM0Qg/t2dZP4rDCWp7lXVxdSs7QM3vpYu9Lro+Xks?=
 =?iso-8859-1?Q?g6XeOWzdtZYiCscy4VmQEm3aDX/59ex3xEqtr+CMqFwH57Eb52HxctFaK0?=
 =?iso-8859-1?Q?q04M16xbIn31uvH2BVk12eCiB4A2GFLMYVa4SPvQ/XHV1AER3YWCdqP8CO?=
 =?iso-8859-1?Q?cjEq0sQkWglhpxAemTeECxkGmU4o+1xR0tQDFthy3XHPrKLfFfqA8nqUR6?=
 =?iso-8859-1?Q?iIp+GNA1B/Lin/5aHBdWNSxrOf5iUQEu3FLhkHbiYv3kKH/soT4LKa0x9c?=
 =?iso-8859-1?Q?eNYlnMUX7NTB5qaYq7jBu0dDArX/ZiWjE1cd4IJHV7jI+ErcKY/JNhIiEF?=
 =?iso-8859-1?Q?IYXvvUlQPLq3b7dj6rRt9u/TWfC9ngVRRxIa/B45qVB3rPwOTrSMhC6Q0Q?=
 =?iso-8859-1?Q?iOyvkiHqIKn2Hd5h6MXUfwOiC0/hN923PqGCro9qkkF93TJOTVPoKVYZwI?=
 =?iso-8859-1?Q?C22Z5UJKmkR6TFMnvBSgQCro8nC9xx4Tj0ncX6okLroOQE9Kn+unQrP8+l?=
 =?iso-8859-1?Q?3DlrltfCxRHd4Ysnqti9rOn6WYabbQAvR/hSR1Pv8NxlIgzeScMcidZrql?=
 =?iso-8859-1?Q?3OmeYUoY6POb+TGP2PS6Xo9S0v0wbv56BSglm+wfDzQh19nCGt6D2Slxq+?=
 =?iso-8859-1?Q?Hvc701G8Ar3ZEZB0jn6HcuaOzHbGfZWQWehiepBbDW58dRKilqjgKM87yk?=
 =?iso-8859-1?Q?hVlzOBpFvYos6CbScu3jN09uKOYKEfmRQtJ/ooskvAnkNNPnc6GDBoNmfC?=
 =?iso-8859-1?Q?ZUBEYuXwvpEVeSP6Poh+k8TxFOpubQMjFQNsM6TzTtyvZAufBzL5SkBrFt?=
 =?iso-8859-1?Q?uiDkwdlLibA6olSHFuMpyaKd+BOTD5lAruFe+HEl3g7cGK0FFEeV/vdkm1?=
 =?iso-8859-1?Q?nCqV4j/kvGL+kiLfTiPoToF641DBhi3t4CGcrgypNgYySxWwVYBjpy4y/9?=
 =?iso-8859-1?Q?1vAoihcDJDqLPcI2EvCqGoX6k0EE4SFG8o/xwi3XU7KpCdZ8SaOany+BrN?=
 =?iso-8859-1?Q?jNG5IBs9IaQxAwWEUQaHZqip46ltEhYoroo+Zq9Rn9hLyJHV1w+clLHedn?=
 =?iso-8859-1?Q?ditIv8UAfyiiRh4SlROu9fU4PG4Gb/hS8dZMbOkSJKxBT2GjX9Ad+uBP28?=
 =?iso-8859-1?Q?KGxcWZ00BVPesvLbSiLX4BeD0STCOFuVAFeAHPt9Gc/STTTls2dZ2rFqhY?=
 =?iso-8859-1?Q?XEVJ8HCddmSzdjxPIM2rVHVyaAs8Ay0PvrOMGUQfF6q0ca4dQJVw5nH7Xg?=
 =?iso-8859-1?Q?ff90d/jCGiJ0kKYhsQQ2mFoD1xpX8OR6Qa30QYcprvXyY+Qbgvckc/zxtL?=
 =?iso-8859-1?Q?TW8MNyYMn0iNWee4HQ1ql69FomkD+n9gVlYK+9+Od43Z3UuS96MLZDs0Bo?=
 =?iso-8859-1?Q?2cdXXp9YCqqKS1JZe0SYKLEtfsiurLg3zDslOf76LwITqhBM4iEEmWijpx?=
 =?iso-8859-1?Q?l7KVU0mBCT7+JC5m6Lvl0e0ewynKpI8/2jQtalRzPTfmHdGwAEqY5Rbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbccfe6-ac75-4004-4c23-08dc90901cdf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 18:46:21.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjNTKES1kLeNd1AoqB1oHU/nNw6rRkDNwNVp41QqrRIweyg4G2LExgZosQ6rYbltZqmtFcomNys3VNph8NCSfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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

On Wed, Jun 19, 2024 at 08:40:54AM +0200, Thomas Hellström wrote:
> Hi, Rodrigo,
> 
> On Tue, 2024-06-18 at 16:26 -0400, Rodrigo Vivi wrote:
> > On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
> > > On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
> > > > On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
> > > > > 
> > > > > 
> > > > > On 17.06.2024 20:00, Rodrigo Vivi wrote:
> > > > > > On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost
> > > > > > wrote:
> > > > > > > On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko
> > > > > > > wrote:
> > > > > > > > There is support for 'classes' with constructor and
> > > > > > > > destructor
> > > > > > > > semantics that can be used for any scope-based resource
> > > > > > > > management,
> > > > > > > > like device force-wake management.
> > > > > > > > 
> > > > > > > > Add necessary definitions explicitly, since existing
> > > > > > > > macros from
> > > > > > > > linux/cleanup.h can't deal with our specific requirements
> > > > > > > > yet.
> > > > > > > > 
> > > > > > > > This should allow us to use:
> > > > > > > > 
> > > > > > > > 	scoped_guard(xe_fw, fw, XE_FW_GT)
> > > > > > > > 		foo();
> > > > > > > > or
> > > > > > > > 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> > > > > > > > 
> > > > > > > > without any concern of leaking the force-wake references.
> > > > > > > > 
> > > > > > > > Note: this is preliminary code as right now it's unclear
> > > > > > > > how to
> > > > > > > > correctly handle errors from the force-wake functions.
> > > > > > > > 
> > > > > > > 
> > > > > > > I'm personally don't like this at all. IMO it obfuscate the
> > > > > > > code with
> > > > > > > little real benefit. This is just an opinion though, others
> > > > > > > opinions may
> > > > > > > differ from mine.
> > > > > 
> > > > > except that is more robust than hand-crafted code that is error
> > > > > prone,
> > > > > like this snippet from wedged_mode_set():
> > > > > 
> > > > > 	xe_pm_runtime_get(xe);
> > > > > 	for_each_gt(gt, xe, id) {
> > > > > 		ret = xe_guc_ads(...);
> > > > > 		if (ret) {
> > > > > 			xe_gt_err(gt, "...");
> > > > > 			return -EIO;
> > > > > 		}
> > > > > 	}
> > > > > 	xe_pm_runtime_put(xe);
> > > > > 
> > > > > and thanks to PM guard class we could avoid such mistakes for
> > > > > free:
> > > > > 
> > > > > 	scoped_guard(xe_pm, xe) {
> > > > > 		for_each_gt(gt, xe, id) {
> > > > > 			ret = xe_guc_ads(...);
> > > > > 			if (ret) {
> > > > > 				xe_gt_err(gt, "...");
> > > > > 				return -EIO;
> > > > 
> > > > Just responding with a question here - haven't looked at the rest
> > > > of the
> > > > comments.
> > > > 
> > > > How is this not still a bug? Looking at scoped_guard, it appears
> > > > to be a
> > > > magic macro for loop which acquires / releases a lock or in your
> > > > purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the
> > > > release
> > > > step? I see coding patterns like above in the kernel [1] so I do
> > > > assume
> > > 
> > > with __attribute__((cleanup)), the compiler guarantees that
> > > it's executed when the variable goes out of scope. What you are
> > > probably
> > > missing is the use of CLASS() declaring a variable inside the for,
> > > which
> > > uses attribute cleanup:
> > > 
> > > 	for (CLASS(_name, scope)(args),
> > > 	     ...
> > > 
> > > GCC's doc:
> > > 
> > > https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
> > > 
> > > 	The cleanup attribute runs a function when the variable
> > > goes out
> > > 	of scope. This attribute can only be applied to auto
> > > function
> > > 	scope variables; it may not be applied to parameters or
> > > 	variables with static storage duration. The function must
> > > take
> > > 	one parameter, a pointer to a type compatible with the
> > > variable.
> > > 	The return value of the function (if any) is ignored.
> > > 
> > > 	When multiple variables in the same scope have cleanup
> > > 	attributes, at exit from the scope their associated
> > > cleanup
> > > 	functions are run in reverse order of definition (last
> > > defined,
> > > 	first cleanup).
> > > 
> > > 	If -fexceptions is enabled, then cleanup_function is run
> > > during
> > > 	the stack unwinding that happens during the processing of
> > > the
> > > 	exception. Note that the cleanup attribute does not allow
> > > the
> > > 	exception to be caught, only to perform an action. It is
> > > 	undefined what happens if cleanup_function does not return
> > > 	normally.
> > > 
> > > This was only possible with the recent change in the kernel raising
> > > the minimum C std to gnu11 (uapi is still c90 for compatibility):
> > > 
> > > 	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
> > > 	Author: Arnd Bergmann <arnd@arndb.de>
> > > 	Date:   Tue Mar 8 22:56:14 2022 +0100
> > > 
> > > 	    Kbuild: move to -std=gnu11
> > > 
> > > 	    During a patch discussion, Linus brought up the option
> > > of changing
> > > 	    the C standard version from gnu89 to gnu99, which
> > > allows using variable
> > > 	    declaration inside of a for() loop. While the C99, C11
> > > and later standards
> > > 	    introduce many other features, most of these are
> > > already available in
> > > 	    gnu89 as GNU extensions as well.
> > > 
> > > > this works, just confused how it works.
> > > > 
> > > > With that, any code which isn't easily understandable IMO is a
> > > > negative
> > > > ROI as it just creates confusion in the long / makes problems
> > > > harder to
> > > > understand. Again this is just my opinion.
> > > 
> > > I think that is mainly about getting used to the pattern. I think
> > > we
> > > just have to be careful not to overshoot on trying to use
> > > everywhere.
> > > For example, I don't know why there's already a second use in a
> > > separate
> > > thread when we are still discussing it on this one.
> > > 
> > > A very positive thing is that this is not xe's own invention and
> > > comes
> > > from core kernel, maybe from the hottest path that is the
> > > scheduling and
> > > locking. So I very much disagree with arguments raised here about
> > > a) this is an alien thing and b) performance will be severely
> > > impacted
> > 
> > just for the record:
> > a) the alien thing is i915's with_runtime_pm... this is part of core
> > kernel, so
> > it is not an alien thing. I still don't like C++isms, but that is
> > just a preference
> > not a blocker.
> > 
> > b) it is an overhead, but I really doubt that this would impact
> > performance.
> > Only data would show.
> > 
> > > 
> > > I've used __attribute__((cleanup)) in several userspace projects in
> > > the
> > > past and it does help avoiding problems on the error path that is
> > > usually not very well tested (and xe's track record on error path
> > > is not
> > > very good either: those were the main issues being submitted in
> > > drm-xe-fixes
> > > for the last release). So if we have a way to improve (and that
> > > I've already seen
> > > being used successfully), I prefer failing on trying than on
> > > repeating
> > > the same mistakes. 
> > 
> > Pretty much agreeing here! Specially because this is a Linux core
> > kernel
> > infra available. Let's try.
> > 
> > Cc Nirmoy Das <nirmoy.das@intel.com>
> > 
> > who is looking at the forcewake stuff and to solve the flow.
> > Specially to get his eyes here and see if this would cover all the
> > needed
> > cases for the forcewake.
> > 
> > If this series were suggesting another with_runtime_pm macro, then I
> > would
> > push back hard.
> 
> Does this mean you think the functionality of "with_runtime_pm" is bad
> or the fact that it is driver specific and not part of the core?

because it is driver specific.
just my regular rant with this, and other driver specific things,
like almost everything in i915_utils.h

> 
> Overall, scoped_guard looks fine with me and will probably come in very
> handy in some cases, but I don't think it's necessary with a complete
> "driver transition" other than when / if it's used for FW, PM etc. For
> locks I'm pretty sure that there are callsites where conversion will be
> pretty hard. Also need to read up a bit to check how interruptible
> locks and trylocks are supported, and if the answer is "they are not"
> we must make sure this doesn't for example encourage the use of
> uninterruptible mutex locks where they should really be interruptible.
> 
> /Thomas
> 
>  
> 
> 
> 
> > 
> > >  In kmod my only regret is that I didn't start it
> > > earlier, during the bootstrap of the project.
> > > 
> > > 
> > > Lucas De Marchi
> > > 
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > [1]
> > > > https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544
> > > > 
> > > > > 			}
> > > > > 		}
> > > > > 	}
> > > > > 
> > > > > > 
> > > > > > Well, on the positive side, it is not adding a driver only
> > > > > > thing like
> > > > > > i915's with_runtime_pm() macro.
> > > > > > 
> > > > > > But I'm also not sure if I like the overall idea anyway:
> > > > > > 
> > > > > > - I don't like adding C++isms in a pure C code. Specially
> > > > > > something not
> > > > > > so standard and common that will decrease the ramp-up time
> > > > > > for newcomers.
> > > > > 
> > > > > does it mean that the use of other guard patterns seen
> > > > > elsewhere in the
> > > > > tree is now prohibited on the Xe driver ? like:
> > > > > 
> > > > > 	scoped_guard(mutex, &lock)
> > > > > 		foo();
> > > > > 
> > > > > 	scoped_guard(spinlock, &lock)
> > > > > 		foo();
> > > > > 	...
> > > > > 
> > > > > > - It looks like and extra overhead on the object creation
> > > > > > destruction.
> > > > > 
> > > > > from cleanup.h doc is sounds there is none:
> > > > > 
> > > > >  "And through the magic of value-propagation and dead-code-
> > > > > elimination,
> > > > > it eliminates the actual cleanup call and compiles into:"
> > > > > 
> > > > > 
> > > > > > - It looks not flexible for handling different cases... like
> > > > > > forcewake for
> > > > > > instance where we might want to ignore the ack timeout in
> > > > > > some cases.
> > > > > 
> > > > > there is scoped_cond_guard() that likely will be able to deal
> > > > > with it,
> > > > > but I guess we first need to cleanup existing force_wake api as
> > > > > expected
> > > > > flow is not clear and there are different approaches in the
> > > > > driver how
> > > > > to deal with errors
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > 
> > > > > > > > Michal Wajdeczko (3):
> > > > > > > >   drm/xe: Introduce force-wake guard class
> > > > > > > >   drm/xe: Use new FW guard in xe_mocs.c
> > > > > > > >   drm/xe: Use new FW guard in xe_pat.c
> > > > > > > > 
> > > > > > > >  drivers/gpu/drm/xe/xe_force_wake.h       | 48
> > > > > > > > +++++++++++++++++++
> > > > > > > >  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> > > > > > > >  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
> > > > > > > >  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++--
> > > > > > > > --------------
> > > > > > > >  4 files changed, 82 insertions(+), 50 deletions(-)
> > > > > > > > 
> > > > > > > > --
> > > > > > > > 2.43.0
> > > > > > > > 
> 
