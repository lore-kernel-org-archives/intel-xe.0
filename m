Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E0BCA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 17:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E2410E034;
	Wed, 13 Aug 2025 17:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrVNKU2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C6410E034
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755105924; x=1786641924;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B26mQRERvQUiLdCG7QSu87hwybyzuvcri0PEJM6T1D0=;
 b=YrVNKU2k/1o2nsgegOk23/tvL7UUO+1Hq6Fi/t7xzUqAbx3z7TyvNO+/
 FC2tpu9KeycdUNcK801o6R8HASU8t6pBgjx4KJnc6ql/6MHpIWEnCAz/D
 pUcuS56YpU9uLr7GhnDgvu98xXj0uqPNzLa6Wga7RAJS57AoiYcdzVl0X
 XgkOXkFDr8i9ve628Nw3NUHC/JzrNZpptkNtaKv3wp600YMldfC9Feni9
 eW2bObkdsxNftU2rm2HhfUyamYDnUs3Ti86UG9kH8kAI1zzjg/NBXnhgz
 pVEJ3rRN46jDdHYyv+FVO0TLPSN6e2TfjIlZQ2Vho5lprtblq+nc68N0g Q==;
X-CSE-ConnectionGUID: 73+w22QWQziqn3HNK2mc5w==
X-CSE-MsgGUID: 2LG1j8Y7Qt6PLhzbxsI0Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68115124"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68115124"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:25:23 -0700
X-CSE-ConnectionGUID: oD4acIA4RF+Q2riaWQFBUQ==
X-CSE-MsgGUID: S1QNS6LISNasJgea4BXlDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166515280"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:25:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 10:25:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 10:25:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.52)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 10:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmmagqa1Kp2MJ8AuPrpZe8tHczMm2AYtAGaELzTYQ9cLPkWNSn30FE9C5DJmmN1i5XSxCT9Wk4Iw2t3v8aM3s5iNktQh0SWFQUxWbl82NYB9NjeirxmI3kie6tpaUk/5TsiqWiHGV5vI4ipvxUcDFGLy3re1R0ozwaleoTuEW4tyyJs52ltkeDJG7ii+0pQJvzBkdyevKksktpkPuS53C6+5KzuZFtwIHZ+C86S01+/VxByPhYmR217jTu1qM3q1StGEanMdBGy/kl7i/i2s1qn4wp3j0s9RTK8X3Z0HJ4EoJ4aIRsu2J/nXXbaKqHRFkbac5ckWjxJyqmfJwPhVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIHV16yDoICS7G4nl3ZJ0f2ZzhCoKVqssUjpFZBAWAE=;
 b=tgOlAj0wVcOJJ7TqyJpRM0WqMGRhjdc64Ia1YKHPDGyfJxI2yaNGEEjrhH2dG7T8gP/QJ4s9Mnmsgne79GpdESqYzcE83TgR6JwoZ6lopC83OSCToCo8vRPayRdwHPOn0oB+QnpYljR29teFcgRpj9u8PhPcHrMuFz9/jwj/30/40NDQDRU5f+wtAtLjUDvNypyxgCGFru/1c33/96+d5MlnfiHzblXQjUgQaBmlR/oko9xCM7ZUwKrXtkLV8pPwBlEdzFj6/1+x/m+CJTOnRe90PRDfBR9JGbm4cmq3zKezUx3a+20BNuW4XwyNRn6Swlg7geLTMW4i3FXWAzYRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 13 Aug
 2025 17:25:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 17:25:20 +0000
Date: Wed, 13 Aug 2025 10:25:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 05/15] drm/xe: Introduce an xe_validation wrapper around
 drm_exec
Message-ID: <aJzKfYPutxWaObXu@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ef17d0-86dc-4651-edcd-08ddda8e60fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NQP35VmuydXAorwpl/PsE+lEoavyq1E4V4c/fpDQnndD/8VmjP3FtMw43r?=
 =?iso-8859-1?Q?dwtjdfKoWvCPnHClkhBQq6gVNp29fkBeYltlOqKGDsgo7bgrzT6CjEhoB+?=
 =?iso-8859-1?Q?s42JEVa+aU0EkhmL1wkmCn46Pp5w5J9yuDp6BmWLp18SkUzD2Tkuit3ovZ?=
 =?iso-8859-1?Q?oLbFMm6pQdmj6Sfu1DaGkQtJAA7PbDzp98pzNoI7QvBgV1VEUjegnJFRl7?=
 =?iso-8859-1?Q?nT5bpliPxzS0wSnc5e+tM64pR9EeEvkiTLpcSvOW5kZnRBAUr6tm+MEHA9?=
 =?iso-8859-1?Q?eqzQG6YWoqm96q+LMH8UsSYGOHuykxlC7KSovI/vbrJS5EuDXmr4D8TTmu?=
 =?iso-8859-1?Q?GaW0JfXrScBSZtZhUmEjHHCEneUktBIDX2wtdlvLP8luVWp4xGYSghsJin?=
 =?iso-8859-1?Q?QcKent89raoCo6fEwwPKBEBHXLTjbOd632s5yMYArN8iR1/wyJqnpgYATD?=
 =?iso-8859-1?Q?C4Q+Jf83FjEvoF9xM8eAnxoN3dbln/zxn9FvNEWiGPicbke7CDIKYEIC5/?=
 =?iso-8859-1?Q?4tH5sQQPvdUHXIDIFqTKNAfWJvfiUKC+NnJ+nA0NiJVBXTj8zcMf0V59NF?=
 =?iso-8859-1?Q?FrWoeN4sV+iVxwGr8KcmE+Q/vKQvAzyOnK/OUN6+R3+t5KSYQShhtyytMh?=
 =?iso-8859-1?Q?ptIcr+dplbXxPreve8xogY635hOC6ODuVBdKev/643nFuzkJSGahJhD+no?=
 =?iso-8859-1?Q?re16SjA86gcFaSNNxa7z8nrMrWypR8zlPd642LQ+lhYRudpsNNg32q1Z2R?=
 =?iso-8859-1?Q?HB8C4UUNmdcHzyF01GIQ9WJqzfa+doIwi1tP/Evnu6PaIpAKHt5h8H8fvW?=
 =?iso-8859-1?Q?h116uzJrSMUwvuow9s4PehL4F2QYfEuTpQ7ouJGMMY44a4Lk2VU/xbucVr?=
 =?iso-8859-1?Q?Q9qYnAxoDvlNJ0ISyXDbrUtAkbc8YL7ahqrbE5YlUyJo/lc2z+kX4Tg2N7?=
 =?iso-8859-1?Q?gejSaG3aYFY9300bjHPFHvsyokb0mD/8y35HousjdH0mvGLEnLFHXbmj8I?=
 =?iso-8859-1?Q?n+jG1SnXE81A66UvqIJ+l32WvDgbIic2vZRo8IJOZKvBhvH2ztMA0x7aEF?=
 =?iso-8859-1?Q?ttry5ruAMlxx34IItH1K8+qCcy5Q+CFVgrmXIFDDy/C6TFG8R4KbAOI014?=
 =?iso-8859-1?Q?GT04KJozeBtRonjimw3QJrbA25rLdWriu5/k4KkHFO7tdhSU0dAhIiF7/S?=
 =?iso-8859-1?Q?1nZdZO+JOYz5baXrauP2ZTaA3mWeKDeRy/uEkvoPpNulIMEuBIe8IdV8HA?=
 =?iso-8859-1?Q?V6/Wtz9AP+WWTpElfqFf+7IXGI3RAvtPI2Bvp7zlMj8Pr8YnFtRZjnJf46?=
 =?iso-8859-1?Q?odDifl/FQj0QHGAAFKIgm8pW8RcS8AMCkx+ZAKkI0mgA+24pV1ReTVl0uC?=
 =?iso-8859-1?Q?6IjujBRDeWOPGdS2LpdxzxzTmewMm+fe0OvqNGERdWJTrNWxdI3EhXsEOO?=
 =?iso-8859-1?Q?PbU1k20peO5xPuVv5vh+oSxFy4Py6M5N9SU7lPWiG/RmALQ27P4cymRUE0?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wcWd7U5GykmzbZ97XneEKm8cwOHMVhXuHoeHjqG00R4FGg2r4qliLWiSuk?=
 =?iso-8859-1?Q?NkKj5pRg3h/Jb43zUlqARaGlfJwGbxSUOhRSyrLmS3ToMbvA7114TzVh08?=
 =?iso-8859-1?Q?v7aPfmtnJcwpfEXKButPYOsQD+zTV9ckVAeDy09XM5pATflzQBULfyKCJd?=
 =?iso-8859-1?Q?VgzMK0Yr0nGRYsuNSoZDnvXs36sOQ8YQTPWYMC7Hw4e3lgg0IucqmHhmmy?=
 =?iso-8859-1?Q?SKD/rs4ApKXZ4k6TkHVWcl7XDk9Sf7Q9i7+VVHBQa0C3RSPkEeZe/+vLh5?=
 =?iso-8859-1?Q?w5iPvwLdBCfIiFNYFmdq7REIof3uOBF9DeJIL76QHrSBCHFnkKYUtvtSZL?=
 =?iso-8859-1?Q?7T2100xzz9Z5pSwfI+uSKir3VWI8sHViEfFXPKNRjhw660M9Ahlw8UzaL3?=
 =?iso-8859-1?Q?Lksie2rqlGZMQsYmPPhqrXDDO9vVF6VS9kE/BpZ0Z0pG9byO0tv6B+ADB7?=
 =?iso-8859-1?Q?mInt9Ly3SrtU3zPj03GHRupmV+sqLrfMsQ7dufCuFjI+2vECiFs3T+NqMU?=
 =?iso-8859-1?Q?T2wAVe4Kr/ZXsYWaP6aqwvrOXIMYFMonxPHpM+qr+K1W5IUrTIYAq0hZ9Z?=
 =?iso-8859-1?Q?YSXlYZ+k+G0o2Hodhv21jeK9sDdaFiGti8Wb0LXidzsUkcLIlkoYJ2pHPp?=
 =?iso-8859-1?Q?DcEqvld7EHXyzgJr45q8NlMgrcklmwJWr/w838B3hEgmiVjgUpZ+Oac5Bm?=
 =?iso-8859-1?Q?T4LGBhc7tx+5cVQQT3YRlgFHjvZMelkkvhgUu/NoEdVTn67LvqjPf0dyIZ?=
 =?iso-8859-1?Q?hs692rWwwnROUMn5Oa8B0MF7Bc5DFSztuQXN/7DtbWT4HeeyKQtzsqDSML?=
 =?iso-8859-1?Q?atBpz1bBvnATBgwkDcgF0JyVYrixNIWsR0MktsdaQUcpUNfzUVgQcV8qOq?=
 =?iso-8859-1?Q?FolMNwzleN1eKmqmiEVs0d4kdwVfKI9fe1Ofhnx4NguErHD8bXZVDUSXve?=
 =?iso-8859-1?Q?cpK4GfZ3TqLND0oseJi1LUGhkD2qBmmY6oFG+KQixRXM33AX0xOqrwuz0U?=
 =?iso-8859-1?Q?TzZbX7nCNjHJXCSItNZqbxxd7CtgYuIbq0Pl/dl2MdR26fSTwYe4RRbWPU?=
 =?iso-8859-1?Q?aIBVMYbH9i3ijINCgxIJE8RBSZMkG7HU4g6DA3FxIeK1bddnhW0HXq4OiO?=
 =?iso-8859-1?Q?QwQiEIeUZrrEwx6n3XtkdtAb+HWasic3yObng5eGk5Z8OwD2/3hCpfqiCA?=
 =?iso-8859-1?Q?ocooMBRuA8ikBGRK8aVYLmORjeSTUyAJnM0D6sgetyS989EWfWYSU4h2PJ?=
 =?iso-8859-1?Q?7V6LPqZVqOdB0Z11Lm69IMLwjI8WDF/58cRpMNniyp/EhEOQN+p0RQJoOC?=
 =?iso-8859-1?Q?gZdxThajW8uV9eClZGZLwvGDSdmp/ARUevzh8Ohoo9fjL8n/jQwFvgzEdb?=
 =?iso-8859-1?Q?weefMFFQxNJrPyCEgRSY98N6ihfgySyWahaf0EA77W3lBStTp4MANhLQDu?=
 =?iso-8859-1?Q?iodcrE84H/1Lf41cpBqjRzuqtjYpI76QfUNAGE5ruI0OI0RMnzNX2/jnYR?=
 =?iso-8859-1?Q?muh1gJmzpiHgvyWC1wrsIQ5JFg2IOckRRtp0eE3QrSRR+1CopClXR6+O3M?=
 =?iso-8859-1?Q?hGhTpnbjfmnbn0RrGesEG1WqI4YxKLZe/s2ZlQ9JDIRApnSWCM00WDCe2Z?=
 =?iso-8859-1?Q?pE0qF54lhUP5QZ/WAflBMPNBGhLELl+HWlMDCQsUlSZKgGqVIroXRNgw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ef17d0-86dc-4651-edcd-08ddda8e60fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 17:25:20.6597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdW8yJ7IKa8DUDAB1FggVJXYCzfvThR/HXZ+nfG+oKpQ7JiFwRRlOsnRv7SyKJgJsoB8aHPYONFUfxMl4qZ3YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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

On Wed, Aug 13, 2025 at 12:51:11PM +0200, Thomas Hellström wrote:
> Introduce a validation wrapper xe_validation_guard() as a helper
> intended to be used around drm_exec transactions what perform
> validations. Once TTM can handle exhaustive eviction we could
> remove this wrapper or make it mostly a NO-OP unless other
> functionality is added to it.
> 
> Currently the wrapper takes a read lock upon entry and if the
> transaction hits an OOM, all locks are released and the
> transaction is retried with a write-lock. If all other
> validations participate in this scheme, the transaction with
> the write lock will be the only transaction validating and
> should have access to all available non-pinned memory.
> 
> There is currently a problem in that TTM converts -EDEADLOCKS to
> -ENOMEM, and with ww_mutex slowpath error injections, we can hit
> -ENOMEMs without having actually ran out of memory. We abuse
> ww_mutex internals to detect such situations until TTM is fixes
> to not convert the error code. In the meantime, injecting
> ww_mutex slowpath -EDEADLOCKs is a good way to test
> the implementation in the absence of real OOMs.
> 
> Just introduce the wrapper in this commit. It will be hooked up
> to the driver in following commits.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_validation.c | 199 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_validation.h | 107 ++++++++++++++++
>  2 files changed, 306 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index cc0684d24e02..cd1424f04237 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -5,6 +5,7 @@
>  #include "xe_bo.h"
>  #include <drm/drm_exec.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gpuvm.h>
>  
>  #include "xe_assert.h"
>  #include "xe_validation.h"
> @@ -47,3 +48,201 @@ void xe_validation_assert_exec(const struct xe_device *xe,
>  	}
>  }
>  #endif
> +
> +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> +{
> +	struct xe_validation_device *val = ctx->val;
> +	int ret = 0;
> +
> +	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
> +		if (ctx->request_exclusive)
> +			ret = down_write_killable(&val->lock);
> +		else
> +			ret = down_read_interruptible(&val->lock);
> +	} else {
> +		if (ctx->request_exclusive)
> +			down_write(&val->lock);
> +		else
> +			down_read(&val->lock);
> +	}
> +
> +	if (!ret) {
> +		ctx->lock_held = true;
> +		ctx->lock_held_exclusive = ctx->request_exclusive;
> +	}
> +
> +	return ret;
> +}
> +
> +static void xe_validation_unlock(struct xe_validation_ctx *ctx)
> +{
> +	if (!ctx->lock_held)
> +		return;
> +
> +	if (ctx->lock_held_exclusive)
> +		up_write(&ctx->val->lock);
> +	else
> +		up_read(&ctx->val->lock);
> +
> +	ctx->lock_held = false;
> +}
> +
> +/**
> + * xe_validation_ctx_init() - Initialize an xe_validation_ctx
> + * @ctx: The xe_validation_ctx to initialize.
> + * @val: The xe_validation_device representing the validation domain.
> + * @exec: The struct drm_exec to use for the transaction.
> + * @flags: The flags to use for drm_exec initialization.
> + * @nr: The number of anticipated buffer object locks. Forwarded to
> + * drm_exec initialization.
> + * @exclusive: Whether to use exclusive locking already on first validation.
> + *
> + * Initialize and lock a an xe_validation transaction using the validation domain
> + * represented by @val. Also initialize the drm_exec object forwarding
> + * @flags and @nr to the drm_exec initialization. The @exclusive parameter should
> + * typically be set to false to avoid locking out other validators from the
> + * domain until an OOM is hit. For testing- or final attempt purposes it can,
> + * however, be set to true.
> + *
> + * Return: %0 on success, %-EINTR if interruptible initial locking failed with a
> + * signal pending.
> + */
> +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> +			   struct drm_exec *exec, u32 flags, unsigned int nr,
> +			   bool exclusive)
> +{
> +	int ret;
> +
> +	ctx->exec = exec;
> +	ctx->val = val;
> +	ctx->lock_held = false;
> +	ctx->lock_held_exclusive = false;
> +	ctx->request_exclusive = exclusive;
> +	ctx->flags = flags;
> +	ctx->nr = nr;
> +
> +	ret = xe_validation_lock(ctx);
> +	if (ret)
> +		return ret;
> +
> +	drm_exec_init(exec, flags, nr);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +/*
> + * This abuses both drm_exec and ww_mutex internals and should be
> + * replaced by checking for -EDEADLK when we can make TTM
> + * stop converting -EDEADLK to -ENOMEM.
> + * An alternative is to not have exhaustive eviction with
> + * CONFIG_DEBUG_WW_MUTEX_SLOWPATH until that happens.
> + */

I vote to keep this the way you have it and live with the abuse until
TTM is updated.

> +static bool xe_validation_contention_injected(struct drm_exec *exec)
> +{
> +	return !!exec->ticket.contending_lock;
> +}
> +
> +#else
> +
> +static bool xe_validation_contention_injected(struct drm_exec *exec)
> +{
> +	return false;
> +}
> +
> +#endif
> +
> +static bool __xe_validation_should_retry(struct xe_validation_ctx *ctx, int ret)
> +{
> +	if (ret == -ENOMEM &&
> +	    ((ctx->request_exclusive &&
> +	      xe_validation_contention_injected(ctx->exec)) ||
> +	     !ctx->request_exclusive)) {
> +		ctx->request_exclusive = true;

Can the locking across multiple GPUs fall when request_exclusive is held
and the GPUs are sharing dma-buffers? I suppose we'd need true WW
locking throughout the stack (TTM) and a ticketed retry to guarantee
foward progress.

> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * xe_validation_exec_lock() - Perform drm_gpuvm_exec_lock within a validation
> + * transaction.
> + * @ctx: An uninitialized xe_validation_ctx.
> + * @vm_exec: An initialized struct vm_exec.
> + * @val: The validation domain.
> + *
> + * The drm_gpuvm_exec_lock() function internally initializes its drm_exec
> + * transaction and therefore doesn't lend itself very well to be using
> + * xe_validation_ctx_init(). Provide a helper that takes an uninitialized
> + * xe_validation_ctx and calls drm_gpuvm_exec_lock() with OOM retry.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
> +			    struct drm_gpuvm_exec *vm_exec,
> +			    struct xe_validation_device *val)
> +{
> +	int ret;
> +
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->exec = &vm_exec->exec;
> +	ctx->flags = vm_exec->flags;
> +	ctx->val = val;
> +retry:
> +	ret = xe_validation_lock(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_gpuvm_exec_lock(vm_exec);
> +	if (ret) {
> +		xe_validation_unlock(ctx);
> +		if (__xe_validation_should_retry(ctx, ret))
> +			goto retry;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_validation_ctx_fini() - Finalize a validation transaction
> + * @ctx: The Validation transaction to finalize.
> + *
> + * Finalize a validation transaction and its related drm_exec transaction.
> + */
> +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> +{
> +	drm_exec_fini(ctx->exec);
> +	xe_validation_unlock(ctx);
> +}
> +
> +/**
> + * xe_validation_should_retry() - Determine if a validation transaction should retry
> + * @ctx: The validation transaction.
> + * @ret: Pointer to a return value variable.
> + *
> + * Determines whether a validation transaction should retry based on the
> + * internal transaction state and the return value pointed to by @ret.
> + * If a validation should be retried, the transaction is prepared for that,
> + * and the validation locked might be re-locked in exclusive mode, and *@ret
> + * is set to %0. If the re-locking errors, typically due to interruptible
> + * locking with signal pending, *@ret is instead set to -EINTR and the
> + * function returns %false.
> + *
> + * Return: %true if validation should be retried, %false otherwise.
> + */
> +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret)
> +{
> +	if (__xe_validation_should_retry(ctx, *ret)) {
> +		drm_exec_fini(ctx->exec);
> +		*ret = 0;
> +		if (ctx->request_exclusive != ctx->lock_held_exclusive) {
> +			xe_validation_unlock(ctx);
> +			*ret = xe_validation_lock(ctx);
> +		}
> +		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
> +		return !*ret;
> +	}
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index db50feacad7a..a708c260cf18 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -7,9 +7,11 @@
>  
>  #include <linux/dma-resv.h>
>  #include <linux/types.h>
> +#include <linux/rwsem.h>
>  
>  struct drm_exec;
>  struct drm_gem_object;
> +struct drm_gpuvm_exec;
>  struct xe_device;
>  
>  #ifdef CONFIG_PROVE_LOCKING
> @@ -66,4 +68,109 @@ void xe_validation_assert_exec(const struct xe_device *xe, const struct drm_exec
>  	} while (0)
>  #endif
>  
> +/**
> + * struct xe_validation_device - The domain for exhaustive eviction
> + * @lock: The lock used to exclude other processes from allocating graphics memory
> + *
> + * The struct xe_validation_device represents the domain for which we want to use
> + * exhaustive eviction. The @lock is typically grabbed in read mode for allocations
> + * but when graphics memory allocation fails, it is retried with the write mode held.
> + */
> +struct xe_validation_device {
> +	struct rw_semaphore lock;
> +};
> +
> +/**
> + * struct xe_validation_ctx - A struct drm_exec subclass with support for
> + * exhaustive eviction
> + * @exec: The drm_exec object base class. Note that we use a pointer instead of
> + * embedding to avoid diamond inheritance.
> + * @val: The exhaustive eviction domain.
> + * @lock_held: Whether The domain lock is currently held.
> + * @lock_held_exclusive: Whether the domain lock is held in exclusive mode.
> + * @request_exclusive: Whether to lock exclusively (write mode) the next time
> + * the domain lock is locked.
> + * @flags: The drm_exec flags used for drm_exec (re-)initialization.
> + * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
> + */
> +struct xe_validation_ctx {
> +	struct drm_exec *exec;
> +	struct xe_validation_device *val;
> +	bool lock_held;
> +	bool lock_held_exclusive;
> +	bool request_exclusive;
> +	u32 flags;
> +	unsigned int nr;
> +};
> +
> +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> +			   struct drm_exec *exec, u32 flags, unsigned int nr,
> +			   bool exclusive);
> +
> +int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct drm_gpuvm_exec *vm_exec,
> +			    struct xe_validation_device *val);
> +
> +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
> +
> +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
> +
> +/**
> + * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton transaction
> + * @_ctx: Pointer to the xe_validation_ctx
> + * @_ret: The current error value possibly holding -ENOMEM
> + *
> + * Use this in way similar to drm_exec_retry_on_contention().
> + * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
> + * blocks other transactions and allows exhastive eviction. If the transaction
> + * was already restarted once, Just return the -ENOMEM. May also set
> + * _ret to -EINTR if not retrying and waits are interruptible.
> + * May only be used within a drm_exec_until_all_locked() loop.
> + */
> +#define xe_validation_retry_on_oom(_ctx, _ret)				\
> +	do {								\
> +		if (xe_validation_should_retry(_ctx, _ret))		\
> +			goto *__drm_exec_retry_ptr;			\
> +	} while (0)
> +
> +/**
> + * xe_validation_device_init - Initialize a struct xe_validation_device
> + * @val: The xe_validation_device to init.
> + */
> +static inline void
> +xe_validation_device_init(struct xe_validation_device *val)
> +{
> +	init_rwsem(&val->lock);
> +}
> +
> +/*
> + * Make guard() and scoped_guard() work with xe_validation_ctx
> + * so that we can exit transactions without caring about the
> + * cleanup.
> + */
> +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> +	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,

I think this should be 'if (_T)', right?

> +	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl);
> +	       _ret ? NULL : _ctx; }),

Or here '_ret ? ERR_PTR(_ret) : _ctx;'

One or the other if I correctly understand how DEFINE_CLASS works.

Matt

> +	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
> +	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
> +static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
> +{return *_T; }
> +#define class_xe_validation_is_conditional false
> +
> +/**
> + * xe_validation_guard() - An auto-cleanup xe_validation_ctx transaction
> + * @_ctx: The xe_validation_ctx.
> + * @_val: The xe_validation_device.
> + * @_exec: The struct drm_exec object
> + * @_flags: Flags for the drm_exec transaction. See the struct drm_exec documention!
> + * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
> + * @_excl: Whether to start in exclusive mode already in the first iteration.
> + *
> + * This macro is will initiate a drm_exec transaction with additional support for
> + * exhaustive eviction.
> + */
> +#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
> +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
> +	drm_exec_until_all_locked(_exec)
> +
>  #endif
> -- 
> 2.50.1
> 
