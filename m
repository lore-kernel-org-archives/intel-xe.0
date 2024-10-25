Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB35AD149F3
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 20:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A172510EB82;
	Fri, 25 Oct 2024 20:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkzkKE65";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100EC10EB82
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729889142; x=1761425142;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UaoS5FSQ2trsARLIaDE74dst9m7H7w/mXpjBEhTzXAw=;
 b=LkzkKE65pWkIJ7cZRMXWVPbycR5V8aoQ8Cc8kwGHK1tlNMXcc3RTKASX
 Ab9IJEHwfSmrUc7ZrlEMecIn+b3SjC2Bf/8xLRLgHTTSCrbOEPothclGa
 /kCxBOW+qr71poSUSljQRxqK9gx34wUeBtVjsYkJo14hublDngRQN6A70
 l7q1ZQPk0i3szi33eUNPUbvQTg0ZjGG1l0W8DRQqA2BajOpvTRkwUdI/c
 gJQBB64NMrO0Fh3yYKrAb/4P9OBdkkItLgJd7MfhVRX6slR+yu63r2jg3
 UyGmewgWFwnrkebdHMX/y2jAlJbf2mmjO0twuociALuhGWMtIGcL8Kn9D Q==;
X-CSE-ConnectionGUID: 0pUC4IzHSkihRHdjIQu/qg==
X-CSE-MsgGUID: am34kUS0SruQun7avS8+6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33269520"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33269520"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 13:45:41 -0700
X-CSE-ConnectionGUID: BxXUyoENRwevpUXGAuguiw==
X-CSE-MsgGUID: iqWB3qbJTK+GBUAJbCcsvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81478315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 13:45:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 13:45:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 13:45:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 13:45:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrJoHoOXEimZjNGOMU64VmdiPiehSzWCs6exPhvcBkbaSU6fDeX14Vm/cPX6hNIGUPoHQF8C/Ro8ZY1Cm17M0Z+r0uozKqA7SILd++MPVVkFFlmxfOvfpJhNorRCjPGs57PZYJbyOiM+oko9sEeCKDkQrML+hF6xClS2AgQexijQ8fhjVpiaRfyloFyLO8Iy6wy6+vgApu3Quviv2heO9u12lJaSwUuAgaFrmjcD9B6UBIfjf9DL4y3nQ6NzboDgSK44Isi8x3Map6AZhariaNjwDlJE8ndD63FpjTh+pyxwTmFUImtKwK0Zz9nX5ptaBLOyhlmk40If9yxmAw6fGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCP51tCHpLG8W5W4UScgoBeqYAWJUIutOLhGRqSh8LA=;
 b=j379aqrmERDuV10u6Pa2FuY+GE8hcFoY4xaxOWKl978byH/sr2zqWhocYlBCevF6EX0wJPXOnyJ83Y+v+/7Jc438UTlsqwQLBpZUX3RuaC/hVqBv6Lx7EO10BKxb4fq3b3jNwBgYjhHMqP2p5/RD10gnQ64G57MWctn7tDcXR1eFoVqw7+Ggi70b7ByajvaVr4ez3hJuaDwjWBi9XWJ6IQVggKfMjNN5a9DZ+T/wS5wPijo7lu6RYfldx88V1/9Qtr9Ypf1QtH9CR+6D2mggyZzRJuNEm3VDOkDC+t5kPZ4wyOwB0gMXGVazdN0fekHF33kv2vdlKw7yqALJvHIthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.21; Fri, 25 Oct 2024 20:45:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 20:45:37 +0000
Date: Fri, 25 Oct 2024 13:45:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <John.C.Harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v1] drm/xe: Rework throttle ABI
Message-ID: <20241025204534.GS5725@mdroper-desk1.amr.corp.intel.com>
References: <20241025092238.167042-1-raag.jadav@intel.com>
 <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
 <Zxvrri2LSkodxC-g@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zxvrri2LSkodxC-g@black.fi.intel.com>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb75e20-4f2e-4e99-c074-08dcf535fb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9LJ+HAQDrsQ78jQqBEvy4IpOr/HhWEeeEYbadz/zCm9L3SCitx2gxK486yPF?=
 =?us-ascii?Q?bv/oiQdr+DI25CY1KSoGV3WJ6pShGQOGL2df54NSTjAs9k187rFMyiV0+XAu?=
 =?us-ascii?Q?TWGMgazVRA93vrKFBxKMnAyB6+q7U6yadnKhD0KrcNbwgXi5VKKI1425XFQE?=
 =?us-ascii?Q?VnLwlW9kFjd8nPY2GkSKB3xu8LRjrqht7yK0MoyDRsb004XWg0IceY1ssifX?=
 =?us-ascii?Q?echdijp7NkCuSAuToeZswDeTVFmIuL99UzzUkLsrPZlRY0qmvEkUSDILyFDs?=
 =?us-ascii?Q?Zwn/RYrBhlk7OjgM1f25gHwbq/VsXtWEusoutUIlO7O6B9/sw/ZjRgKOjc4P?=
 =?us-ascii?Q?ExyBWSuRlVz8Gzn9MPyEbovewmbUOho9BJhZ8vbcc9YD2YG4I5nst8kAv69w?=
 =?us-ascii?Q?sACnFVormuGtMJbYECM8NJXhVhu5VqOHGCCXi7qaiGUlk5O23ICPnyTV4gjc?=
 =?us-ascii?Q?WnxsSTWlu89zheiE+EBal8wpw9rHU10XmhXfjRfm2aLpuq57nnolrL5/TyFC?=
 =?us-ascii?Q?Z1JiIQxz0ZhlxriSpmdS/ACQUE/cyOwvm0qrf/x9KbcvzdKWDWG3uyNz3Z7b?=
 =?us-ascii?Q?RZQe8I7UwhDxWT0vCqal1t5cSGexoBknyiKdAEkEflafTTTFDG6BXyv0wpoZ?=
 =?us-ascii?Q?OhkZBGTu6pEGiJkAuj4Ymz++8Mh/5riObBqt+f9+T4w7LklmWjyK1QjEpgQm?=
 =?us-ascii?Q?cahN7wXrAMCkbsqBu5P34gaP+R9Lne++ON/sG8MebA9geK7W5eJZrEw8hid7?=
 =?us-ascii?Q?8jEKtOixfJTJluM1zZpL+IulylvbY1bHKml0AATFjwhCkHV4VvINtfCNNada?=
 =?us-ascii?Q?9DXzfj6rzn2DkdHA7JZHx5ghxIKc36g2gZgxrjcIc11x6Rg09Z7pUeRFxPMe?=
 =?us-ascii?Q?WJN+ovM35LfhCtsein36hKOFUh69Wtwj6cFiwmQrQEbvkcfdFM2IdcW9K3VJ?=
 =?us-ascii?Q?fRL5hvXhfgnh3OSMMhby3ScHV155uvORf5ZyLhNgbCyF+Xzd9s3EwY9EEAcy?=
 =?us-ascii?Q?cRVh63Ta1HVvH6xZynH6y2VMV7G0/p/i+Lq+qC9hJ513RZuPfrLy/bXp5AJk?=
 =?us-ascii?Q?x3iI5OfXL39smAF9cJE7Rs3c1Z4EvPDx0c900i4rR1ewnh0itXGhB1nS1Pgk?=
 =?us-ascii?Q?JNWqxzJ7OfWd9LDy6dLmilmhJBQSa8XxP2aFy0IGK85YIXde5LiusWv9hzTC?=
 =?us-ascii?Q?tPyzJKz2BICL4Z/MugKwMnjLGZZQBX0jD4kC+crqnBKimXveeaZh9oujBHHA?=
 =?us-ascii?Q?9z9ocekoPCqblHXai0h6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7pBZc5/ntk01NgAAtlQhfUsQs02nkfeb9q39XqTRsqyRQXV2JfzXA/rvBVmC?=
 =?us-ascii?Q?g66W4Nd3f6qx27ZVkPXgK6uS2qec7vskR03vDGMqXHUkX59kDUGze9UuFk4a?=
 =?us-ascii?Q?9ESzZv0qAZQAk0DPxHWvElGsvTxLrNYPYyyinYiglKLc8rpMobfmVXFjPwgm?=
 =?us-ascii?Q?koKB+D0SXuuUnUvA0VsS6kNbRPz5tlk/iZMQMw1EerjAKhSUdBCvILP8X61u?=
 =?us-ascii?Q?X+3tjQ3OkeWs7hqteOMKsR71OTfzOioSgNQ65+iG56YMmbK0cT2jtiVUiLcH?=
 =?us-ascii?Q?70zcmLUkJZ/OseKdUni8LzM9AD7kgHFPVJIYhtGIUmijcpUr/0iV3v70LLUh?=
 =?us-ascii?Q?r5l0UqUVVUoKmsUt7N7uvBneOf4PrwHK6gWIazpgNtTMyPtbrgBrdpSAJX2Q?=
 =?us-ascii?Q?XZiL210LRUT1eXsfZ5/5n0IpYdwZEQHun6zuyv40NSqkxM3NyXe50CN3fT2O?=
 =?us-ascii?Q?KmLStUnvj0CuQHRIbfRYVqIFoVCojW9wmkYIy67GSO48thG8OQHK/5ckRN2V?=
 =?us-ascii?Q?Hag/vv12gRXxMMuajHWiD3xgBwwr+7ZP7Yg871cKmE/ivbj6kSp2YPEL7e2U?=
 =?us-ascii?Q?8eEq8NDddP110dSTqEz1DwudNmiEwdNxtCKZ9lI1DzBRjKSu3Hop/lQXFF/o?=
 =?us-ascii?Q?ejaqCfvN3lamCGg1bcmvJWC6S55vyegnik+j/sSAnoCHm35Uldy6GC0BT47M?=
 =?us-ascii?Q?y+Mcy1stMnefRUcju8XWQQZ35c5xJFLwnsj0NQ/3dd3vonSo1mYmk9Y5tfci?=
 =?us-ascii?Q?gvRKebNLoB709LxHPLJuRGWuqr82k/9N4RJsR+Jj68tY0Dh3EmPky6MrEFRK?=
 =?us-ascii?Q?4PTS96nd5ZH6kjvX6ZyPm7ajXDcbc0xsOF8NF7BZwGDuHuEVLvg3ySCeaUQX?=
 =?us-ascii?Q?QTgx6dZp6Tq/r+qTx6wUf1swDHyljXb6bUob8UVncZJSHKkszRmx8H2L7j4H?=
 =?us-ascii?Q?SPkaxR71JrcVKh87OjUKmAd5NeIwNGZT2Dn7kslEdJ/vR7e5yWJrvvq3Yu5Y?=
 =?us-ascii?Q?f5yXDJZot51bXgSNO0MJqt5kTx1ED3EEpzog4eiTHApc0a9X+zoCaQH9dNYw?=
 =?us-ascii?Q?CEzkdVFok3j9NdGRs4lx7SVTMLBlIj+ThRO1+4RMvl01jjOUgqcHhYKqWd93?=
 =?us-ascii?Q?J4YkexzrC5tY2tPVSFGkTMK5WSST3Z7UdqaOHNOBbCSxEtc1PjTk0uYfcusj?=
 =?us-ascii?Q?WyOTf2il4FsPab/9hhvidFWvVwhVNGHwS0X7li59i0OliGgW6WbglRRXKK6G?=
 =?us-ascii?Q?JhEISyxa6QWBCVVKoIPxJqZGFtpNa8wq6GlGT/LX9429JBqHpv9fx2qcrEDK?=
 =?us-ascii?Q?QsAhtopSuN2dhddKBOb+tQydedlSfhbGhNBf+MPtevLZPXrMrrAle5Dm+vRo?=
 =?us-ascii?Q?x6oAtp5XRTNk+xxiuDULe0h9//z8r03jZi5pGvD71INMenjcKi7oNeZMBv7J?=
 =?us-ascii?Q?hjHlZrnvPxXvHcJtTNxYIC2g+/lbKds1otOzhrUzL63ImH54NbmATZT+rFBE?=
 =?us-ascii?Q?BnG6Lz8nsNmwvX6Mh9w+Aev4K+0Ous8UPUhcCWzCCpk3hlpVLAOIX6l2CQ8v?=
 =?us-ascii?Q?9cICy/q4nbl8PkwOFmjUyYqcm29+fEl8TtD/kFaWIAOchPM4z5BLcnzYmZE9?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb75e20-4f2e-4e99-c074-08dcf535fb21
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 20:45:37.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSjNQZs9ykxWQKf6Aix9YfziznIV9dFXp8acDpvBFoblPztEvTve5PeHvn1ye6dT5rd55eAtAjkBOqp9q5UOlnZIDjfvECdonIAzLs/1RZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
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

On Fri, Oct 25, 2024 at 10:04:14PM +0300, Raag Jadav wrote:
> On Fri, Oct 25, 2024 at 10:03:41AM -0700, Matt Roper wrote:
> > On Fri, Oct 25, 2024 at 02:52:38PM +0530, Raag Jadav wrote:
> > > Current implementation adds multiple sysfs entries for getting GT
> > > throttle status and its reasons, which forces the user to read multiple
> > > entries for evaluating the result. Since output of each entry is based
> > > on the same underlying hardware register and considering the access type
> > > of this register is RO/v, the value of this register can change at any
> > > given point, even between subsequent sysfs reads. This makes current
> > > implementation fundamentally flawed which can produce inconsistent results.
> > > 
> > > Rework throttle ABI and introduce throttle_status attribute which will
> > > provide throttle status through a oneshot register read, making it
> > > relatively less error prone. The new ABI will provide throttle reasons
> > > in a string based list based on the respective bits which are set in the
> > > hardware. Empty output means no bits are set and hence no throttling.
> > 
> > But the old ABI is already released, and we have platforms with
> > force_probe lifted already.  Presumably userspace software is already
> > using the existing interface (otherwise it never would have been allowed
> > to land upstream), so that means we can't change it in incompatible ways
> > anymore; we're locked into supporting the current interface forever on
> > these platforms.
> > 
> > We can change the ABI for _future_ platforms if it makes sense, but it's
> > too late to make compatibility-breaking changes for LNL and BMG.
> 
> It landed upstream pretty recently AFAICT, atleast in xe.

It landed upstream about 10 months ago:

        commit 1c8e9019033728093c04608f44c6e87fec6822e1
        Author:     Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
        AuthorDate: Fri Dec 8 00:11:52 2023 -0500
        Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
        CommitDate: Thu Dec 21 11:45:28 2023 -0500

            drm/xe: Add frequency throttle reasons sysfs attributes

and has been part of the 6.8 kernel onward.  So this isn't a case where
something just recently landed in drm-tip and hasn't made its way into a
formal kernel.org release yet.

> So maybe worth reconsidering.

It's not really a decision that we get to make.  One of the absolute
rules of Linux kernel development is that we cannot break
kernel<->userspace ABI that's being used.  A user must always be able to
safely upgrade their kernel without updating any other software on the
system without suffering breakage/regressions (with slight exceptions
for special security-related cases).  In this case, if you remove the
existing sysfs APIs and try to replace them with something different,
then it will immediately break existing tools that were using the old
interface.  That's simply not allowed by Linux kernel rules.

> 
> > > 
> > > $ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
> > > prochot
> > > thermal
> > > ratl
> > > thermalert
> > > tdc
> > > pl4
> > > pl1
> > > pl2
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
> > 
> > I'm not sure what this ticket is about, but it was already closed
> > several weeks ago due to no longer reproducing.
> 
> I'm sure we all have our "it works on my machine" moment :D

The point is that we can't point at a non-active issue as justification
here.  If the failure reported in that issue is still relevant, the
ticket should be re-opened and a proper analysis should be posted there.
But changing the ABI like this wouldn't help anyway since it would just
guarantee that the test breaks (because none of the interfaces it tries
to check would exist anymore).  This patch wouldn't actually fix or
close that ticket.

Besides, the failure in that ticket likely isn't a KMD issue at all,
just a bug in the test.  By design, these sysfs interfaces represent the
"right now" status of the hardware.  If you read several sysfs entries
then the status could change as that's happening.  It's just a flaw in
the test that it overlooked this and incorrectly assumed the status
would never change while the test is running.

> 
> > The ABI change here doesn't seem to be directly related to this ticket.
> 
> We can always create new tickets, and that's not the point.
> The point is we're stuck with unreliable ABI.

Unreliable how?  We don't let new userspace interfaces into the kernel
unless there's real (not IGT) userspace software lined up to use them,
and the userspace developers have already signed off on the design and
semantics of the interfaces.  Presumably the current users are happy
with the current semantics and understand that the status provided is
live rather than sticky.

Sometimes we realize down the road that we did overlook something
important in an interface.  It's unfortunate when that happens, but the
path forward then is that we create a new, alternate API on the side and
let existing userspace migrate over or not as it sees fit (e.g., stuff
like the DRM "addfb2" ioctl being added as a more expressive alternative
to "addfb" usage).  We still need to support the old interface though;
we can generally only sunset it for future platforms where there's no
pre-existing software already using the old interface.


Matt

> 
> Side note: The logs in the ticket may help connect the dots with commit message.
> 
> Raag

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
