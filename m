Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5515DC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 12:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F3310E03C;
	Wed, 23 Jul 2025 12:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFO+jBOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD73310E03C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753273332; x=1784809332;
 h=resent-from:resent-date:resent-message-id:resent-to:date:
 from:to:cc:subject:message-id:references:in-reply-to:
 mime-version; bh=fesA17gvauPgH0zuN/Ro59vPKV2a955rZX3T9rkMn6c=;
 b=TFO+jBOgr0PmW/Uy3QshpH3oWAamqZEGCLEsnPdMqSeubGSwTV0zVome
 ZNhoGc4TImAHtop6wIsD0KqzM6vfaZTt7kSZZUBrQOqEU12yznzce/9+v
 0/ONLvHoy+H9/dOjd2Dzpqarx7o96l/ILX2EjPV+oOlVgCFCsqZfs5ssD
 dzTx5tC/o8ckE1Q3YPG4ExY39lriZY3+LCU5ahVfi6Wt7MIb6tBWSdf0B
 n6anU9b9D34xchn6udRgS+GfwA5eOhVelIqn6lgMje+k4KEO4T3u1WL4x
 OIPBqPdDNWWsOtAC4T9JPPqXHwLR+wIO44qYDN+Oji0qH7BT7y7ZkNguL A==;
X-CSE-ConnectionGUID: l+nSkJ8eRcm/YJx2m02/lQ==
X-CSE-MsgGUID: DpVUMgvST2qIb5Sk3Z4KsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59368318"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="59368318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 05:22:11 -0700
X-CSE-ConnectionGUID: Z3b2IF2vSQ6pUxal2FVdvw==
X-CSE-MsgGUID: NLdibQ+pTt6IbPWwzt0k7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="160019405"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 05:22:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 05:22:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 05:22:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 05:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhX0ds5Hb4i7rLODighZp/xq2iRlF4wpq3YNg0dqTVGvXDO3fUFwGieA3AXWhNivpj5Oy+AbFRjDlJ08a8jmfKz3rw+/FHqz6/vCkddMnvzXWEPIKAcX7v6ZIM8LlOsNy51rKWrkLe85/lq1uTB6eGZCNNA0RrAZtZWGBtcCCspHrH4pB2OybnjWPcQpKzcZMp+7HtQ2ylvzU24F4U8rgnNRzZKyZkeiWYYftp91b9/4w82P9GkFPflHkYMn/Ji264a1pSXWeCtPJtRnyiVALKMLKQ4p9WWlQbrF365TeLUngWtB+7SY+E20eblSDsKW2eWx08nPUrj/IfOZRVvgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jC2/NlKYjP0oPCke3sB+dEN3R/J041O6cSby0IOyH3Y=;
 b=YHNNAjwYO4fSmE+zCxuQ52rWddjUPJkbdz/q1ZV+UffqQfqbuI8yusQ2dTxoHy3AqKUkP/Mau6KFQczDOEujVp6U443zSMQqPlX+cB0AXbz/vnG+8BiFtVPBeBgzfZWxXgSQgR4DyeWx5Q8EDZkNKTjNCl9U0wNRNl65ksDl003muodNMXa7IMtYFj71M9K0NR2oPzinN/wCEx0x0Me4sJnnxnUk4ReAU/eYtE0Qjc8LJfTHKWX8osERSst6OHsxxHLqwu91F8aFCO8Yju1vpPoBKzGkyGo+GfUnAMczVxv/5Qp2fDX2uvJjrS2yQsjmqiko+B33u+npdQ5EtI/4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 23 Jul
 2025 12:21:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 12:21:41 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Wed, 23 Jul 2025 09:21:36 -0300
Resent-Message-ID: <bxnbkfxaoifodocggwlmrfknds636oi4kbd5qffmipar6a6h6b@n26a7zzmvyq7>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Date: Thu, 17 Jul 2025 12:51:16 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joe Perches <joe@perches.com>
Subject: Re: [CI v4 0/7] Relax VF/PF version negotiation
Message-ID: <zcvuxnnk3ochqvytsddqmubdhqd3thcxxzfocqkqk4xwb7ha5q@rayajyeowicx>
References: <20250713103625.1964-1-michal.wajdeczko@intel.com>
 <e1414da3-a45f-48d0-a81f-e5527b762a8c@intel.com>
 <20250717-electric-uakari-of-advertising-af37b4@houat>
 <98e42783-6639-4bdf-a436-3cf93a7dc32d@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <98e42783-6639-4bdf-a436-3cf93a7dc32d@intel.com>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5011:EE_|CY5PR11MB6139:EE_|DM4PR11MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f0f061-2e74-4119-ee77-08ddc9e37ab5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|14060799003|1800799024|35042699022|13003099007|27256017;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(14060799003)(1800799024)(35042699022)(13003099007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: e067caa4-8e49-4f53-e92d-08ddc549c6af
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 15:51:21.6391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2fDSfzRH6wpaErGxkPSU8YD6Oyjpa1GwFtmWn0083NW40UETvdZb4d7Q6kdGfoBCplfFLhw97DHIEvkZZH5ptNWJoKHSEVSjmDuef+OhIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.7863700
X-MS-Exchange-Processed-By-BccFoldering: 15.20.8922.036
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cLZ/pjlBKZc6OPQpx1vIsDSbzf0vDXW73qtV589GBjUeBRJwThU29/nFgVN+?=
 =?us-ascii?Q?CuTnbHVfoRBLkfsxr8CFYtMnrm+k3JC6LHyXrOi/C9+dRytrBw5n7pN4D6Ds?=
 =?us-ascii?Q?pGdndY8cKxcb9dCp+KecbcVQMjBDpMRFqnaNJNcEnYeQhnGUNsbMO2p9bYQ8?=
 =?us-ascii?Q?A6GmrtLPxz/GRDdEqP2VytOYRVjN8mRNljuCJ09JUhEeeZ0WSefm0Ja3m6Ny?=
 =?us-ascii?Q?/nKhOSj7hJnZz9ozHcOQB4ARBihC09WfKUxJsC50Ggr/X+EP6Xh1Q8nhgQ2+?=
 =?us-ascii?Q?lJaiAHE/fj0B3EL5oH0wOjCYiYFG6bsoPjwP99VtExJLAWKc8p8/uSebtW38?=
 =?us-ascii?Q?ao/OYBAGDVFO90gflQsQDSYkrLsGuyuQQbU47xlutmSNodH7rW2NGPKQnAiC?=
 =?us-ascii?Q?KHdqt0q3jbcKSLOp8DmifMBzKg/sOLyS09yA38HG1y09svcyhfZtUXy6LX4k?=
 =?us-ascii?Q?VbTTr3LOfDWe8JbWuTwk8a23whAQ3N6qEHjDatNdVfPY4Gsr9N1hPYegVNYw?=
 =?us-ascii?Q?PQn2q5Wu5wW1TETdpZP015WMZwsevw6ky/s5CWFsLRLSR5bnVt0rwl7a+i3s?=
 =?us-ascii?Q?lhujfASrq4boP83L49rg5Tr7II7KAUg3v0l7rdvuBObZXtn94ewxXclXkc52?=
 =?us-ascii?Q?RtMfs25IwG0pOnEZsXc5TnTR0flxygeG7nhY7r7cWBBGIU4UwdaJFVxMBv1e?=
 =?us-ascii?Q?ZYJ5JgIHy/1m4tKzSq7UzS0kDB60yJHFMs5iY9dLkQ8BEsLUgfVKdNpw+Q1X?=
 =?us-ascii?Q?8JSAWqrlXOpKRFs6tIzAXnJlhxklZqfLzNe0uYBGBz7WF5rze5PUt1rifqNP?=
 =?us-ascii?Q?KopEIaK0gG32K8I4q24y8RyCXpe175lpHxD2W8mPXwcwKEd5pJ7pw3iAHM2K?=
 =?us-ascii?Q?WB9FuLXEl75JYBJxVG43t806IMauolJMyK0QIgud3VoJ3tLFdNzZ77suwvrR?=
 =?us-ascii?Q?NCW4J+zubodFaq1/ELrBlV88eXwbLaGl97mm7ywZ8bDJ+2VspYBAcaBSKfXB?=
 =?us-ascii?Q?ujnSa9JVJ9wEvU6Fl39GH++/qgiWV1tCEwKiLzcrrc8DPtQ2SGcWFH+/sF3+?=
 =?us-ascii?Q?Evjvp3fxMNNz/Eqy/0sU5mfU+K3LE2NGZnRNanHlxHmY0zatzbmQ2wH69jTQ?=
 =?us-ascii?Q?+izosGKw1a6YDE06VLdZnU8IhxyTiLJ5gImdT3oH8F6Hcf6kJrik9FoUwpmf?=
 =?us-ascii?Q?cGiEmFG7WvlZzI5xKv76eVg4sEitZ+J9RisR36z5oQTz0i7+A1M81sctpzXG?=
 =?us-ascii?Q?I2UA+eCh19/a2Sq+wB+7cEDPpgHXGTwqpnTRbHgi4GTiHsUNPZXOqQ/PJxS2?=
 =?us-ascii?Q?EAHkg/nWi6elWqkPFQnyzYInn4jRce+EECDou4LaXyeCJANOeUGp2J/u0VB1?=
 =?us-ascii?Q?cykq82jW6qhWML7Hix3Fkb1iyBNox4jxpffsitxACDuHyejwHab+SvUEx6pO?=
 =?us-ascii?Q?OAiFlTbwJA8=3D?=
X-TUID: FWaRUVUHMYrm
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e067caa4-8e49-4f53-e92d-08ddc549c6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bcV4YVKhJOw7FE2zSYd1HNF9UJwH1MhCT9klEJFUaOM0cnBzfatVKqgHTSOt?=
 =?us-ascii?Q?SMAPMQy09hKeEdMRK6w/97t/UayzhUsfhfgxcL9SA9uVCna9MTQTQyvN77sO?=
 =?us-ascii?Q?8itZvf5vjuwaZA4shH1iuFickEqeRU7zdiQlxkaDkNkfJXG2YJ2yF87t777d?=
 =?us-ascii?Q?3x6WP1PRGxQIUiAj3bTjygyu+9hfOgl5jeCeehSrQL9mbpBYw/qqdT+JGKgJ?=
 =?us-ascii?Q?fxHfPL46tf43fYffIBN5+bHLXbb+aKW1c0IF6/1Y8qDPIh+LwmkCb4ZwyP47?=
 =?us-ascii?Q?7IuqDgX2NEJUL3FXiAyB9fmk1oy6SCGbLBgMv1Co2snk5Y6MRxaTJ7f2+keZ?=
 =?us-ascii?Q?4+iLfw5G2iAoLmO9Z6mjIA1QMGj8MvPWgfUoYhl/XR3km3cEpqidMjUnNuDl?=
 =?us-ascii?Q?uO5Di6wM+Xek/H+8HCITBaFCUeGAA1HANv1oMWLcgfV9ZfyuIi3ti7vSY17o?=
 =?us-ascii?Q?kW3dRZyqIvIoRn7yVqbmowS4ip9OLWuY5lUyqN4eK+bsPSoFFABIafGHWGku?=
 =?us-ascii?Q?Uuc/TdugA4ccEZUs98ROxYfEjRe7Oc9KPiAQiAaNM0hDwKHxT5DTVimu98ol?=
 =?us-ascii?Q?jpJO4F9ev7I0FEi/TLpwdPdrMrHcVXkRi0YRVG1QG/mhwo28vCzbXxkNQNjr?=
 =?us-ascii?Q?HeLsiqq49GBRDuOt81Nty2M2M9H0+fxihba63JAUWPlRSpuwbDyVDCG36GXG?=
 =?us-ascii?Q?74AGHGowdtd3xVA1W151u7LD3Eg236TH/fDgIWLjw8h+r/u3lBiJx5BF35xr?=
 =?us-ascii?Q?bNrtZPjB2AIh85pJv5K6luerXONp2scDQqHKpfgc2F6l/tY8cjBLMj/6sf9D?=
 =?us-ascii?Q?rL6l+4vkZCrKowC1XEtZITcqHpG7Cu4VNvKXqQaDRO/dPBjdd89OmOdfIJiU?=
 =?us-ascii?Q?N4xfx38g06WPfXGf+kuuT10ZX5buSvvoggWsLPDRlUodYjMlFBVvzSDnCEeN?=
 =?us-ascii?Q?LmWR+l39gVakFQglacwCVCXea7dfnmIstHnfG0TJEEp2Iof4v7Hk4Q0rSXQw?=
 =?us-ascii?Q?G8DGkckoAO6s5hg6yq+8TdZ6rVG0LAbimL2h5wtMfDAQ0eVdy361UTtqP94s?=
 =?us-ascii?Q?66/ROnQObr+bMat2KLstMTKPh7DcDj1wNxSGEeXguV6pn2cJmYC6nmtFioqM?=
 =?us-ascii?Q?kfTExQIZBl/EZDM5N4q2+sIzfHdy0GxXdhn8f2GlNSsHidYO3aRViwfiNNJx?=
 =?us-ascii?Q?uJKVGai9HzMfzNZAcvwx6JFq+wtTNpNTV4pZIb0LR8XtXem6telZ2bheYCrH?=
 =?us-ascii?Q?bPlNmDDBcSnaGwYguQ4PLjefT6/wcjgpb0KX7n3Sy0q0nqlNaUxfcEgsrF/i?=
 =?us-ascii?Q?1467jkt6RxbtclsQLp5ge9+nly0ZE1FPWKyjLf9LFUqVmQgyptgv4Mkgcqqj?=
 =?us-ascii?Q?HqBYxfQ7yluqcKz7/zqoMtKH2EaKRu+TPX3rMObzkZIifCPIAaGr0CIWTDl/?=
 =?us-ascii?Q?G8uSERP1mzPuZ/xT9Wh0shgFQ2DGT519rLvOKqJW+k/GZl7t3KzMN4X2DA69?=
 =?us-ascii?Q?aZ6vNO0vm7sBOF+HpoMao9i9gSGPfhIKiOwDOlNABvjOmjX29DfRWFJamS4G?=
 =?us-ascii?Q?CxFMDE/7DiNJckMJ0SGhDwPgFJaU3BUS1EWEWWJhCcLrXKyz+uty84puB2Jx?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f0f061-2e74-4119-ee77-08ddc9e37ab5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 12:21:41.3717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1TUzps2u8g/+nDqS+ZDmy7AEOvL0FqBWNwbmCjm56NFfB9Yfswp58FEk8z6gR28ASFWSB5dOkp23LW9Mbz58ivAHjqCVcT60XUi0dURZYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
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

+Joe Perches

we seem to have some odd behavior in get_maintainer.pl. Could you
clarify below?

On Thu, Jul 17, 2025 at 04:38:19PM +0200, Michal Wajdeczko wrote:
>Hi Maxime,
>
>On 17.07.2025 13:44, Maxime Ripard wrote:
>> Hi Michal,
>>
>> On Mon, Jul 14, 2025 at 06:34:10PM +0200, Michal Wajdeczko wrote:
>>> On 13.07.2025 12:36, Michal Wajdeczko wrote:
>>>> It was clarified by the arch team that initial version negotiation
>>>> can be done by the VF just once, by using any available GuC/GT.
>>>>
>>>> v1: https://patchwork.freedesktop.org/series/150711/#rev1
>>>> v2: https://patchwork.freedesktop.org/series/150711/#rev2
>>>>  - don't WARN on missed mandatory print func (Piotr)
>>>>  - use gt_is_main/tile_is_root helpers (Piotr)
>>>>  - drop leftover test include (Piotr)
>>>>  - add more asserts (Piotr)
>>>> v3: rebased
>>>> v4: rebased again (there was no CI.FULL for v3)
>>>>
>>>> Michal Wajdeczko (7):
>>>>   drm/xe: Combine PF and VF device data into union
>>>>   drm/xe: Move PF and VF device types to separate headers
>>>>   drm/xe: Introduce xe_tile_is_root helper
>>>>   drm/xe: Introduce xe_gt_is_main_type helper
>>>>   drm/xe/pf: Expose basic info about VFs in debugfs
>>>>   drm/xe/pf: Stop requiring VF/PF version negotiation on every GT
>>>>   drm/xe/vf: Store negotiated VF/PF ABI version at device level
>>>>
>>>>  drivers/gpu/drm/xe/Makefile                   |   3 +-
>>>>  .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ------------------
>>>>  .../drm/xe/tests/xe_sriov_pf_service_kunit.c  | 227 +++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_bb.c                    |   2 +-
>>>>  drivers/gpu/drm/xe/xe_debugfs.c               |   4 +
>>>>  drivers/gpu/drm/xe/xe_device_types.h          |  12 +-
>>>>  drivers/gpu/drm/xe/xe_force_wake.c            |   2 +-
>>>>  drivers/gpu/drm/xe/xe_gsc_proxy.c             |   3 +-
>>>>  drivers/gpu/drm/xe/xe_gt.c                    |  12 +-
>>>>  drivers/gpu/drm/xe/xe_gt.h                    |   5 +
>>>>  drivers/gpu/drm/xe/xe_gt_idle.c               |   2 +-
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  30 +--
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   7 +-
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   9 +-
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 166 +------------
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h   |   2 -
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  34 +--
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  12 -
>>>>  drivers/gpu/drm/xe/xe_irq.c                   |   7 +-
>>>>  drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
>>>>  drivers/gpu/drm/xe/xe_sriov_pf.c              |  61 ++++-
>>>>  drivers/gpu/drm/xe/xe_sriov_pf.h              |   6 +
>>>>  drivers/gpu/drm/xe/xe_sriov_pf_service.c      | 216 ++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_sriov_pf_service.h      |  23 ++
>>>>  .../gpu/drm/xe/xe_sriov_pf_service_types.h    |  36 +++
>>>>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  45 ++++
>>>>  drivers/gpu/drm/xe/xe_sriov_types.h           |  36 ---
>>>>  drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  41 ++++
>>>>  drivers/gpu/drm/xe/xe_tile.h                  |   6 +
>>>>  29 files changed, 744 insertions(+), 503 deletions(-)
>>>>  delete mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
>>>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.c
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.h
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h
>>>>
>>>
>>> received offline Acked-by from Rodrigo for patch 2/7 and patch 6/7 to
>>> mitigate below dim warnings, likely due to new files being added:
>>>
>>> $ dim -d push-branch drm-xe-next
>>> dim: WARNING: 7320a508eef0 ("drm/xe/pf: Stop requiring VF/PF version
>>> negotiation on every GT"): Mandatory Maintainer Acked-by missing., but
>>> continuing dry-run
>>> dim: WARNING: c1a58788a937 ("drm/xe: Move PF and VF device types to
>>> separate headers"): Mandatory Maintainer Acked-by missing., but
>>> continuing dry-run
>>
>> I guess they are now the commits a6c384b24f13 and 73c0e8054fcf
>> respectively, right?
>
>correct
>
>>
>> If so, I can't find anything wrong with those. Did you change anything
>> between your mail and when you actually pushed the changes?
>
>this was observed before I've added extra a-b from Rodrigo (with a-b
>there was no warnings any more, that's why I was able to push it)
>
>and the only thing that makes those two patches special/different from
>other in this series, is that both were adding new files:
>
>7320a508eef0 / a6c384b24f13
>
> create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
> create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.c
> create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.h
> create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
>
>c1a58788a937 / 73c0e8054fcf
>
> create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
> create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h
>
>and likely dim script was considering this as cross tree merge, in check
>added by you in commit 43254c2aa575 ("dim: Check for maintainer's ack
>when merging on behalf of another tree")
>
>and at that time this is what your magic commands were printing:
>
>$ git show --no-use-mailmap --pretty=email c1a58788a937 |
>./scripts/get_maintainer.pl --no-email --no-l --scm
>git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>git https://gitlab.freedesktop.org/drm/xe/kernel.git
>git https://gitlab.freedesktop.org/drm/kernel.git
>
>$ git show --no-use-mailmap --pretty=email c1a58788a937 |
>./scripts/get_maintainer.pl --no-email --no-l --scm | head -n 1 | cut -d
>" " -f2
>git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
>so it looks new files patches were classified as "torvalds" not "xe"
>tree, hence the warnings (I guess)


New empty file seems ok:
	$ touch drivers/gpu/drm/xe/test_maint.c
	$ git add drivers/gpu/drm/xe/test_maint.c
	$ git commit -m tmp 
	$ git show --no-use-mailmap --pretty=email HEAD | ./scripts/get_maintainer.pl --no-email --no-l --scm
	git https://gitlab.freedesktop.org/drm/xe/kernel.git
	git https://gitlab.freedesktop.org/drm/kernel.git
	git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

New non-empty file has Linus' tree as the first one:
	$ echo " " > drivers/gpu/drm/xe/test_maint2.c
	$ git add drivers/gpu/drm/xe/test_maint2.c
	$ git commit -m tmp2
	$ git show --no-use-mailmap --pretty=email HEAD | ./scripts/get_maintainer.pl --no-email --no-l --scm
	git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
	git https://gitlab.freedesktop.org/drm/xe/kernel.git
	git https://gitlab.freedesktop.org/drm/kernel.git

Lucas De Marchi

>
>Michal
>
>>
>> Maxime
>
