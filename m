Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD74DC27C79
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 01:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B62910E536;
	Tue, 18 Jun 2024 01:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLBQIxNM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63E10E536
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 01:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718673471; x=1750209471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=utUyKmf21KXaeq2CSKUxZbc05PucCGI9PG5q7TJ5CKc=;
 b=NLBQIxNMBFxytXBCQ/hjRz61iFZjklIaOmTA3/wJb8ovOD8YQqIV/Qdg
 iLxbRAx0iKCpPO6s/sV3AMc69c3u39DghKD2izccoU/vY1GO261UFOcjx
 dhNPAm5vNrdHzmwpsvs7QAl21d4zRPdtxPqosxWzPYQY5Q7TtxKYfaA83
 m4kfb5uwwqvlrC8iMrAzDS/eEIcJMw6kGr8YRyDp/QlLsE6gb9ADB0Bq0
 3Io8FkENZT8kNUQCLf5zTsdQNvMEZNZYxCM7ia5NCQwQMfYO+A4FFqpYr
 /0DKRunRdYpVrt34GgFXoZF0jV/4C1W7vqAX/+khTWfOvoD/QMjfBWlYX Q==;
X-CSE-ConnectionGUID: 9dTCOdriQuWNIwZ2nKrfVg==
X-CSE-MsgGUID: v+k7s/xYTr+C7GCaYukhbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="32995412"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="32995412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 18:17:31 -0700
X-CSE-ConnectionGUID: FF+mEBmHT2ivpF0v7auRDw==
X-CSE-MsgGUID: dKxMesxDSf6YnMIvavklUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="46493590"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 18:17:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 18:17:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 18:17:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 18:17:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 18:17:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6bk16iKwD4mW/fwLJBA/FL9hN1x3VUlURdMbf8BeX1t2SrlBnHyfiDCeIGIp79Cm+bjY0sWYZzUC6bt9X22OvUuD1/e1cjXJ68XRbT0zJr5Z7kWYgjjxV0AlgAwqlXoMRIlQ9vQ3m5vQLWbzlWut/6rA1MpQbiVWMXLOdyUfZaBLyU65q/ndc1c9fCAVbt3CwqR+NlYr0mVZGk9loCrCjME4wEgajsThTPBxvngkEcqaZ4LD6+Le5XmX58r3pfzjiGcf1XlSci1YCfHbLKpOIl7oIcAVgTcWFFLG09ws/wgwAlnOtWxNYuc55fn/uTTBEvhcb3xbjJCQyQmGxa9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62O/uq5gB0O5P+3ZTKckrz5GgAwJX5yHXcZd7HdJ6YM=;
 b=aAW22bjoUQQvEpSfuigfI9PsZO6WDPhYl982B8Vgbr5VsaNzPC0yvQY9QoyhtCuzrbjlDAvNARvs85ZxtuSpuTgUlBsJKp2kjqVcMS6l9F9rIcZJBlQKNtN1zUO2RK/Go5FMuLNnOQSdDQ84gXzEtAZLESdLCzF5vbYcxE3rPtvcMDlabn8i2bMrJEohG+j1Q8jGTmtxxnl4hOz1fcnz3F7LGJeMgKJxLqs/GJpy1Ut41qy9Mfmktr52GUqC0AveODjFg7akx9g8fSLjRtktlTGV9QRX+Jyv8uvIxKjo6f1Z+bnm5yTGcoKRSZGwwB29bVtKMDGQDXZ7zEl+FWYiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Tue, 18 Jun
 2024 01:17:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Tue, 18 Jun 2024
 01:17:27 +0000
Date: Tue, 18 Jun 2024 01:16:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnDgBvtYGtAJt9Xv@DUT025-TGLU.fm.intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
 <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
 <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c659d16-9232-4671-6e4a-08dc8f346a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s8Fhhp898nb2dv4XLUXNQBV3mTGTulKoVmiYOzsFjK6K6u3YK3Wl3wI+wutv?=
 =?us-ascii?Q?6TyB9aVTV+DGOKJTvltS46KIpofMFkLG4qAp9DnaydfmTqmyGXS7aUHu1Xe6?=
 =?us-ascii?Q?RJwwOhC4m+cdxcA9Fq0BtYRzHKQ32HQbYMS0s8TKaV9X6yoXlMvb4aAZors3?=
 =?us-ascii?Q?d5hTy3ZRHaEv4O6EGo08hiUSbV57vcQydF6mkkn0BeM3elQAGNoDo35EHw3k?=
 =?us-ascii?Q?CqKO/1XeSJOz/LZiZCA2fx9hq3it3s2HNURKqM6XCm5uhMDQ8MsefknJK28H?=
 =?us-ascii?Q?5egJXM22ynxi1qbd9ywzet1g3nq4dGfnlldBZD9QJNpE2+O4s0gIdPxZvq8k?=
 =?us-ascii?Q?4Mb7PeoiJNy4RaPtN1sPxSwUYDdJrSZXf7WSNeeFy/lmYnPrdaWL17xNfCD3?=
 =?us-ascii?Q?SG7MXxvKnQUlvsJjr61E+ySLNanN86ClKqsGGiLm8LBFyO7ucPhDw9D5DxUE?=
 =?us-ascii?Q?tXDBJW9ojHS8VQi1VzvY0k/D/I7pIRsI0JtDONySdja3YzMD4crE0lNnHcvn?=
 =?us-ascii?Q?Cw76yvcIU3YNEtI9YMUeoaGGbIdvmWBWh+TLmIakeKqH0wMk7o/aGHpRq4Zc?=
 =?us-ascii?Q?78hvCS7ZtvgjtyeP0n58doz5gHOrh6nTdTZhbODBCcM6jLxv5eQFBkWzDwsC?=
 =?us-ascii?Q?maupJ/MgIBnkXu9m04ls17j+uXt5GspGi2bRICTTjZVGwEOiMegGZObz2nBg?=
 =?us-ascii?Q?YrmBmo9q0cLMg6U3puUYDe667aXrQhOuHnebC3PFgpWbXJb1QteZ0H0Z4k9V?=
 =?us-ascii?Q?/sp10TugLAoyTVs7Yb+iuSNUD4xMr0KVcviDn8wlE866mO4LoJwWdIjebEaj?=
 =?us-ascii?Q?e2cxIqIrSlDBiS2jl4I0dHADXN+RQb1bxsueC7Qh5uSpmRWXi8B5Iy8bS3Pu?=
 =?us-ascii?Q?qhr9JlqD7AxXKNqnvbPv8XTuPRP7UdooxKd9zsVtcv+IsSdexYxozC3NkutX?=
 =?us-ascii?Q?JDaOXHDEzlRO1WIEz0OxYhq8PYDp3zBPsbMxYUdXxmIt7Rv4g6SBNNn/aYJp?=
 =?us-ascii?Q?neO6tiBiC+89lXVIJwa3GPVp2aOera5TQPxDX+tbrMqwiKXIUtEJw2MTf8sa?=
 =?us-ascii?Q?qxp/e6pBOE2FwKqp+HL2B/h7AWUecgHCWup9GnnfJDzwj6i1XgO2eudHuWAD?=
 =?us-ascii?Q?eO3B8MyX5nyvWz2jFqAw/MxQ093JiERlR9PdSmh+hNAaPgjzUNeVIrGTkBRh?=
 =?us-ascii?Q?ZzF0eXmS6KGw71QCSJJqduws8BYzMrPrcrjZ3YbTb4SYzJBPXT9x1BFtsGPb?=
 =?us-ascii?Q?lOROEM4xpVJiUtFYRBWrI+dQrnhGqIoJAD+fdvSbwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lKRMb5pElY1yXVz2dKpZmTigb2efrGQvhj1q1hiZuXsILfvjX/eAzOKNXQbb?=
 =?us-ascii?Q?VIoGhS/N7gsI0oytEzO76LhXapqAtS4HOom7yOrjxd9TWjctkTV5GeCiSKo5?=
 =?us-ascii?Q?vFa+3ojPsE8tbiOpCakswcddsR51QxerkTyot9SUO+D1KUsZN0ALvJp2wgNp?=
 =?us-ascii?Q?71AMDja4uhBtrGhQc1CanUzQLOkJtIGaHN5D1153m2e5A30aP9fuS2QG9/yA?=
 =?us-ascii?Q?FdQ24g42xpyhTA9BOJmkXSiexXCyXkuOaKk2OuQp/QuLkmuUMney6cyFBMxr?=
 =?us-ascii?Q?iz4mK74+9UuONab3IAA1J+EWrpbTUFqRZ17AAGMfwj1NLZb8W6HyBllieKo8?=
 =?us-ascii?Q?k/J3GccNX6cixPZmMiFT9B3lvUbtcVqnqRbZHaPpZe7cSFfzhuKnYNDKvBsZ?=
 =?us-ascii?Q?U/DxsD1u1ELQ5bQ2NdHbNNQEdFFq2CZ17zhTjCLnz8I1yF748MLR0F9xZMH0?=
 =?us-ascii?Q?w9EiuUGA7pksMyuBHP0ZpP2KoZkc6sohZJJTdTJUbV97RMNuWlAwjqfwXufA?=
 =?us-ascii?Q?qRderA3IsMooa+N45SQlIAbwbJGES6ys3dHsszoNAt8gZaWFBRGaCBB0iEsA?=
 =?us-ascii?Q?d9GJhPLbyVjRpe5T+kYsKd90GQUPn2/cHT1SMgxwSbw3V+WykvDCvlQVPVt8?=
 =?us-ascii?Q?5QNURnFDbGAjzxK/n6oyR1UJAcETiCyexFrCSrj9h6f4y+mE8XoDd11SFrK+?=
 =?us-ascii?Q?0iLPXVpSl3yvqGhwCdg2RccUr8uEY98ihfcuh/CNO6UsMgalrSlNxiiFgu6d?=
 =?us-ascii?Q?VkMpSH9kiR11ntP9NAN8tbRpbpTnwt7D4OaVwPK86XWpNTggxEHHYCmwzxTt?=
 =?us-ascii?Q?NA000W3e0eBXUG+ZW3hz/20WunEJIvhl7LXCKQpbztl3D4zE2Xeht5SygD9L?=
 =?us-ascii?Q?F3HpZgHBXhCwip9e9oQyLaq2WIU938LHj+j5aqpXi3+XsviaQ6aFp70npSBN?=
 =?us-ascii?Q?bsYB4iu5q/azLvq9KthOwm3A5xaQad4ZiVubkkUkFs+2vlAeqSqxkcrfKDOI?=
 =?us-ascii?Q?5gQ/i/NZsCreODNXBW013z+NrtGX9VOCfsjpQPNcdASk5B6jkofiMEQuthJK?=
 =?us-ascii?Q?OsvSPnDdg/mV83RsRzgSHp1pbcoJn3wIVehIQyLEvh3xpTmCU1bpCTdZ1L4A?=
 =?us-ascii?Q?WyAQOnJY9kW4U3rV6PM+5GkpYug6tRsN5kL2+lNfpvGeAsHqPLvwrWc3rPEf?=
 =?us-ascii?Q?cm/js8UGg8Nv38qNOUpRNqFaN3fMRxUkL+OlRr2YRLa3xWmFMdTjXy5pN0Q8?=
 =?us-ascii?Q?Ibg7Canztm+awewXRrzk6HRvSwO5qwwckOL2WPWaiMIU9zytuhZy/d6lhssE?=
 =?us-ascii?Q?mA2/wqKC7qnoJ/aE6xsZVtYnUEP/u7AohD0A6D85CZc6Y5vk6tjDw6SyTy60?=
 =?us-ascii?Q?8OkNYHCLW6U20/uXDwkY19e2RgVYsZ5PtYaUj+33JGFpLf0jBwtg0SVGbDMK?=
 =?us-ascii?Q?3irQoqydE+IWV5HKcPfDZVnGkieWiCRmiJ1/lbLvJ8h/FgewXuQjbOYGJy0I?=
 =?us-ascii?Q?3yNnDGzRr8+10PqkablsNw03UJbmAuz5QMEwQ5iikItqNJy6KPl20tDSb4ln?=
 =?us-ascii?Q?CZ8RPMD5fJHfPCKHpl9Uc7Lz3pF3lkZKHQBLLqlYeKC4yvgxmHRr7lNvR5NC?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c659d16-9232-4671-6e4a-08dc8f346a9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 01:17:27.0937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCHbDeOyTUm2aGe0hlOI32qLPxlQt6sULnlW3NOYzKkUjfhilKMf+j+9PAXhAwlPI3YT3XulcwNEUJsdteaysA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
> On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
> > On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
> > > 
> > > 
> > > On 17.06.2024 20:00, Rodrigo Vivi wrote:
> > > > On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
> > > >> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
> > > >>> There is support for 'classes' with constructor and destructor
> > > >>> semantics that can be used for any scope-based resource management,
> > > >>> like device force-wake management.
> > > >>>
> > > >>> Add necessary definitions explicitly, since existing macros from
> > > >>> linux/cleanup.h can't deal with our specific requirements yet.
> > > >>>
> > > >>> This should allow us to use:
> > > >>>
> > > >>> 	scoped_guard(xe_fw, fw, XE_FW_GT)
> > > >>> 		foo();
> > > >>> or
> > > >>> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> > > >>>
> > > >>> without any concern of leaking the force-wake references.
> > > >>>
> > > >>> Note: this is preliminary code as right now it's unclear how to
> > > >>> correctly handle errors from the force-wake functions.
> > > >>>
> > > >>
> > > >> I'm personally don't like this at all. IMO it obfuscate the code with
> > > >> little real benefit. This is just an opinion though, others opinions may
> > > >> differ from mine.
> > > 
> > > except that is more robust than hand-crafted code that is error prone,
> > > like this snippet from wedged_mode_set():
> > > 
> > > 	xe_pm_runtime_get(xe);
> > > 	for_each_gt(gt, xe, id) {
> > > 		ret = xe_guc_ads(...);
> > > 		if (ret) {
> > > 			xe_gt_err(gt, "...");
> > > 			return -EIO;
> > > 		}
> > > 	}
> > > 	xe_pm_runtime_put(xe);
> > > 
> > > and thanks to PM guard class we could avoid such mistakes for free:
> > > 
> > > 	scoped_guard(xe_pm, xe) {
> > > 		for_each_gt(gt, xe, id) {
> > > 			ret = xe_guc_ads(...);
> > > 			if (ret) {
> > > 				xe_gt_err(gt, "...");
> > > 				return -EIO;
> > 
> > Just responding with a question here - haven't looked at the rest of the
> > comments.
> > 
> > How is this not still a bug? Looking at scoped_guard, it appears to be a
> > magic macro for loop which acquires / releases a lock or in your
> > purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
> > step? I see coding patterns like above in the kernel [1] so I do assume
> 
> with __attribute__((cleanup)), the compiler guarantees that
> it's executed when the variable goes out of scope. What you are probably
> missing is the use of CLASS() declaring a variable inside the for, which
> uses attribute cleanup:
> 
> 	for (CLASS(_name, scope)(args),
> 	     ...
> 
> GCC's doc:
> 
> https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
> 
> 	The cleanup attribute runs a function when the variable goes out
> 	of scope. This attribute can only be applied to auto function
> 	scope variables; it may not be applied to parameters or
> 	variables with static storage duration. The function must take
> 	one parameter, a pointer to a type compatible with the variable.
> 	The return value of the function (if any) is ignored.
> 
> 	When multiple variables in the same scope have cleanup
> 	attributes, at exit from the scope their associated cleanup
> 	functions are run in reverse order of definition (last defined,
> 	first cleanup).
> 
> 	If -fexceptions is enabled, then cleanup_function is run during
> 	the stack unwinding that happens during the processing of the
> 	exception. Note that the cleanup attribute does not allow the
> 	exception to be caught, only to perform an action. It is
> 	undefined what happens if cleanup_function does not return
> 	normally.
> 
> This was only possible with the recent change in the kernel raising
> the minimum C std to gnu11 (uapi is still c90 for compatibility):
> 
> 	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
> 	Author: Arnd Bergmann <arnd@arndb.de>
> 	Date:   Tue Mar 8 22:56:14 2022 +0100
> 
> 	    Kbuild: move to -std=gnu11
> 
> 	    During a patch discussion, Linus brought up the option of changing
> 	    the C standard version from gnu89 to gnu99, which allows using variable
> 	    declaration inside of a for() loop. While the C99, C11 and later standards
> 	    introduce many other features, most of these are already available in
> 	    gnu89 as GNU extensions as well.
> 

Thanks for the reference, will checkout.

> > this works, just confused how it works.
> > 
> > With that, any code which isn't easily understandable IMO is a negative
> > ROI as it just creates confusion in the long / makes problems harder to
> > understand. Again this is just my opinion.
> 
> I think that is mainly about getting used to the pattern. I think we

Agree once pattern is understood, fairly easy change.

> just have to be careful not to overshoot on trying to use everywhere.

Agree about overshooting. I think we agree we want to use cleanup.h
semantics in Xe we should start by converting kernel core components
(spin locks, mutexes, rwsem, kfree, etc...) to use these semantics
before adding our own ones. Also with this, I think if we use cleanup.h
semantics, we use these semantics everywhere we can (e.g. directly
grabbing a spin lock is akin to open coding and not allowed).

Once we convert Xe core componets to use these semantics then we start
adding Xe specific ones.

Thoughts?

> For example, I don't know why there's already a second use in a separate
> thread when we are still discussing it on this one.
> 
> A very positive thing is that this is not xe's own invention and comes

I agree, it is core fairly new core thing which seems to widely
endorsed which is a positive.

> from core kernel, maybe from the hottest path that is the scheduling and
> locking. So I very much disagree with arguments raised here about
> a) this is an alien thing and b) performance will be severely impacted
> 
> I've used __attribute__((cleanup)) in several userspace projects in the
> past and it does help avoiding problems on the error path that is
> usually not very well tested (and xe's track record on error path is not

For sure our error paths are not great but it isn't like this solves our
of those problems magically.

> very good either: those were the main issues being submitted in drm-xe-fixes
> for the last release). So if we have a way to improve (and that I've already seen
> being used successfully), I prefer failing on trying than on repeating
> the same mistakes.  In kmod my only regret is that I didn't start it
> earlier, during the bootstrap of the project.

This merged a little over a year, so quite new. Xe is still fairly small
and I don't think it would be to painful to switch over to these
semantics. If we want do this, I'd say we do this asap. 

Matt

> 
> 
> Lucas De Marchi
> 
> 
> > 
> > Matt
> > 
> > [1] https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544
> > 
> > > 			}
> > > 		}
> > > 	}
> > > 
> > > >
> > > > Well, on the positive side, it is not adding a driver only thing like
> > > > i915's with_runtime_pm() macro.
> > > >
> > > > But I'm also not sure if I like the overall idea anyway:
> > > >
> > > > - I don't like adding C++isms in a pure C code. Specially something not
> > > > so standard and common that will decrease the ramp-up time for newcomers.
> > > 
> > > does it mean that the use of other guard patterns seen elsewhere in the
> > > tree is now prohibited on the Xe driver ? like:
> > > 
> > > 	scoped_guard(mutex, &lock)
> > > 		foo();
> > > 
> > > 	scoped_guard(spinlock, &lock)
> > > 		foo();
> > > 	...
> > > 
> > > > - It looks like and extra overhead on the object creation destruction.
> > > 
> > > from cleanup.h doc is sounds there is none:
> > > 
> > >  "And through the magic of value-propagation and dead-code-elimination,
> > > it eliminates the actual cleanup call and compiles into:"
> > > 
> > > 
> > > > - It looks not flexible for handling different cases... like forcewake for
> > > > instance where we might want to ignore the ack timeout in some cases.
> > > 
> > > there is scoped_cond_guard() that likely will be able to deal with it,
> > > but I guess we first need to cleanup existing force_wake api as expected
> > > flow is not clear and there are different approaches in the driver how
> > > to deal with errors
> > > 
> > > >
> > > >>
> > > >> Matt
> > > >>
> > > >>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > >>>
> > > >>> Michal Wajdeczko (3):
> > > >>>   drm/xe: Introduce force-wake guard class
> > > >>>   drm/xe: Use new FW guard in xe_mocs.c
> > > >>>   drm/xe: Use new FW guard in xe_pat.c
> > > >>>
> > > >>>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
> > > >>>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> > > >>>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
> > > >>>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
> > > >>>  4 files changed, 82 insertions(+), 50 deletions(-)
> > > >>>
> > > >>> --
> > > >>> 2.43.0
> > > >>>
