Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039DFC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A1410E11F;
	Tue, 28 Jan 2025 22:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CucEn8BD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9548110E11F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738104556; x=1769640556;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=medWlnGU7fP1tN9O5Di8mSUR/bNq/l8raci8192bMmk=;
 b=CucEn8BDGFrpzTiH5ABTXuJ9EhIStqQvjG2HEo78Gzg9IYdYBh8E0FHj
 MFizp1XiC9RndbJ6c2inUuuyOb70nz3sx2Qejj6qS+3zEocuB9t7MGxop
 veTwDNwagPXJ6zXlJbO4xO986esqu1ExHERKLlHd2QAjuCWCzg9xK0nsX
 daajOXIIPtX8IMCErOZAMU2fZQbByzi9aOXev6704kWfhWwnwLOERMphO
 HmE+ioR4Xg4YCqKzC4GDfMxh4hcESeRsq/z0piowNLVVclmgVrYsLay9Q
 z20Ogv8K/TZ1oksWCCM3JTZMi8NWrnx7ZdrSlCk3uj/2Oswr7DNSLLRth w==;
X-CSE-ConnectionGUID: NOWnX4dVThqvMJu+vu+dmQ==
X-CSE-MsgGUID: a0i6jRETQeebAnYi0OSQFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38489661"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38489661"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:49:15 -0800
X-CSE-ConnectionGUID: wkYQOUkTR1u8Z2JwDLRI8g==
X-CSE-MsgGUID: alN05FGpTHeyV3H0JXuE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="109398221"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 14:49:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 14:49:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 14:49:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 14:49:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPIj5vEvgAp9v3Y2/qxxulQ5S4uk5+AdNax1vh3z7E9jwF1R7UYGxPmDCEMbhP+gCHh+HDilh94mfgKSetfLAWQ33ktKUclYSBqikbx3dtiSWZhsJqy2t+vTNklBcUpLKr+F5ffTBcrPrreyQjzR8et4/dSrMGgD4NkZadQSCK5rJx3GOxAeeu1e3zaVNE5GNi5VcAN3Qle16aBcXvR1LJXFR3eMl6iy1eff0hpMaCCKxfoLTQsa0GnNtjO3C1Ci823R7D0B/fVU5mNWRMjwebEdkJPMCZ9S7kK9yH11SNpy/n3HnJ2kJcV705V6y4ka08E+YdsfNvWdIX7Dyl3X+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75Xh21E6OtvlSxlrnHk/m8BX5xwrjsjuBol0xAYGIe8=;
 b=nGUdzRK1r+325z5xgISKIg6dGoTnk5HeWJr1LjRi49sdqXH5SYad/LmIwWCKW/cAAT7+jJgDsqKRcKXbrKVrqNk2JHfDbk47TSvmE7xqXuDqJXY3J/OaakX+lLx/QHUFnPJfhKHocMNW/VJXjZ1P3wE/aIAi22j5WaA51T3bjDqyOxGCfFZZnSDiYsdoBDPSCjdY4QcXqqR7HN7N1/paNbe3tEP8UFLddYBluVneiLEyz/NVJNaXKJsLUWw0QFXeFZjDNYvYEDT/MYZfjmM8OcMDG/7LqIH+qCZRxWbDLLxwx1QsLojDkZ7rZbcYDYutm6/UEoE7toWiXquS/INGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Tue, 28 Jan
 2025 22:48:31 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 22:48:31 +0000
Date: Tue, 28 Jan 2025 17:48:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v2] drm/xe/bmg: Add new PCI IDs
Message-ID: <Z5levERd97bqqguk@intel.com>
References: <20250128162015.3288675-1-shekhar.chauhan@intel.com>
 <ae98891a157c59a05752035cfa119b0e501881fe.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae98891a157c59a05752035cfa119b0e501881fe.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0128.namprd04.prod.outlook.com
 (2603:10b6:303:84::13) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd15f87-1eb3-4f44-ec37-08dd3fede3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?S5KMQgbxiaqIrFXGYjocQIn0URJPN75P/SHSYHXrGCMP2gMp6g0E8ud4I0?=
 =?iso-8859-1?Q?7D4sLfnZynIsCJJAwYu5lAEDtIOcBf5hFvt0Vg/o3QPn3dD1B3xrtMnKzG?=
 =?iso-8859-1?Q?aAQdXKTPZ4kP2XF9t3CXwz9ybkHa7kSZ+ERcB7pgTNBsYz1prfPZo91m3+?=
 =?iso-8859-1?Q?6UVeb2s+WtS6pKh9zBYzNEW4jbDk6RJKWgC8qOeDxpbFAsugHnEqhguNmd?=
 =?iso-8859-1?Q?3ZCy6m91Jg0aceDMLucIXaaMUuIIeXokivSj7oENABn29OHQIscw+7Fl0e?=
 =?iso-8859-1?Q?TOdfV5vLaRqBTM4lJmmlWlDvFmQi7K4S172pasbn0lt7sZYHbUNPVYFRUZ?=
 =?iso-8859-1?Q?RA+uEZEGl0fiqMLvtnxWgcq5jSsumImdRsrlGunQozs1EjXEEd/iodOoLf?=
 =?iso-8859-1?Q?IivEIuIGkBb8+N3x2JJ3lvniLDQn6IbYx6O9aiRivVALl52hFBiY4gAdQK?=
 =?iso-8859-1?Q?dwVNS+y/TAvdmMg7xCtDbthDRvE+pV6by2L9FzxrPLSFgZwKm4t59qJ4Ud?=
 =?iso-8859-1?Q?jkE9ot7gm+WFJNsvUaqhJGWJe5ccwYd14dFCKm6KgO/+B8OXRIBVyGLblu?=
 =?iso-8859-1?Q?6+Ujrp8Uf5PjYTUcVd/CwOsaxjiylH49yqKhTlXCBrfYznB84sBwK/YLnz?=
 =?iso-8859-1?Q?5D2maZT0Vou257EE2uhR8wvFkm7bXqW0fNGIYRPOOemyVua23H8xEz1xAy?=
 =?iso-8859-1?Q?Fm7xmy0sEAORrAWXBjo6x6K0mQ9qZ2x32loKW2iExksvOnLmdbUGecF0b2?=
 =?iso-8859-1?Q?q6GDHQPEI7gGaWYJKZXMX+fsWpvIhuZKlW2KP8v/jNrdqXnv1Ma+UE37MA?=
 =?iso-8859-1?Q?DvEm9y4SMeo7zVnYg89WFVJP0FYCXcZD/cBxXxH9W4mTx5YYknjivIcJEm?=
 =?iso-8859-1?Q?oD6bjCsmPoOjhkyS3yS6qMBUOduaX+94/IFySNaoslKWjv1vKx+WkEzQXB?=
 =?iso-8859-1?Q?vgTAxIcabTFkwIc+8Ei8yvOMnoNlwpdxhGoPLwU7p7D26/vFoitoclNKK2?=
 =?iso-8859-1?Q?Ux2GW1BA/EO4/nHHdi0xUOfop18Ll8ux2hrKpOsf2E2L8iRe0z2DTREhY0?=
 =?iso-8859-1?Q?uatnR7x6rDI41Q5GfYnw6q/ZLsERygMr1bXfnyJwU8wTpDHFr/rwbvP8dn?=
 =?iso-8859-1?Q?6pR8u9cyX2uQfhbxpmzjnqEOx9sxbVZbFzgx5JmKO6vQ8UG3wARMfF6rsK?=
 =?iso-8859-1?Q?0Y7s3TrTE+BQ2Ki6XAKmBVIyPMgq8OaEmBDzt5kRMhsR5Nx8LUN07o0L6A?=
 =?iso-8859-1?Q?a58kuXR7R+3JGC2qFhGqs7i+vYq+1gU3h5CoYyrGSshnU+DbhoHpfE/hT6?=
 =?iso-8859-1?Q?gZOoRqVBvIABPuuUCf7vULRQae8Y6wA59wQzRxw6RR4t938BcU5ZKCWZUx?=
 =?iso-8859-1?Q?iDaqOUKNKdoDbEbz+owVOId9nrC5FGDUQB+2XuWHXYvZPvanQXlcCfBoI2?=
 =?iso-8859-1?Q?JQFV8o+dp8rPAw27?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ovAPkfvisR3ywN2batnUXFqHeESD6yr5cLU2Lcyt1WkVyErCILnjHTsVDw?=
 =?iso-8859-1?Q?6uk6/S+Sxz5M9eBe4loM/ghp4YO8rmrMCWyBzW6htJFt3YyYnbkJ6jYj3Z?=
 =?iso-8859-1?Q?dYBKXh5/JM+DQ0R41HqOCS5RbtgeRoqafGV7ehaSGL9RnQgXxDU1C8v9ON?=
 =?iso-8859-1?Q?DBSGs+1jU/TRGJaf07CBhcSlp6lxjASvx9da5PdbP1cv4Zo9vGyX72oLau?=
 =?iso-8859-1?Q?Fvvvh2ba8maUUTRziynq4mzr9Gk1N1gTBmEVVFBfwAN4boQVzHn9SbwmAe?=
 =?iso-8859-1?Q?kqMhp5SDtlRXmSqtcdyWi1RCddFNL5B5GElB52m4qX6+pywvAEHME0HA2R?=
 =?iso-8859-1?Q?ZEBPCPyQc97GVE79kyHC8Jmfpfde/gsb2Y9qJ6LhQFnKZ+xoiAmmt2lZiv?=
 =?iso-8859-1?Q?ST1smFwlsO1A8v99OxptO7LGzArSQAZepa7vAmOJAz8SlUuzEzMPVrjiJy?=
 =?iso-8859-1?Q?C/0ynH38A7kPRHdRVVW9pZwC/UZngDh5Qci0GiQAinktP7eNCvD6cCSO4j?=
 =?iso-8859-1?Q?ikVqTAdjmfDgg4efOu+jRPjTK4mPDzMJa/JU09hIT+/H3EUYdlmpvZGEk1?=
 =?iso-8859-1?Q?/6TGsb8IWo7USTPuq4aI69OX102KA6c0Hvi/jlf8vRkp947kTAu+/Qtoal?=
 =?iso-8859-1?Q?qBknOZwZolY7S8QwgebD2qtC6xoN+2Qdi0jIsDBpjSS1ttyvfJ7zmP92kW?=
 =?iso-8859-1?Q?dxxPBRgg6IJDWQ0MSx4q/e6IguiYndgAZ+V3kAmVey+qQAplW9pn2a0xoc?=
 =?iso-8859-1?Q?QB/lGpqOiMS5zbP8EsrcgzueKCGP1NRs2CfAczb2FT8NPFLhfqecZpmRNK?=
 =?iso-8859-1?Q?TEHfYY8Z2a1R1piWH7IMkIHf4efOs3V23wUaoQuJbA2ZC2eUaHty/shSRc?=
 =?iso-8859-1?Q?kKWBPK2iJtPfEpGp8YoS8weae8cYrX8ZKfCAjCIfNIPIsRPhPQV/r/IGus?=
 =?iso-8859-1?Q?9YoNhIXQQt1cAuHqiAQScEN2MZ7NBF4uktYoIyPsTDtOAO6UxD7CUsOmsT?=
 =?iso-8859-1?Q?8Fijo2/vXDbZPzYRSqf5XOVFYVJ/DVptYrzzQ2wbfi/ejUikLW1PorMCxP?=
 =?iso-8859-1?Q?T8Mydn2rvkYuiv+LRViDFr9Hcs6dLoW/Su03rgsK+ox67/bvyT8pR72nwg?=
 =?iso-8859-1?Q?Zk+dsveeE8C+W1x2CrUWqLCtWP/p21FHmO6AKVihsiMrMsPyAr3N8WhLNO?=
 =?iso-8859-1?Q?h3REujKK8bEp7sghx040sx0a0dOgHc0XBZDDDWHqk6ffH3Q2V9WM+yDuIk?=
 =?iso-8859-1?Q?HUJh1dqNEVRbNIFimp4QI+8ShAWTCPQ/wU5mY0NuET/6IMlKo1d/Vm4EpT?=
 =?iso-8859-1?Q?o2tKKU55pXIhuyY3Obji4C0g1NgAkR11W6inaOUNjsB7bntHTu9My3wWSf?=
 =?iso-8859-1?Q?Ofg9ECo/OjKfEemEcBA/JT/bsNKNgMV9A+oPI3Ow5YvfLokW3OdaLcetzX?=
 =?iso-8859-1?Q?37AE0UCchbD2naru5gwbslaj+k4VYy/VFzkQBOHVkYv/sCj5pyKqahNQ2B?=
 =?iso-8859-1?Q?F1Yp09L0gChoPE+TJTpEExeBOeNmUhKRxg+bcmGDFwnTFudLajSyuF/bJX?=
 =?iso-8859-1?Q?yPlBE6u7EzkdDC3JyG4NL5rdiNfkRewLpHSjGdxN3SDmdDpm/Un5YnMDaT?=
 =?iso-8859-1?Q?XJlJQ7e4dfzAXaQiOYGfHLGyOCDdp9rw8XvqasAXJN0yKot4cplFKMjw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd15f87-1eb3-4f44-ec37-08dd3fede3a5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 22:48:31.8158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjEepMZKhr1759uW/AJnxMgjjNyDGwDuwLQuW+ABFLPgdc7ziplRmc//MGtpqLn/7ZersBP+6UR+SBjZxMVGrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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

On Tue, Jan 28, 2025 at 06:10:28PM +0000, Taylor, Clinton A wrote:
> LGTM
> 
> Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com> 

pushed to drm-xe-next. Thank you both

> 
> -Clint
> 
> On Tue, 2025-01-28 at 21:50 +0530, Shekhar Chauhan wrote:
> > Add 3 new PCI IDs for BMG.
> > 
> > v2: Fix typo -> Replace '.' with ','
> > 
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > ---
> >  include/drm/intel/pciids.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index 7883384acd5e..e53d7d9bb64d 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -817,7 +817,10 @@
> >         MACRO__(0xE20B, ## __VA_ARGS__), \
> >         MACRO__(0xE20C, ## __VA_ARGS__), \
> >         MACRO__(0xE20D, ## __VA_ARGS__), \
> > -       MACRO__(0xE212, ## __VA_ARGS__)
> > +       MACRO__(0xE210, ## __VA_ARGS__), \
> > +       MACRO__(0xE212, ## __VA_ARGS__), \
> > +       MACRO__(0xE215, ## __VA_ARGS__), \
> > +       MACRO__(0xE216, ## __VA_ARGS__)
> >  
> >  /* PTL */
> >  #define INTEL_PTL_IDS(MACRO__, ...) \
> 
