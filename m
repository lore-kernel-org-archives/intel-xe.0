Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F01CF6BE2
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 03:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3A610E138;
	Wed,  7 Jan 2026 03:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhmsImb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4902D10E138
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 03:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767755813; x=1799291813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=McQFA43WjKdh6tynnGQ2Rv2tSJhxmzmrf4kkobcai9s=;
 b=XhmsImb5BNvOxk25vSDFXLkEmdSN1qzNSIRGN0XJfQByJdB6j01s0fxo
 tMqhMdzdVyqGhtDbwqTOyTbTd/V+c/FOBChZjD4PgMsANNYl5Grv+zcju
 G9zWBflnN+37C+aO3Gl7r7uoTCJaKufUGEC+oetoWAkadSDzPQxNtIAFS
 Yosm8iLuEGVQt0RZspDwBk9a6IbzXfI+T6H+ccmX8YXEdN6wloxcxQzA8
 4nU8/RegvxRErJPao1+ImlnaHu8TMg4TR3VLuJOBbSiiy365lNPxzzqki
 JNmaIsn0gijeha7xQzhwtdRGc9e5/5Hqg+wtx7mrTMOlLYRk8/Ls61DnT g==;
X-CSE-ConnectionGUID: e4cuWhzpTGKIGL20eGWhVA==
X-CSE-MsgGUID: KkhtrTnAQUy2x1lX6sRNSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72971899"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208,217";a="72971899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 19:16:52 -0800
X-CSE-ConnectionGUID: Tuxi6KmxRue4IdcvY03UkQ==
X-CSE-MsgGUID: KPPSJBHPTWOi97G1fJzapg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
 d="scan'208,217";a="207867852"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 19:16:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 19:16:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 19:16:52 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 19:16:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFdFjseBJpSKp6OV40+uGuJ4Rwx1LgiorWvylmPmoe1eZskmFuTAE4aG5vHe3N+pfMBqhLuBGMIoNQ+i2k1GrZMlvp9mVXmv/WSoScjQL95I9YE5O+SLVgFq4yGiGaG5S3hkcwve2xIyOZoqI15GjHV2b3Ivco8L/W4pAgAyvbGQPHZnf64SKncgtPug6+Cxp7i8VnYauc9dz8T6QNsy73nKmFFu/h9d+TM/uLBxa8FdPjX4k8i37GTdjWSSqe1Ffuy7Fx3/9ZFwAUAypGsGsJ+lDLE8RlvsiSEGESttKk21WEcDPVqSKMrqkBLFq8dkanr9bYfnc6kstFUJH/DYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OaYrq5PLkdEKxiOc8g8tYIVGaBL/cohDYrdZIixKoE=;
 b=s3VeMynE7dWzXx3lCU/bzUmpS2esLi//xa8HyOObwL4fse5LAFi1FzhVWW1LqRK0VhWs4rnJmISXqXE/lfYT2MYoePXy98jrgFUxcvJdnBk1Nz7fAXRF9cC7KV0Iz7UDr99YwnuwBOC8/K8eo6hqtlJiDO1smnyp2dWmvzKrm1HMiE4PEix9tGP1wVN5Xwf5FKgj7AjZQYySk8jlIYSwNzweB7CeCa7/LNr/CqIXmD1AOGPumWHNz7PjzhWbOTu6NpSBAmlF/l+u/YH41zKj2iguG+t+f6K5qZu24m/DYEoKiY10zDg/PEa+bHE70lsJetd3p3QXy4MKciYyZOFiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7711.namprd11.prod.outlook.com (2603:10b6:510:291::6)
 by SJ5PPF77D28E3C2.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::837) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 03:16:50 +0000
Received: from PH0PR11MB7711.namprd11.prod.outlook.com
 ([fe80::8c82:8ec0:f48f:b823]) by PH0PR11MB7711.namprd11.prod.outlook.com
 ([fe80::8c82:8ec0:f48f:b823%4]) with mapi id 15.20.9478.005; Wed, 7 Jan 2026
 03:16:50 +0000
From: "Alvi, Arselan" <arselan.alvi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Tie page count tracepoints to TTM accounting
 functions
Thread-Topic: [PATCH] drm/xe: Tie page count tracepoints to TTM accounting
 functions
Thread-Index: AQHcf2uqRhWvGej4REKDRt7CFPctzrVGCGtT
Date: Wed, 7 Jan 2026 03:16:50 +0000
Message-ID: <PH0PR11MB7711938E0263C5518DB7061A9584A@PH0PR11MB7711.namprd11.prod.outlook.com>
References: <20260107002154.1934332-1-matthew.brost@intel.com>
In-Reply-To: <20260107002154.1934332-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7711:EE_|SJ5PPF77D28E3C2:EE_
x-ms-office365-filtering-correlation-id: efc836f1-c788-4cae-5ce9-08de4d9b32d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021|8096899003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Kf/I18bWkBfHArFgxuDzxfLfGiFHJE6WnBH6FWoG2SxXe4fXslTbavSBnIGR?=
 =?us-ascii?Q?Sub9qY1Dl1jfllKvCwVOsg3lPuMdx7+p6QC0L7x8c7dvvUonbuAx5k/SGeVW?=
 =?us-ascii?Q?JUBp2rJ63ndh+HZrXBaPQ2D67J7epC/mRlx2t2scN8e3ivrkHtrpNG9LizQw?=
 =?us-ascii?Q?zmJk4ZyZKSBCW0xmBCTPFvHBN4vpdx/EroEnoDX9Oo1FTmn/4VtNqy1WV4tU?=
 =?us-ascii?Q?jy+DERCPJpX84mLYsF5huHCKT588FiQz1csH6q9MAyhQzoTtWOCxdVD9AaEq?=
 =?us-ascii?Q?HC+RUqnq2Q3lqSQIuicIVIK90mFb9Eq2rElLNIlJEMqJ9oaHWKmHTnD/REEY?=
 =?us-ascii?Q?uTIeIsR7591g1rhqzOAUOJrcdyrrdCxALHLk2thP7/jriXpk8/t7m7TzCs2d?=
 =?us-ascii?Q?jujYcrHcmW/3vkLJUX/PnouXKs8HFPoxDCGMYI/rhQgxyEf4JJ3lPMKgaXcn?=
 =?us-ascii?Q?Yna+xD6p7qFBAzmBGG8XDMHJ2QkTwCz1qfWN4QVPpS1oc7SVwf6wt5RtWl7l?=
 =?us-ascii?Q?ahOU4cW2DAUyCSHpt21QdKGIaElbNKgvgGkxxMbc4vSLljwP+lo7Tgee9nRh?=
 =?us-ascii?Q?h8czD1EU2nDwKN6gEgDuv2tgbfwMe9tqQHauqUAwp2USlLAxHnj6x9yf3skX?=
 =?us-ascii?Q?QEg441O6Ux4ZUEok0DtxJzRA5qHxlBxi86VWWPWHjs5sXJ+UFuD5J3DetfdZ?=
 =?us-ascii?Q?elVjlDxxbX7fYbYHlPrCB5NANZl+3fyTKhHAIOFF2x22tjndMieHQXSGApSf?=
 =?us-ascii?Q?Qj+GNyxCoiihy51RqUzDdCXNsCN/lRp5Hn3jjZz1SSLJEx25UZKZe6o7AjJN?=
 =?us-ascii?Q?I/NcF8xsUqh2yP6QI2ohOUAQVZKnYThuaM2Fl6KpYmwAb7YW4kS6KrenqUDN?=
 =?us-ascii?Q?eZvuLz5Z6z6bTNFa/0gQhTb+iHpZhC1xaIOijz3L8eZJNgzmwBt5xvJiQYjY?=
 =?us-ascii?Q?cWJhlR2usgJRPcOgBOf6XO641msKs+qv6THt0Tu9HkEDTA3qThtV2gYLTPgK?=
 =?us-ascii?Q?X4zST12s+KvF5YIJmaP5WzY4+NRZSZ6riDWpZrNBt2nijIvd8mKAvn1Q+iy4?=
 =?us-ascii?Q?dACzwd8Mwg4V6GQ2XPpWFvPc678LOj9U3QaBCiuYycyRUDmnd/Ngn6sWW24L?=
 =?us-ascii?Q?kXty7cWlVeR9VzLbrV8QRNdGBDP7GpalXIfUB4b0PiPoNqfz1ZuEUwLdYi+p?=
 =?us-ascii?Q?EkI8qMqJm51RVS6dugqqroTe56sU9rFQEHi8vziIBQXGDWfIHhdkwt4W/Bcj?=
 =?us-ascii?Q?F3LAzUYs6cUFKCCZKo0h4HatslPGso7sJBXfFdA1z3cEwsOZ1i453cxDMP/i?=
 =?us-ascii?Q?F9OGJRKx0Bcxf4PV+Eu9WAw6xTZ+JBNkScY4gshDruAnIGdCN3niNFFbU3uB?=
 =?us-ascii?Q?6vNqrjFXq8nrNrEkOyxMBlLI9e+S4FZhMAJzMCnSNVSr0hIv5XOCCuda+f2X?=
 =?us-ascii?Q?4AB2Ucf2srblf7gSWyThTuEGgZy/4JdDDWVyNAMLjoCZ820xrEG3FmJ3KOYA?=
 =?us-ascii?Q?eGYNjy2qlwC4TXjhbghS/ky+lIDWWGwAX7zR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f+jVSOLPK2bAxtPBpYlV7pwdNSH3Gu4H215KKksvmVsOhQeovvjuPXEAT7nO?=
 =?us-ascii?Q?N46/26jvYu2ci+OxUQqcdeNvx47oAK55ho6PQJpoeMWRBTBakcStOWx+TdUT?=
 =?us-ascii?Q?RLDKCPQPPSW0WNzWfgD9CMFrMF4IRPoqQ69D6vpUlGafU6kXMrwljeX6VV+C?=
 =?us-ascii?Q?Q25/aR+16x7Jt2EW6X9BHudRwsdEVCMjM7hcHk9Fvgqv8cnrUepzDQoDpDbo?=
 =?us-ascii?Q?LjTJL9rV1Qlm23zmhKIXBULcCdDKlqT9W8ue/rbdvkE2Z/QYoaGN86qgOVTA?=
 =?us-ascii?Q?VZi6giXiU5bqS6460lcgH4206oT2UVv2J1iCkkISEDXIM9qJKiJDjXfwah1T?=
 =?us-ascii?Q?hCymxX937fIHaSemsrqZuMHMud32DFn6eGpe5QyxjpXFNhAXBtvAbBvRWrcU?=
 =?us-ascii?Q?qaVet3KLm+JW8uiNRA+1aoOvI1bQz/XNM1Boo0xFijNkTU4HkAc/DzqJmgaj?=
 =?us-ascii?Q?6kNbKWJxH8FYE1EIsh3/nXFqIhoDuZ1hAAk56bSP4NO+HBEvd/F3WzsZ8ZQO?=
 =?us-ascii?Q?OSPkjVRIJE26XghyThDFFjQmr96pnGnaEyF6YxAIWAasW/AznD3b9DCOpsSv?=
 =?us-ascii?Q?8yqXNl7JWXSMknwGDPtCy3biUUEbO6tdJV5SNOw9wKTTtXbNl47+tNxczfkg?=
 =?us-ascii?Q?gB+ZwcmORDhPKB9RMUX5aUr1ndo3zr/AIP0fOvE65PdVUo37c6Ksoui0b+wp?=
 =?us-ascii?Q?J6LXpcQ/Kv+2NuXcoW9CthD8eJeK9G2WAwwz5Nw8ox2b8RDbuGZlqbtyLUNt?=
 =?us-ascii?Q?raK5CyoMNR8u4zChePoll2T8Cf+G/h/erLLutuHlE79eryJa9P7Ub/TirJTa?=
 =?us-ascii?Q?O1nC/2PoMilAr6uQU5X7Q35BRxfh0tmX7MEDWiHT3YbufQ4kNEUpiuueymmL?=
 =?us-ascii?Q?RIeSmOKYoAmdCr2nU9lWupQ7uNuPqvGkL4AsPuxZpDIEqmOygjc6zHqRqzMM?=
 =?us-ascii?Q?rax8EZYPAbVOMD0NzS/SnyWEAfEWniN/n9o1y4RlwHOv3JVEAju4h8UvmuXn?=
 =?us-ascii?Q?4AghKA1dxsd7Vwu0Fujils+Q9eSExVEgci7QiiJUnvZ0Yi7jJmm7Lx0Mp1ZW?=
 =?us-ascii?Q?DotU21YzE9sZu1iUysunBGUiJJ4j3CxgtIIKuOaAXXxHNBrrHPp+tXxuH6GZ?=
 =?us-ascii?Q?zkqBMz6xNXHxoJ2KiogP6aiFBrehAfNeBYxSLteZLBrI9voQvffGV9P+0bIB?=
 =?us-ascii?Q?XqH7vFo51TvT6U932/CzPFkvjozuaLxxbIWGEi3RMtp4wh+KTQw89gpVuxNK?=
 =?us-ascii?Q?5KyeVRXNYlBSQJ8oqoLcOpQFquh7XGjpHlGza03jtaKqZIZkQcR9oIvGYlSR?=
 =?us-ascii?Q?eIH69/fzTD2I+uwZV/LX+BAL4gcPqpEVBQcq9BmOAjnYviGeQwI+kfx90I79?=
 =?us-ascii?Q?VeTBztS24WtsrTiVdofquNH5AjolgLAS2OgEJYo8z3VS04Fh1oIDv6SgmznT?=
 =?us-ascii?Q?tQQfR7ZpHhUpUdExrndcUZEQIWzKvTwci362XyF5Yzn5VzxKIUi8qn+XZiiy?=
 =?us-ascii?Q?vVtrLRpAhMGSkO6FTkcvAkQWAFDAHcGKKl53ZR+V5qk0dG0wZpipcc1liMEZ?=
 =?us-ascii?Q?n8DjFh3Qqw0QOy0Z6gyD7apd1lU+Jw1yuEMrxkq6cgOYMQVJTPLo1tF5dgr7?=
 =?us-ascii?Q?rkv7mWj4+5W2PcyxcO4Q7RJ6OpV8QR5TtTAYRvIuNL0sf/EeYBuxKJeXSsVk?=
 =?us-ascii?Q?PjBESaz2ujd9f6IiR69p6B34lOTFh2NdUQqyBQn2TqlsZYW8vgesYLMVydnv?=
 =?us-ascii?Q?2PASQ5CBfw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR11MB7711938E0263C5518DB7061A9584APH0PR11MB7711namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc836f1-c788-4cae-5ce9-08de4d9b32d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 03:16:50.1046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qUngK3NzoZL+BARtIX7aaxgm9bltYJcGdl6stbYPI/zc/Fr9Ex0g06tBzGX5kDS2noX1FxSY7EpDSfU5bWaOkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77D28E3C2
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

--_000_PH0PR11MB7711938E0263C5518DB7061A9584APH0PR11MB7711namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for the fix, Matthew.  Adding my Tested-by.

Tested-by: Arselan Alvi <arselan.alvi@intel.com>
________________________________
From: Brost, Matthew <matthew.brost@intel.com>
Sent: Tuesday, January 6, 2026 4:21 PM
To: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
Cc: Alvi, Arselan <arselan.alvi@intel.com>; stable@vger.kernel.org <stable@=
vger.kernel.org>
Subject: [PATCH] drm/xe: Tie page count tracepoints to TTM accounting funct=
ions

Page accounting can change via the shrinker without calling
xe_ttm_tt_unpopulate(), but those paths already update accounting
through the xe_ttm_tt_account_*() helpers.

Move the page count tracepoints into xe_ttm_tt_account_add() and
xe_ttm_tt_account_subtract() so accounting updates are recorded
consistently, regardless of whether pages are populated, unpopulated,
or reclaimed via the shrinker.

This avoids missing page count updates and keeps global accounting
balanced across all TT lifecycle paths.

Cc: stable@vger.kernel.org
Fixes: ce3d39fae3d3 ("drm/xe/bo: add GPU memory trace points")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8b6474cd3eaf..33afaee38f48 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -432,6 +432,9 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
         return xe_tt->sg;
 }

+static void update_global_total_pages(struct ttm_device *ttm_dev,
+                                     long num_pages);
+
 /*
  * Account ttm pages against the device shrinker's shrinkable and
  * purgeable counts.
@@ -440,6 +443,7 @@ static void xe_ttm_tt_account_add(struct xe_device *xe,=
 struct ttm_tt *tt)
 {
         struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm=
);

+       update_global_total_pages(&xe->ttm, tt->num_pages);
         if (xe_tt->purgeable)
                 xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages);
         else
@@ -450,6 +454,7 @@ static void xe_ttm_tt_account_subtract(struct xe_device=
 *xe, struct ttm_tt *tt)
 {
         struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm=
);

+       update_global_total_pages(&xe->ttm, -(long)tt->num_pages);
         if (xe_tt->purgeable)
                 xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_=
pages);
         else
@@ -575,7 +580,6 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_de=
v, struct ttm_tt *tt,

         xe_tt->purgeable =3D false;
         xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
-       update_global_total_pages(ttm_dev, tt->num_pages);

         return 0;
 }
@@ -592,7 +596,6 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm=
_dev, struct ttm_tt *tt)

         ttm_pool_free(&ttm_dev->pool, tt);
         xe_ttm_tt_account_subtract(xe, tt);
-       update_global_total_pages(ttm_dev, -(long)tt->num_pages);
 }

 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *t=
t)
--
2.34.1


--_000_PH0PR11MB7711938E0263C5518DB7061A9584APH0PR11MB7711namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif;" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">Thank you for the fix=
, Matthew.&nbsp; Adding my Tested-by.<br>
<br>
</span><span style=3D"font-size: 11pt; color: rgb(0, 0, 0);">Tested-by: Ars=
elan Alvi &lt;arselan.alvi@intel.com&gt;</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Brost, Matthew &lt;ma=
tthew.brost@intel.com&gt;<br>
<b>Sent:</b> Tuesday, January 6, 2026 4:21 PM<br>
<b>To:</b> intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.or=
g&gt;<br>
<b>Cc:</b> Alvi, Arselan &lt;arselan.alvi@intel.com&gt;; stable@vger.kernel=
.org &lt;stable@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH] drm/xe: Tie page count tracepoints to TTM accountin=
g functions</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Page accounting can change via the shrinker withou=
t calling<br>
xe_ttm_tt_unpopulate(), but those paths already update accounting<br>
through the xe_ttm_tt_account_*() helpers.<br>
<br>
Move the page count tracepoints into xe_ttm_tt_account_add() and<br>
xe_ttm_tt_account_subtract() so accounting updates are recorded<br>
consistently, regardless of whether pages are populated, unpopulated,<br>
or reclaimed via the shrinker.<br>
<br>
This avoids missing page count updates and keeps global accounting<br>
balanced across all TT lifecycle paths.<br>
<br>
Cc: stable@vger.kernel.org<br>
Fixes: ce3d39fae3d3 (&quot;drm/xe/bo: add GPU memory trace points&quot;)<br=
>
Signed-off-by: Matthew Brost &lt;matthew.brost@intel.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/xe/xe_bo.c | 7 +++++--<br>
&nbsp;1 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c<br>
index 8b6474cd3eaf..33afaee38f48 100644<br>
--- a/drivers/gpu/drm/xe/xe_bo.c<br>
+++ b/drivers/gpu/drm/xe/xe_bo.c<br>
@@ -432,6 +432,9 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_tt-&gt;sg;<br>
&nbsp;}<br>
&nbsp;<br>
+static void update_global_total_pages(struct ttm_device *ttm_dev,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long nu=
m_pages);<br>
+<br>
&nbsp;/*<br>
&nbsp; * Account ttm pages against the device shrinker's shrinkable and<br>
&nbsp; * purgeable counts.<br>
@@ -440,6 +443,7 @@ static void xe_ttm_tt_account_add(struct xe_device *xe,=
 struct ttm_tt *tt)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_ttm_tt *xe_tt =
=3D container_of(tt, struct xe_ttm_tt, ttm);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_global_total_pages(&amp;xe-&gt=
;ttm, tt-&gt;num_pages);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_tt-&gt;purgeable)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; xe_shrinker_mod_pages(xe-&gt;mem.shrinker, 0, tt-&gt;=
num_pages);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
@@ -450,6 +454,7 @@ static void xe_ttm_tt_account_subtract(struct xe_device=
 *xe, struct ttm_tt *tt)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_ttm_tt *xe_tt =
=3D container_of(tt, struct xe_ttm_tt, ttm);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_global_total_pages(&amp;xe-&gt=
;ttm, -(long)tt-&gt;num_pages);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_tt-&gt;purgeable)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; xe_shrinker_mod_pages(xe-&gt;mem.shrinker, 0, -(long)=
tt-&gt;num_pages);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
@@ -575,7 +580,6 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_de=
v, struct ttm_tt *tt,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_tt-&gt;purgeable =3D fa=
lse;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_ttm_tt_account_add(ttm_=
to_xe_device(ttm_dev), tt);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_global_total_pages(ttm_dev, tt=
-&gt;num_pages);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
@@ -592,7 +596,6 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm=
_dev, struct ttm_tt *tt)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_pool_free(&amp;ttm_dev=
-&gt;pool, tt);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_ttm_tt_account_subtract=
(xe, tt);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_global_total_pages(ttm_dev, -(=
long)tt-&gt;num_pages);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_=
tt *tt)<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB7711938E0263C5518DB7061A9584APH0PR11MB7711namp_--
