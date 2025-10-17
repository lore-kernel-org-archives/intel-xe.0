Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038BBCCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD29410E2E9;
	Sat, 18 Oct 2025 02:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="De9VTmzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3A810E2E9
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755467; x=1792291467;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sFtNlFQvKTkK6sNFuaEl8gRawrH9x2pMUC9xoOqF2x4=;
 b=De9VTmzEcho01vdARSLyEjr/bLWNhyexRZjzMJC600r3gC2qwe6HP34q
 rWgG9qiKG6KsqSWzKFoGJ/8FI6Ay+qc2WH0bDnlgfXCmMU+wEJl4hEuFe
 9YvrR9Zwn/7mcQQXpQ16rIdW2bcJ0ySb8tgAnQ7O2FFiSTMsAhuruhIPD
 NA+hghAqorQ0U6Sw12D0yXgHKtcS2Iwjo7wLW7f9MwVGu3Nb8S+c+FWbJ
 luxZiGYP6UIzil09OSy5YHr0hqyLG1A9WkoKoeOWTZOspzjlrVzoJ5dIG
 j7azgQhSwSaDABha2Z9SRDn0rmr7+DbqVXobFGJ9+Edm2KTKSav8C882F A==;
X-CSE-ConnectionGUID: JqtrMhzMTjOzmyY52wSpaA==
X-CSE-MsgGUID: vHzQHUSGS1qoi689EsR6PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62180221"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="62180221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:44:27 -0700
X-CSE-ConnectionGUID: /+fTa1p+RriFwTD+d0ZdEA==
X-CSE-MsgGUID: A3Er9wriRVuzYdJloV1DRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="182567541"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:44:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 11:22:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 11:22:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 11:22:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc/WbPkVviAaFrYiF/bYR75tHieEiR6URhU4Ib3jk56j3g9EFaz8coTrVOeq7JNRYYMJu7AxGj7oCpkstdXlcl+Em8+XHlQSjSElNFm9SsMHHIzgNbKukblDrqJCyH2b2JM5NvHJsElV56SV+3ECSKmZry5CNLgMoGaRDM019h3AboGFgmLl93onPQ706A0XOof1Qb+zkcc2dH84up6A46rdAXbRXTNwKJp9M87DeI9AJ2Gl4R8jN7hoDEgeoHweiexsWELu3M/NJ5lddYxbkcLkidfPvdgxQbrLVzJEDgM4sdj0HCnql0OHScTOOhJZvIoyFNA4KcecOJ8V2ipx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7WnRoy2vPsX87+CDk7sN1VuvnX+stwnl90nmBJdAJw=;
 b=RTOntyhmIIDrjoB+8B+FvY+BAmJ2rN2/oP1tZCAS2tIEWx9qgx7nzrtv//Amvgb59TIsFQJSo+mL485JZoqhHqw7paS8eAOSOEUApeeCxkPoBrQryBZlRxlZZSP7bmbZ4nvv3qRXNI0dW3RUvkZu83tb52Jl1UyEwbm5qdR7uY6XWHyTGw80PFhwgOmVC/ljkM3fqLh0UBAVMQT/b/6AHwSjrYKa30zAph0Db6CwtCk48KaBnfXdIBLFfr2gKCR9ALpmvhhlWIRwyPq4TUeCm4L6n5mobr7gftkh7C16OMoBDITRpp9rCBY0O+9YWcGK1NuXXelt4aQGYR/IQDVr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7360.namprd11.prod.outlook.com (2603:10b6:8:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 18:22:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 18:22:03 +0000
Date: Fri, 17 Oct 2025 14:21:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aPKJRxvJzdvEZ69f@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com>
 <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
 <aPJgP9ShLrvSeXzU@intel.com>
 <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
 <aPJ0I7V4srCj6qo4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPJ0I7V4srCj6qo4@intel.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b680d7-f927-4cbf-22ba-08de0daa121c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?O7MvAP3m4Slv4mcdHAOtnexaG8tvw9acEGsZr68fTfduMtcYCJEEKm+8lg?=
 =?iso-8859-1?Q?FPxlp0lanLGpQWby6Deo9F209Pl/cczAnFjDv7EsrIk+MTusvx+N0Tm2o8?=
 =?iso-8859-1?Q?cZuIvO3fa7EDRydvQ6yuwKSTWuh3zrrgIk6RW1FNApxL+J3UDJs60el9l0?=
 =?iso-8859-1?Q?QQnEjHiNLe4gUlmB1ZmDCMVy3N3ENaG6WJust0UStu/dQ5ZR3xYODecOgz?=
 =?iso-8859-1?Q?YIZ8OpEIFSYh5VX6n2xpKMflQ3AA9sH3Vm/PpKz4LqqtQv0/Jfm65vPfDv?=
 =?iso-8859-1?Q?XmG4AfuHXItjMyBPV6VmnGA26c35okx+/W4A0PFbu4FZzxH3LolMx63FLj?=
 =?iso-8859-1?Q?2a1g6urRu54BrgZRNBcXbE4o2BkyjVcOlTYrbq/bA+P9jF6FINPbG6J7rZ?=
 =?iso-8859-1?Q?PJInH8bhIhtNG151oXOHlHqj5PA5JDb0mhZ1atMlazKEliiTIM2NyRKl2p?=
 =?iso-8859-1?Q?wEn6/TiKoBOXwhHkB9qm2pepRbiuc6M2/BTVokzkvrXMRPl4rSN+xjPg3l?=
 =?iso-8859-1?Q?jcPcpKOKCznOVaHbkUGRnNV70r4PEzJ4e5pM476PFIWiYTTOxSazbk/nYb?=
 =?iso-8859-1?Q?N3xlYSZozl+R/d6npCYZZT6YRz3wevVmp6LYWN1UVrsl3IeaO0IdasMnuI?=
 =?iso-8859-1?Q?WBJS94YJLxy/uRt69PHq0mIauwGmb260SesEIiNwdag2RnBK2m2md6hoEj?=
 =?iso-8859-1?Q?1Adac/531wTxVHwRvCkwTuASHCn2QzWAb9YALU2onrqt4VZUWK7avADWk+?=
 =?iso-8859-1?Q?Q/TRYS954s+W0FnVo11h6YfLWYEcDjZ9kj/qO4DLCy3+T/tIYMaczlK3Vv?=
 =?iso-8859-1?Q?5ljniqROgciZEo/tr9FhA9jnNZ8Qym4KhhrSOUIDE4tDco7vmJ80SlwS5T?=
 =?iso-8859-1?Q?DQTqrnZMax2RhltuzowPXdjUYEdD+3Gyu6U/iTrK6HM7tqCDM9gX7gZaEv?=
 =?iso-8859-1?Q?SEtQRfGrzQKkzJ6Idwxc+3C2fRch9P4eKjbTtKEwXIThD4DI/OVcV1S3g3?=
 =?iso-8859-1?Q?l1/E8n7zrXAnJUriWwlj4S2vMSsKcyAx6gDKXsHNt61VN5LoTh+YRTfBVI?=
 =?iso-8859-1?Q?M+FNvOyCFxYvxz0Ge/uEDH9RQcmV/qqcsPC8UO42bFiPeV/6qMBzmqmLmB?=
 =?iso-8859-1?Q?fHDtIouAxWwva6rEPcuXvywQYQjftnP4OvHpEiVGfkBJrNkzVNEHB+mbrN?=
 =?iso-8859-1?Q?zuaRUgyKhi5LtJKM+erT9w4ASzCDeENXlvTPDHuSprzuX4tS9NdF7B/PA4?=
 =?iso-8859-1?Q?mSCt62d5/s+z3qo3L70FzzLuDWpUC0iYDvaTadG0qiHjXvEdAgMNwSxmg6?=
 =?iso-8859-1?Q?g/lfds7uAoud0qAUsOAoLTFbXrjjW/h7FhlkYP5IuJE629tnqVXKB6NXQl?=
 =?iso-8859-1?Q?AidtukVpvC9h5K3hcFzDX4xGUgJWfNvq90mVJzFoO9tcuXo2NZUbPu5Xnv?=
 =?iso-8859-1?Q?1gD+jMXCN6Ex4HU4T5XfRmu194/j3kK3hlau7ZSrJoJt1uCcL3/NraO1dY?=
 =?iso-8859-1?Q?7B+tcula4jQMkBy//1BU3O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?p6SJDUCy+WLa4gZXIqhHiCqi2ttq4aW0QAD6auYucZiVqG4dLTwl5G7lwQ?=
 =?iso-8859-1?Q?jJYheVUYLLc8tHF5Hm+UsedkdFBGIb3zPo03NV5Tm/+wtuIhJWOZ67x7of?=
 =?iso-8859-1?Q?FSZDZO2y0fqnV6Rgt9lAABgLtltAXw0aDgcyendityGeYUcpk5GHmHLt3W?=
 =?iso-8859-1?Q?UWL8bcWdblF57fUHotmi2XcqUS5ogwfABdJb+HX/FuA5J3BeVxYLpjr2/z?=
 =?iso-8859-1?Q?tUflOKVLASzpAvrJpjO98nS6gG8yTtzQOE8SPSdxPLWe3ne+/Rp/xB0bQO?=
 =?iso-8859-1?Q?rvbf0XKdiZs3mVjL/CzG6tBJMq9VQJuCih422iKYrRjrEp/eHvhDzlkwpQ?=
 =?iso-8859-1?Q?aJIHEwkLruDjiQokxfANKznAPaaBLos8/NyW1OkGAECwpEbBneuijSNTY4?=
 =?iso-8859-1?Q?Yc2EfYNZURjv7nZ/Oy6gjNMQYb6e9HFnXnpysqtBW6dx42zmcJ98annhE7?=
 =?iso-8859-1?Q?I3/DcuRut9NS3afK6GAG6XH0cAclMUiTAaqLgOzvajVRblPH7rVyYlxZ5T?=
 =?iso-8859-1?Q?WilPbzq1iUuEj1RaS75/LpCFhy4H6qh6KbqdL/CikC+mpqXZkAPmvys8Px?=
 =?iso-8859-1?Q?0FZsYVD8X1kGfZWZadU0dFkBC8jHN0ml2pqlwjoHC6BZ8duZ5JzDSv5p5M?=
 =?iso-8859-1?Q?x1ib+TirQ119kS3km8Hj8KU5mcXqLnoimGIIx9Z1RRRwLWT0H/DyFcbBAt?=
 =?iso-8859-1?Q?1MTmGlLf2DQbTPOnaSULX+WzZyFOopfilovDx4RwO26L43WTZ93/w3yFgC?=
 =?iso-8859-1?Q?nqtked89hNFkze8Dw05fm7DOhNM3CwUGY+bSbqfNJATbq3QzQpwn26OKlr?=
 =?iso-8859-1?Q?PuLKvGyk4k1TNWLfpmpGikr4dLa1eZF9P7ZZ9BgtiFcsv+6NZjhYccBD0R?=
 =?iso-8859-1?Q?ayy+6kJddHgFLElobk02EvT6ckRwpvE8XcxWZwwu63rApk/Kw1GnCdzZ+G?=
 =?iso-8859-1?Q?7VuVzbukyuXDjzuyuZCIag6m9ieCdY2+ZnMZp5NCO83OZsfoyvLOja1wPL?=
 =?iso-8859-1?Q?fRZm5W8MyzLtz8wCvDt/QI5bRo4ZkSUFuCCHJ3diQnER0hGLeqU+Odkn1q?=
 =?iso-8859-1?Q?yWFOUkn6TykaRV1wNDBTQcqSDavOOKAMRKDEXYrXjPY/UrOQb+P3uMPqhf?=
 =?iso-8859-1?Q?mc+oWf3vouJMnhkXOutT6K1MwVnHsmrGQhwPdoP8rVZuhpJ3P+7DYuwXlU?=
 =?iso-8859-1?Q?OGE62BiiuyUnHdqXTvKDSNpQMvbR0hNhLapLTmeWjpr/uf14cQACOc8DkJ?=
 =?iso-8859-1?Q?yQtmLABMmobR+BX0wSQR8cpqseSw16x9I93E3ModFUK3xxfRPbDr+2QngI?=
 =?iso-8859-1?Q?DO37hFyz8lOpYQU/VSJn9PoZpxBvWeu4rS0Uy7CzCe0R31w5SUYnauroS7?=
 =?iso-8859-1?Q?JcrpTFEiua1ZccOkwq9XRp5yF3DaLuhSQreXGYSRZzBjs4JejnHSSTKbMc?=
 =?iso-8859-1?Q?fkfVKrfd2x9QtzpzRrISZfQRReW08SC7z6Jsr9PpF9w3QUCJLNAPIZREd/?=
 =?iso-8859-1?Q?PGg64aKpF6xfr1FCJ/YOQhLFVZQyVAvUDD/tpEzdDBmnbpgmKdoE6gqnVe?=
 =?iso-8859-1?Q?8byGtWqne0w5Up8Rz9e9mTS8gBDJZ7Hgf7ypu6B6U7TZ1tTJiZ6plSYdX7?=
 =?iso-8859-1?Q?tRJhBOn6DfR57HgCv4bX/pH1ovlAvzOI/k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b680d7-f927-4cbf-22ba-08de0daa121c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 18:22:03.5036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6WoKATGhpLXwcdt3r7meK7H/mGkVTv1y6Rrc4Y9lOwpM1z5wkgiYwQaZ4ohc9eueHXxy7mRun8Rn3gQZEJkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7360
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

On Fri, Oct 17, 2025 at 07:51:47PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 17, 2025 at 09:59:48PM +0530, K V P, Satyanarayana wrote:
> > 
> > 
> > On 17-10-2025 20:56, Ville Syrjälä wrote:
> > > On Fri, Oct 17, 2025 at 08:46:37PM +0530, K V P, Satyanarayana wrote:
> > >>
> > >>
> > >> On 17-10-2025 19:57, Ville Syrjälä wrote:
> > >>> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> > >>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > >>>> save/restore while this sequence is being programmed, partial writes may
> > >>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > >>>> instruction to write the sequence atomically.
> > >>>
> > >>> If this whole thing is so racy why don't you always add a new
> > >>> BB_END after new commands, and only replace the previous BB_END
> > >>> with NOOP _after_ the new commands have been fully written?
> > >>>
> > >> We maintain a suballocator for batch buffer management, with size
> > >> proportional to system memory (e.g., 16MB suballocator for 8GB SMEM).
> > >> Batch buffers are dynamically allocated from this pool based on the
> > >> number of active workloads. The entire suballocator region is submitted
> > >> to hardware for CCS metadata copy operations.
> > >>
> > >> We cannot insert BB_END commands after each individual instruction
> > >> sequence because additional GPU instructions may be appended later.
> > > 
> > > You *overwrite* the previous BB_END after the new commands have been
> > > appended.
> > We do not know where the new BB allocation will be. It may not be 
> > sequential and every BO has a BB. BBs are allocated and freed so often 
> > based on BOs getting created and destroyed. So, we can't use that approach.
> 
> Hmm, could perhaps use second level batches then. Each BO would gets
> its own second level batch, and the first level would just call them
> in sequence. Or is this already running as a second level batch?

This I'm not sure...

Matt, do you know?

> 
> It might also be getting a bit complicated I guess, but at least it
> wouldn't have all obvious problems of the SIMD stuff:
> - looks like it will explode on non-AVX capable x86
> - will be broken on other arches until someone implements the equivalent
>   code (assuming the arch has such an atomic copy instruction
>   and supports in kernel SIMD stuff sufficiently to use it)

This is Pantherlake only. And the reason why I asked to add a
check with error/warn for IS_DGFX()...

which by the way is an assert... I still don't believe it is enough.
I believe a return with warn_on seems more appropriate to really
never try to run that code in case of a big future mistake.

> 
> > 
> > -Satya.>
> > >> Instead, a single BB_END marker is placed at the suballocator's end to
> > >> terminate execution.
> > >>
> > >> This patch ensures race-condition-safe CCS metadata save/restore
> > >> operations by guaranteeing atomic writes to the batch buffer, preventing
> > >> corruption regardless of when save/restore operations are triggered.
> > >>
> > >> -Satya.>>
> > >>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > >>>> 8 dwords instead of 5 dwords.
> > >>>>
> > >>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > >>>> chunks.
> > >>>>
> > >>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > >>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> > >>>> Cc: Matthew Auld <matthew.auld@intel.com>
> > >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> > >>>>
> > >>>> ---
> > >>>> V6 -> V7:
> > >>>> - Added description explaining why to use assembly instructions for
> > >>>> atomicity.
> > >>>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > >>>> - Include <asm/cpufeature.h> though checkpatch complains. With
> > >>>> <linux/cpufeature.h> KUnit is throwing errors.
> > >>>>
> > >>>> V5 -> V6:
> > >>>> - Fixed review comments (Rodrigo)
> > >>>>
> > >>>> V4 -> V5:
> > >>>> - Fixed review comments. (Matt B)
> > >>>>
> > >>>> V3 -> V4:
> > >>>> - Fixed review comments. (Wajdeczko)
> > >>>> - Fix issues reported by patchworks.
> > >>>>
> > >>>> V2 -> V3:
> > >>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > >>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > >>>>
> > >>>> V1 -> V2:
> > >>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > >>>>     (Auld, Matthew)
> > >>>>     - Fix issues reported by patchworks.
> > >>>> ---
> > >>>>    drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
> > >>>>    1 file changed, 91 insertions(+), 21 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > >>>> index 3112c966c67d..e0be7396a0ab 100644
> > >>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
> > >>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > >>>> @@ -5,6 +5,8 @@
> > >>>>    
> > >>>>    #include "xe_migrate.h"
> > >>>>    
> > >>>> +#include <asm/fpu/api.h>
> > >>>> +#include <asm/cpufeature.h>
> > >>>>    #include <linux/bitfield.h>
> > >>>>    #include <linux/sizes.h>
> > >>>>    
> > >>>> @@ -33,6 +35,7 @@
> > >>>>    #include "xe_res_cursor.h"
> > >>>>    #include "xe_sa.h"
> > >>>>    #include "xe_sched_job.h"
> > >>>> +#include "xe_sriov_vf_ccs.h"
> > >>>>    #include "xe_sync.h"
> > >>>>    #include "xe_trace_bo.h"
> > >>>>    #include "xe_validation.h"
> > >>>> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
> > >>>>    	}
> > >>>>    }
> > >>>>    
> > >>>> -#define EMIT_COPY_CCS_DW 5
> > >>>> +/*
> > >>>> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> > >>>> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> > >>>> + * VF state/restore operations.
> > >>>> + *
> > >>>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > >>>> + * VF state save/restore operations. Since these operations can occur
> > >>>> + * asynchronously at any time, we must ensure GPU instructions in the batch
> > >>>> + * buffer are written atomically to prevent corruption from incomplete writes.
> > >>>> + *
> > >>>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > >>>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > >>>> + * sections. This prevents vCPU preemption during instruction generation,
> > >>>> + * ensuring complete GPU commands are written to the batch buffer.
> > >>>> + */
> > >>>> +
> > >>>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > >>>> +{
> > >>>> +	xe_assert(xe, !IS_DGFX(xe));
> > >>>> +#ifdef CONFIG_X86
> > >>>> +	kernel_fpu_begin();
> > >>>> +	if (size == SZ_128) {
> > >>>> +		asm("vmovdqu (%0), %%xmm0\n"
> > >>>> +		    "vmovups %%xmm0,   (%1)\n"
> > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > >>>> +	} else if (size == SZ_256) {
> > >>>> +		asm("vmovdqu (%0), %%ymm0\n"
> > >>>> +		    "vmovups %%ymm0,   (%1)\n"
> > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > >>>> +	}
> > >>>> +	kernel_fpu_end();
> > >>>> +#endif
> > >>>> +}
> > >>>> +
> > >>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > >>>> +{
> > >>>> +	u32 instr_size = size * BITS_PER_BYTE;
> > >>>> +
> > >>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > >>>> +
> > >>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > >>>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > >>>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > >>>> +	} else {
> > >>>> +		memcpy(dst, src, size);
> > >>>> +	}
> > >>>> +}
> > >>>> +
> > >>>> +#define EMIT_COPY_CCS_DW 8
> > >>>>    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > >>>>    			  u64 dst_ofs, bool dst_is_indirect,
> > >>>>    			  u64 src_ofs, bool src_is_indirect,
> > >>>>    			  u32 size)
> > >>>>    {
> > >>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > >>>>    	struct xe_device *xe = gt_to_xe(gt);
> > >>>>    	u32 *cs = bb->cs + bb->len;
> > >>>>    	u32 num_ccs_blks;
> > >>>>    	u32 num_pages;
> > >>>>    	u32 ccs_copy_size;
> > >>>>    	u32 mocs;
> > >>>> +	u32 i = 0;
> > >>>>    
> > >>>>    	if (GRAPHICS_VERx100(xe) >= 2000) {
> > >>>>    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > >>>> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > >>>>    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > >>>>    	}
> > >>>>    
> > >>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > >>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > >>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > >>>> -		ccs_copy_size;
> > >>>> -	*cs++ = lower_32_bits(src_ofs);
> > >>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > >>>> -	*cs++ = lower_32_bits(dst_ofs);
> > >>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > >>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > >>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > >>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > >>>> +		  ccs_copy_size;
> > >>>> +	dw[i++] = lower_32_bits(src_ofs);
> > >>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > >>>> +	dw[i++] = lower_32_bits(dst_ofs);
> > >>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > >>>>    
> > >>>> +	/*
> > >>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > >>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
> > >>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > >>>> +	 * write the sequence atomically.
> > >>>> +	 */
> > >>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
> > >>>> +	cs += EMIT_COPY_CCS_DW;
> > >>>>    	bb->len = cs - bb->cs;
> > >>>>    }
> > >>>>    
> > >>>> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > >>>>    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > >>>>    }
> > >>>>    
> > >>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > >>>> +/*
> > >>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > >>>> + * save/restore while this sequence is being issued, partial writes may
> > >>>> + * trigger page faults when saving iGPU CCS metadata. Use
> > >>>> + * emit_atomic() to write the sequence atomically.
> > >>>> + */
> > >>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
> > >>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > >>>>    {
> > >>>>    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > >>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > >>>> +
> > >>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > >>>> +		      MI_FLUSH_IMM_DW | flags;
> > >>>> +	dw[j++] = lower_32_bits(addr);
> > >>>> +	dw[j++] = upper_32_bits(addr);
> > >>>> +	dw[j++] = MI_NOOP;
> > >>>>    
> > >>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > >>>> -		  MI_FLUSH_IMM_DW | flags;
> > >>>> -	dw[i++] = lower_32_bits(addr);
> > >>>> -	dw[i++] = upper_32_bits(addr);
> > >>>> -	dw[i++] = MI_NOOP;
> > >>>> -	dw[i++] = MI_NOOP;
> > >>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > >>>>    
> > >>>> -	return i;
> > >>>> +	return i + j;
> > >>>>    }
> > >>>>    
> > >>>>    /**
> > >>>> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > >>>>    	/* Calculate Batch buffer size */
> > >>>>    	batch_size = 0;
> > >>>>    	while (size) {
> > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > >>>>    		u64 ccs_ofs, ccs_size;
> > >>>>    		u32 ccs_pt;
> > >>>>    
> > >>>> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > >>>>    	 * sizes here again before copy command is emitted.
> > >>>>    	 */
> > >>>>    	while (size) {
> > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > >>>>    		u32 flush_flags = 0;
> > >>>>    		u64 ccs_ofs, ccs_size;
> > >>>>    		u32 ccs_pt;
> > >>>> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > >>>>    
> > >>>>    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > >>>>    
> > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > >>>>    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > >>>>    						  src_L0_ofs, dst_is_pltt,
> > >>>>    						  src_L0, ccs_ofs, true);
> > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > >>>>    
> > >>>>    		size -= src_L0;
> > >>>>    	}
> > >>>> -- 
> > >>>> 2.51.0
> > >>>
> > > 
> 
> -- 
> Ville Syrjälä
> Intel
