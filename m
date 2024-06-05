Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2A2C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 21:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B3310E072;
	Wed,  5 Jun 2024 21:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YI3+xlKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05B110E072
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717621770; x=1749157770;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pMyn9ZOp9gcyu4ZMknWAiLGWn9lDFU+p8P6gmLgN6TE=;
 b=YI3+xlKCWy3NruTA2YNONN8EtDILI9jj6KybVISlcFPL+Es1X0HfyuKW
 4YKGouSABdtEjFkDW+JbLoiyY/hqSxP4FqBRS0KUG7qz7BWfQdnZoefFx
 FdAeCAcdUK5dsS8ZL0H+MNOyXRgeofj3YgQ43WJdUVV0vI4ZpGJLfrE3u
 dltB5aT1h66Dr+W1GVeT1ETbmuCto/UbeYT/SUADmsofAWQONc+OUULvQ
 z8y56uvB9HW3C4VxaapNsVQdnTCRGxKPPnlfeSRTDBga1XucUCTwIKrXx
 ddTcmn0CxZkEgfHVuTAUvXdCYjAndH5DI/HHlvvvlNynKLBxLK1rN9nrW g==;
X-CSE-ConnectionGUID: aX2VMuFjQQi71pO3kNYckQ==
X-CSE-MsgGUID: CcThCqKmSEebBO8mh2+YEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="36789190"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="36789190"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 14:09:28 -0700
X-CSE-ConnectionGUID: x+3S4DpvR/q+wVwLAOBbtQ==
X-CSE-MsgGUID: qVLNBD9pQOe3W1SvsDPisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60914430"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 14:09:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 14:09:27 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 14:09:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 14:09:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 14:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmafDq3GKtiXNTl7Ec3ndSnRoBj0QCDstYficlqHTYCeipXMIpAElZUa4Iku3x2QG+yWR3Xy13AtSlezdoxYfrQyIq4xeYQxQP3osFVk59X+efDvlBplgtuWiBJTZgenD5xUgqm4VLD9jjPF5VzI/0+1Y0n/S4EzNac1y1UJKBOFjBfVDZN2obeylnlWUTAf4n/91WJEqaC4ZSTYDWUBI43u8bf2o3yg+u4rcFo2aEvvjQt281jwOXyMiL+1EEb3QNCI8PIy+4gF7O1hXVZRpW8aNZUrn9OQLFgsR7wNffhdCvT8KoXTrUTM4PntyVv4GEVfKZMnkGOrynUPb9kuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZmi8Pea1Z2GDaK1f+2WiASBiS63+mTZzXYT/crTsa4=;
 b=DhDz+tzMiIjvGa3LtuP94b4dzu3TTl8VonP11BjOUEVQmPcklYRO9bnULeE6C4EgQQaDdj/AmeUQOv34OjggNg8wtGnzJE72rBXsxoWzJxBW8WcwEGIv6fpyz7aDEkg2kPuGaLEM5l0SbIC0pwa2hcUtkKN+OBe3G7DBMZf4j3MCdVdH9ltpzDS6tdy/ygGVa5YUsMnTuCmPqqkkieX1N0k49dZmVMBL18yHID4htT7b/kMnTL/KyyNt0R8yY0xYMTs+2YtK452dEHi5LzKkKXp9qh7IclPPnY9TdrD79zVXWPdbww6m2RsjTCUkm30jgJys1VU0FFVtVs+RAXLS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Wed, 5 Jun
 2024 21:09:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 21:09:17 +0000
Date: Wed, 5 Jun 2024 14:09:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Message-ID: <20240605210915.GD2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
 <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
 <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
 <8cc78563-5b65-40b7-b5d4-49fed52c6b88@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cc78563-5b65-40b7-b5d4-49fed52c6b88@intel.com>
X-ClientProxiedBy: BYAPR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3756a1-14b0-4c03-beb9-08dc85a3c2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lKQy9V1kZ97JbcWGkVm3RPJC+nGumyIj/zJ3cEw6oFmsH50ZyGUQoufC66?=
 =?iso-8859-1?Q?i6imlNSULQ+Df3qg2edGdntpcpdtmQ/6QzQyPZQ9jVsm5oLTqyH97H8QOF?=
 =?iso-8859-1?Q?IZ4Pro1zqJh57z9t/xIFoG8KxoUkhpuxsZ32xV+AonjCXK0jdhXoWydSKR?=
 =?iso-8859-1?Q?QEqfDCkcTMzARWSj5pte9c1oykLVGRPPXrfF+ND45TzQZDTW6IoUlC+aTT?=
 =?iso-8859-1?Q?7w3k91iUN6dPTNG2BkVMuDwvbjYEXRKjpv9+QlWL9gHDzgq4xDgf2LeGnK?=
 =?iso-8859-1?Q?GCKauNklg5iX2C8kk6XW15nw7j5AuqPy5V6mUEQcTP7PpEY2kdp3KWp72l?=
 =?iso-8859-1?Q?bWMRuUE/x8TsT0nJRGFzqFGo+neGFjMsL9ToeGVCRJCMaTT0xtHRZgzXth?=
 =?iso-8859-1?Q?ScRxGY9k1DQzWdkOu2R70naDunDZv8bSbTOFI1awnlOepgm/TbaV2lvZoR?=
 =?iso-8859-1?Q?JvbqtJMxC+frGyMnam/9AxiJy7jtjFqun9T1vdjTecBgR48x945HgzuwBz?=
 =?iso-8859-1?Q?T/y95pSdEEPT3lxyKcyDJGnQFwiSj2hBlaF1jz8BB4WOSSY9C0UXHOmibn?=
 =?iso-8859-1?Q?tBj69Z5msUsJ6vfeaITd4qvcF0VcNZ7JBQgUgs+hdx+sW8KA0v/RRuH+lA?=
 =?iso-8859-1?Q?9bTHusGphygZif0QurGwrrfe78JAeSfFQoJgHkFa7szDrNmDMfiMqRfwdh?=
 =?iso-8859-1?Q?evLhSqSI5UF5VocoFBeABilboxQt/CJskTYemGtv2IuA79p4xWzt3TZudU?=
 =?iso-8859-1?Q?7BvFW7yBASKn72PAvyXvwSn7q6X51bta7ltPq/9bzxsn+bJyxyI1iFDBHK?=
 =?iso-8859-1?Q?ZPk59H+n7eHLbL/dEgYQBMWt5OL42P/B30/0nmgFxhypqtE2EbGvGfpfXI?=
 =?iso-8859-1?Q?lJgy0ZcRIFl1dpDdqK2tms3YYHfORyrt3Wggg2qJmtzT/Fw+7jY/k32Fmr?=
 =?iso-8859-1?Q?DlGsxeD+8NIc29cIRUTLlyDjaVlw8vow4Mzu2HQKip6tfYi92vTutoYxza?=
 =?iso-8859-1?Q?dUcSEfobTe7DIhVJ9gLv8EgcRrStRhwcdvRoRiiangJwS//qoOCkUPphcP?=
 =?iso-8859-1?Q?+OaA6BRFbvUBz0a6icRuQj2P9K7ssISUPLIdSTh2ql0Xm7JfwsiOjNnXcC?=
 =?iso-8859-1?Q?QV0fXOweCNwx798HRa0N4zDHMmbA8uXGRekAJGRir1aHnlTd/VgdK+pzTM?=
 =?iso-8859-1?Q?Tzmnbt9yXtk0dGa+Ka/en7N2ZprZyARyzeoDpvdmnh9Zj4PXqeyNiBi20o?=
 =?iso-8859-1?Q?jooIzVU7SmZ3ksi8pUJucumrbxYFPl06TRcHIJEsIAEvcr20AtK0x9h3NN?=
 =?iso-8859-1?Q?M4m2NC7brgWjk+TgmVX2NTQz8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1NGSpYV75bRg6+3KoY52dxaHrizQhexwemhM6lFshJnMRRf/WlCXGrQUSc?=
 =?iso-8859-1?Q?qybQdg9p8vne2i0EkemzCLUjLD0ubPjqTYYLLLqVxrzjHBJDbdovy89dvH?=
 =?iso-8859-1?Q?LuT/mtrzFOc8B0Y5wWbS33bimFSgt9knS+Bzbmf7f5i5MCbnxuVDX//wFx?=
 =?iso-8859-1?Q?i4FQnNUFWAxyQ6xJB60675pbFDT9V2mTMSoGyCZkjMv7Vk2RsyGBsRLw27?=
 =?iso-8859-1?Q?9XMafc40ybcar1wrmD4/V2BrRDz8TCRmnXzW85PoHHL4d5wJq+A/QYwWmd?=
 =?iso-8859-1?Q?Ij89CssHrMF1SBxaw4yH3Pg+FW9DBGMBRqL9NZRIekcqs3zWZvePW6Pe9T?=
 =?iso-8859-1?Q?LONsTWZABw2IhcdohRL4JAOKCBu4+8cViHuRiqpBXTmZIiMnB5D7Ri6bq0?=
 =?iso-8859-1?Q?CFk/EHb22EQ0qRRELq1GIdMcLxiFbVF4uzPesOPYsVSApSd5ZWcsLBDSVa?=
 =?iso-8859-1?Q?QkjjmkOuY+gtUl4kboVkDxFHLrFlFpTFWeHrBQNEcC4bSbHaOKKEfq/Cvf?=
 =?iso-8859-1?Q?+ar2WcgaeJTV4GPlRqfmvhFcCfkitw/Kw9ewAm3gBMjL43ZyppumjS9qRu?=
 =?iso-8859-1?Q?RfoMWll1OfU5Tr6JHdYZqrte/K2vx/IB5Tatoe5GCdJqiu4lZZJx5t4/6m?=
 =?iso-8859-1?Q?KvvmbA7mvaUHF5sdzDXZgCZgVj7HsCiiYnko3wg1r/7Kd0yrvgBr2NnF9R?=
 =?iso-8859-1?Q?owKNHkqQsLkF36Yj15MHjXNFRbOB85346bAo9zQBOQpGedvJsJ/0yTvlm6?=
 =?iso-8859-1?Q?3AVnSKqO0S5QvwKp+GdD7z4A2RDDTgZjfGSn+u1Bz83gAv08OGU4MBPtIv?=
 =?iso-8859-1?Q?fq+qOn74nedy+1ViJ32mOKp9IPCj10oFCfAuNiECO/gzo3kH7uDC5h+WJk?=
 =?iso-8859-1?Q?RivGxso/0OUyE5+gQfJmLtQuZY3khkeaaGV4p9iexHJO8ydz41CfSV2MLD?=
 =?iso-8859-1?Q?SOV3toe/nCwsb9+LYHR0MlQaz7hLdW1/OB4UnvXQXM3vlh83zaUHCp70fW?=
 =?iso-8859-1?Q?L5fVUiAj4tTUmqVkREQvycIi76R/eO4HCHNR8RBjAs9hzyspJxXa7M1m6+?=
 =?iso-8859-1?Q?eUnOlECbQEz/OJzq8MG1bvk5j5Yr45lP7oJ7RP2itKT5BW1ECC/N4s8rsU?=
 =?iso-8859-1?Q?Qz/xpkpzzUUl82mb8SQ5QvL67ajhmqPald5HSKjUdIY721CFuh+p415WVA?=
 =?iso-8859-1?Q?wPcKk+4szKzu4qbx/vG8Pykez89l42eYXk4nBl0I8XpJSblxr1zQg/NWDN?=
 =?iso-8859-1?Q?n7A8UQ+UXjhBi2pMlfVwazdqhZKhvtPNCMJPSuFJLsBe7U7uee/fZBFw8H?=
 =?iso-8859-1?Q?No0R/nKPLEsAxQ469kGn7k/5ei5I7h7QSPV2K5VJK/WEBB7uj1BvVtZhe1?=
 =?iso-8859-1?Q?Ju/8l/a3cGMxlukBx+g8B0cgs101bb7bS1si1nG8RF4KsulbkKMtV32HHP?=
 =?iso-8859-1?Q?LU6bd4DGjxOYDko5cblYJFblxH1ZncdtlUNxWxQIX2F6fTlnhjlWjzE2by?=
 =?iso-8859-1?Q?8hSSSBeTrmsj05HaFWVzW8Xou9gXEqsofQ3zgu5aeasAP+bAFRm35ariby?=
 =?iso-8859-1?Q?Vz8P35CeBykvkOnVJARnu4TFZ3dcjXcOwT0CHxYL1uttCtiOIFBtS5gyJf?=
 =?iso-8859-1?Q?TpPE4j5liUQg0zQnFtp3seoAgOJS/boyJ5MJLT0ZmPSosoLiaWzEfh+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3756a1-14b0-4c03-beb9-08dc85a3c2ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 21:09:17.7605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTeU80D5yCuKvkTm5zPr5ThBI67M1Nd0ngbgFp/gaFjeUjG31A24UPGP/9IG0xS5dhosXU61f/lqqA7aWcK2ur9iCoMi/mNKweZ5aXCmF2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
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

On Tue, Jun 04, 2024 at 04:22:00PM +0530, Nilawar, Badal wrote:
> 
> 
> On 04-06-2024 02:33, Matt Roper wrote:
> > On Thu, May 30, 2024 at 10:09:30PM +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > On 30-05-2024 20:14, Nilawar, Badal wrote:
> > > > 
> > > > 
> > > > On 30-05-2024 19:51, Nilawar, Badal wrote:
> > > > > 
> > > > > 
> > > > > On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
> > > > > > Make sure that the assertion condition covers the wakefulness of all
> > > > > > domains for XE_FORCEWAKE_ALL.
> > > > > > 
> > > > > > Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of
> > > > > > XE_WARN_ON macro")
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
> > > > > > b/drivers/gpu/drm/xe/xe_force_wake.h
> > > > > > index 83cb157da7cc..9008928b187f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> > > > > > @@ -32,7 +32,7 @@ static inline void
> > > > > >    xe_force_wake_assert_held(struct xe_force_wake *fw,
> > > > > >                  enum xe_force_wake_domains domain)
> > > > > >    {
> > > > > > -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
> > > > > > +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
> > > > > This will always assert for when domain FORCEWAKE_ALL (0xFF).
> > > > > Not all the platforms support all the domains.
> > > > > e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use
> > > > > case only bits for GT and RENDER will be set.
> > > > I think to handle this correctly in struct xe_force_wake you can add new
> > > > enum xe_force_wake_domains supported_domains to hold bitmap of supported
> > > > forcewake domains. Use this bit map to check appropriate domains are
> > > > set.
> > > 
> > > Hi Badal,
> > > 
> > > Thanks for taking time to review this. Agreed the check should be based on
> > > supported domains.  Will look into this.
> > 
> > I guess the real question here is why we'd ever be passing
> > XE_FORCEWAKE_ALL to xe_force_wake_assert_held().  That assertion is used
> > to sanity check that we're actually holding a necessary power domain
> > before performing some operation that relies on it.  Nothing in the
> > hardware should ever actually _need_ every single forcewake to be held
> > at once; we just tend to grab XE_FORCEWAKE_ALL in some places of the
> > code because it's simpler to just blindly grab everything at once (even
> > the ones we don't truly need) than it is to figure out the specific set
> > of domains that will get used.
> 
> In the save/restore code path, both at the top level and in subsequent
> levels, xe_forcewake_get() is called with XE_FORCEWAKE_ALL, as I believe it
> accesses registers from different domains. In my opinion at subsequent
> levels we should
> %s/xe_forcewake_get/xe_force_wake_assert_held(XE_FORCEWAKE_ALL).

We just grab FORCEWAKE_ALL because we're lazy and don't want to add the
code complexity to figure out the exact subset of power domains
that are actually needed (which may vary by platform).  We usually do
FORCEWAKE_ALL in places like device initialization or suspend/resume
that aren't in a hot path and are only going to take a couple
miliseconds total.  If multiple levels of the call stack grab forcewake
redundantly, that's fine; forcewake is reference counted, so the calls
lower in the callstack just increment the reference count and return
immediately, as we'd expect (assuming every get has a paired put).

xe_force_wake_assert_held() is intended for places where we know we need
a specific forcewake domain and need to make sure the function never
accidentally gets called from somewhere that the domain wasn't already
held.  I don't think calling it with FORCEWAKE_ALL make sense since that
implies you don't actually know which domains were necessary; if you do
that it will just impair our ability to do more focused forcewake
acquisition in the future.


Matt

> 
> Regards,
> Badal
> > 
> > 
> > Matt
> > 
> > > 
> > > BR
> > > 
> > > Himal
> > > 
> > > 
> > > > 
> > > > Regards,
> > > > Badal
> > > > > 
> > > > > Regards,
> > > > > Badal
> > > > > >    }
> > > > > >    #endif
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
