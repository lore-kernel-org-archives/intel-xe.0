Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AD2C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 14:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488210E2E4;
	Mon, 10 Mar 2025 14:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwZBKUzA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6AA10E2E4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741618216; x=1773154216;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4T4SIYfY3FclQEtDGXoBNil+z5J2WK2Bc7uTrMX/ApI=;
 b=kwZBKUzAlCet7t9SHc0Jghm+0dbpBNJMB718OJ/EfyRCF4i4kUzrXxSw
 Vpmq9tS/bZ3YVAkpWASpwrOjZWKKGx1YCdq8F5GPvHmNZv0DX2k+94LO+
 KNXoNNZhpE7a/KdIB2WPpp3Hi8qQJHT2H0QXPcROn1JUHfbTZQ3CnMn4H
 AbB5U9S7q3KSpywU+xvJmFjJgAKA1OoQmtAzWqo9FEYhi0U/pa/7+ffJY
 urcgMGJyl77lgfgLoIOs8OvVrRy7w3GDuW5Z33boK8jtzkDeD/jekAojW
 +HbKwE5Kw8cNwXjqTPZpS+0OQJir8WXy+dql158j4740dy1LuBf9AGnhA Q==;
X-CSE-ConnectionGUID: UDyrvebwTWK581JA6ysg2A==
X-CSE-MsgGUID: Wx5CZxuyRbyFpNpJh/SBmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42525561"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42525561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 07:50:16 -0700
X-CSE-ConnectionGUID: zFyqoFpeQq+H0CiqWG02zw==
X-CSE-MsgGUID: umUhdlwdR/Gv8Oibsip6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="124920859"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 07:50:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 07:50:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 07:50:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 07:50:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4msBd0/yp6opbx1iT4osakTQ5TklPwRzyPZXEPVIW8mzSwS0nDYsgQcoARghKF32FLioEWI9a7Q8ewqAnOC/o1Q1m0cr3bQvRV3zSGTXjZekqy61EAxEwUWbL2XNSHaetZ2C4UiZbPqGzyUEwKUuSEhE9CD4knoATI0FW5sa7h+H7kHTHPftGsz0dHFQy8/aGmPiLTCZAjdkjUz56Dcq9lAFNn+Za2Y/x+8wTKPM3iK8j8aSvWFYGB5OvHw/TRvNR3vLG43DXptz+yNzS0Ju46Ta/k+nmtirb3Lps0FZYL+sKHmZZAaduNbeGPez7RhW8E0BKq8M5a6WAJR0rStKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V32Pb7/AsnObUmy5R40nQMuQE7kSzZK6ZenWa/XMZBA=;
 b=ceLSG2e/I15njeqUiyYW5rh+1Zm87xInVHcIWggwskLHXgkpPNFOFNQJumA+CKDFEG+6Z06o3LMCBW+DzmH54yp3MM+NaA/dUVAOqg+KiIVNYRYF6RBbZ3HcW8DYsgjIVn5S2YsU+I7VRxIu1tjAe+oRk8HsG2mLYJaeTJMdwbn9P4cDvM58nZeAeaZJIIrr7Ad/scgg0pj9FxwswZ1KL4Mirt6jmILODpvNDDonQqIH1S9yD6DFhkJeKxQoaU2hVA1bveJyK1fr1zAeypFV8unWY0FOlhC8LQhk/h1T0LxM1QuC/PyHJgFqiRhk4WK2BPbOecjlytW6tIh3mIe/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 14:50:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 14:50:08 +0000
Date: Mon, 10 Mar 2025 09:50:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe/rtp: Drop sentinels from arg to
 xe_rtp_process_to_sr()
Message-ID: <546a5gvckwwifqqvoqelrqvzab2km3czjfplza2kvz7bfl32kx@j76qz2ntxg2w>
References: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
 <20250306-fix-print-warning-v1-1-979c3dc03c0d@intel.com>
 <6111972f-8b3d-4b3b-b27f-83241af9b5e7@igalia.com>
 <377u65lxwxlzdxr5anzpn3ykk3bud3vyikpy3l6qnxboltoxyn@xeaiizgnyl3q>
 <7c720d6e-c177-4c31-822d-7e9acfe81da9@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c720d6e-c177-4c31-822d-7e9acfe81da9@igalia.com>
X-ClientProxiedBy: MW4PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:303:b8::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d74ced9-9973-4dd8-9382-08dd5fe2d9ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?abA/ENFwASWpycpVDPrnrsDb/mw0OROigoKX1MARLpq+7AB3oYz+uBF60v?=
 =?iso-8859-1?Q?y1DgOGsifZpp/kbHk5OGg3W7B4awbTaenKmA+bPsa1prwrUUiPrObxSrYC?=
 =?iso-8859-1?Q?B9Q5J98+gdqBR2LluzwDPk2oIJTfOicPbCoZ70TYvNCwtjiVubarJyQ64N?=
 =?iso-8859-1?Q?uPPEahihPWJOyBBgAsepIyWZcApeb//i23Fy47JeJWEkPECnEGv26vnou3?=
 =?iso-8859-1?Q?feh1HB6ERNvqCyI4CvvskzT3MLAqFvhbhcL9eYU3VndfY9GtBjufDQNPYG?=
 =?iso-8859-1?Q?nWV2W0hOeiTnNYA2FWGs5t8iPNFuOE3vp6ORk7eTWAIVo+a6BZASiwQRfm?=
 =?iso-8859-1?Q?kffVJPiDp3pyFHzyA8x9MhRhGcN/tCXLUdnvFQAtL7O6wsn3q3PNGPepyM?=
 =?iso-8859-1?Q?inhjHZSSBtvdI7u4BtEnoOoR/4UmVA47k+vDKSrgi/BlBjbGpX/yMoWZU3?=
 =?iso-8859-1?Q?XNcdOb4nOR5Q31z/iJtH87PsBG1iDK5Dd/kN1ecLOfvfjaUrzt6KD8qh9e?=
 =?iso-8859-1?Q?aCsi4j67u8qgQ1ukBPA0pdoOtoosCzdCnsMli21I4sHBpJGJppaOb1zWxh?=
 =?iso-8859-1?Q?5L6F6UmDXHdJVU9hU/L6FKdvM4Xp/dlQt20VQRanoq59sEJ9Xt68XleX58?=
 =?iso-8859-1?Q?MOUqIY8Ign4nLo5koNlita3cRIlQt+ipjnIYwUPcMgUEXyH7IalxoEHDYJ?=
 =?iso-8859-1?Q?Ga/jHrWQW1lhqLh1hsKUWgCU72MxB83zVS6DYxNQKJShgDqhxr8thRVqrI?=
 =?iso-8859-1?Q?1n5yK+6jYb+032MarBnDI8af0HDdS0pROEGWsfuavIzzTKIBSJX12UQU6m?=
 =?iso-8859-1?Q?2wtTBaDP64uY7uyBaQd+b5KAUPfe8HEHenOhMCEpl+Y7BzxXlQDSKt6Lrr?=
 =?iso-8859-1?Q?flcxGf1TdZai5rYbNmKywdfcWsByLD08Y3lcAyMFsmEERuhV5w5Gk4z0Tz?=
 =?iso-8859-1?Q?kLmPrkq+1HEko55fPLa/LU5X3ktm6C8AcztNDz7LLb0n7S00Qgp0s6n/Zu?=
 =?iso-8859-1?Q?ZQoTom+It9r3dFgxKewVl2vN2VZ0Cu0cdd/G820pSX6fUpIdREeh4CyQ2e?=
 =?iso-8859-1?Q?3aCP/ucLW3zm6u+NBM0tLDarzZn7FPtroL69sNrejrXi8zRaLDQ6n3iRzO?=
 =?iso-8859-1?Q?Do7vrPyOOgEmLsmmfFOrnfJq1sKJn2TYQ3OYBIKZ1vcTFNgcjxgHBktz8w?=
 =?iso-8859-1?Q?rvrqyAGs8yvrZ13Tuq2YqykaUcRCIPiZsLOGOewBo/G6hUy2xJUkNZ0e20?=
 =?iso-8859-1?Q?4flhUary/kyStrdrTnXeHcd8NA2+5gQZ2xFxUQ7NoSAepGhmgocQhPkFtt?=
 =?iso-8859-1?Q?+hKblcuKslVaE750CD6DkzwMIc44tFSGT6sVuqv1xUHlagYDcXU9AVS06M?=
 =?iso-8859-1?Q?1hR5XJBTceYnhhgAl15f2juFu/590W1X7JpxYB5Nvqn6TZG+luPzvhYRSB?=
 =?iso-8859-1?Q?TUIhVonod9NL+XnZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VzU5rdjttpIN/C92akJXtz4HgXIC/byXWJCWrBmOVu8jMfzqhtdROCBDek?=
 =?iso-8859-1?Q?usCLhPkwY/wi1/L09X2uF7Mgq+xifjLwHY+pgZUxR9mle0AZcigV0kD0xj?=
 =?iso-8859-1?Q?UKC7Upli3x+kL4bIr5Muj2LPuhrkWbp/U5D1RivFXyE+UadKeKULhZBY2J?=
 =?iso-8859-1?Q?qLKWU72AI/8Osoom3GPZhMQaCbO0n98I3jMZc2tauhkoL3acsKfGj9KI4y?=
 =?iso-8859-1?Q?6GJjFrUqVor2WrKdaUNs+aCtPDP4O8G8yHevFoYhIGBHC7B4fFBCSFc2XA?=
 =?iso-8859-1?Q?eGQz/O2zkde+0epqqn0UDrgSieaAlvj30PazJfRxJMsTm0Bigj6eOzgTyK?=
 =?iso-8859-1?Q?IrCNpk6O+EYgpmozJed2pltL/ZtUF3aQfdxNC6l5/909v1sYR0APmVgXVb?=
 =?iso-8859-1?Q?P4y2ucGCYQdW5m0ojr+8ULZ0D+PDtEY4nwIiU12Q5yJRkFkawumxtuFECQ?=
 =?iso-8859-1?Q?15p3GCg3zuW8aGYi+NNYC913XAkqijjNVFnd46kBdQLdQqWyANsDEbEQkJ?=
 =?iso-8859-1?Q?gojpOuQYeVBdWzwqb2ExYAHg04OE6uaWBrgCI0sOzMo7kg/apI6wv1QhJZ?=
 =?iso-8859-1?Q?0QBkUVpEF0sj96QZEUwMK0uTNor3QXEI0HexUWesK43Vj+FFXxM5X1vz2V?=
 =?iso-8859-1?Q?i06NNS3jHfhYvsyfScpQhXjIF70dYqx0nq3tzMoipcv0mTaBknX37QysdD?=
 =?iso-8859-1?Q?E3bIqZYX4UKa6KTppffb8uPUfvzTAT5TZw11tZHPMWlimhVBToN50Ib7kS?=
 =?iso-8859-1?Q?/F4CkiCd2TVmAxSHAYB3CnydmG8Q2RK684PPuBINxBCOyxHPPYkoQCS58O?=
 =?iso-8859-1?Q?QMsYsQWRjTl3bx9tPXMG0mEGcga0VoeEoZlRIkd2a8VELvxBjtdGc5vl3a?=
 =?iso-8859-1?Q?ALzDt+wlOinQR/KMdtYJkW7ADRyvxgyzBlTih5C9TWbUsMxyUBluTLkOwe?=
 =?iso-8859-1?Q?04gE7/QcpQ8NkQkIFyotmEl6rS/7RwTLn3OvGbS7JlmBDbMMI2ywJsbt7m?=
 =?iso-8859-1?Q?Q09rniXIUYkfQwen+0CdubYnhzz5LXMedwqKVo6V3cPzObEntmV1jQlLWe?=
 =?iso-8859-1?Q?c899ywgsVtgqlOYRt56LIONxkWvwsRiTHdvX0/hnoaBUOHNmRrxZQGc+Iz?=
 =?iso-8859-1?Q?Nk2BDC+DAcU/UpQk+2H2yu6AVpP19MRuYTFqcCQdG5pLbCcaCa+/YAlhOj?=
 =?iso-8859-1?Q?37prZJllLI6hbUIGANSaSrRUf5VIPderVos2qL9B8SmrEAE2WTSEESLlwc?=
 =?iso-8859-1?Q?df9i8djpBEImJcUw83lH29vKzFk2LMmYawawPVJWE+Y+SW+U6lb4mzSXV4?=
 =?iso-8859-1?Q?1WHt4tPygExnJbyUKLhzK8fiQYkcNiojcf8Z4InqQ8dAUAClJ2zCVAfbIQ?=
 =?iso-8859-1?Q?WWrQIVC18SGMBq0v088l8I57iVuEE92WtKCfbPoGEphASQCCSiN49JHfJ6?=
 =?iso-8859-1?Q?Ri+dlhVgUgM80TSNaLNauZEJkRdoyp9NX76aSK/oYksqMFRbcSUXLqtCTj?=
 =?iso-8859-1?Q?wJIxy5Sh8TX7uHhXl2PeeBF/TBMiq1Bl0QPNnsXiS8G8KeBo0QXbSj+4wr?=
 =?iso-8859-1?Q?A73hpk4afiOSLCwuC4xLWM0sd2j/VCTzYV9FjsW43u2bWhvVw9Un8xSX7j?=
 =?iso-8859-1?Q?os9TE/g3rllV4EzTrAmz7OdCz3Q55FJxYltN63aKjZrR69NCwNUlYcQQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d74ced9-9973-4dd8-9382-08dd5fe2d9ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:50:08.0011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gri0wbS+Ly5EIHHD07cPGhxaWlHlYX5rHFZSZgQ7MsKkn6P4k601I3k/0ebOVbD9M7IIG1MWbk1dIyKy6ki9h954BASvEKkpxUgtCiSC7Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
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

On Fri, Mar 07, 2025 at 05:00:16PM +0000, Tvrtko Ursulin wrote:
>
>On 07/03/2025 15:57, Lucas De Marchi wrote:
>>On Fri, Mar 07, 2025 at 12:00:14PM +0000, Tvrtko Ursulin wrote:
>>>
>>>On 07/03/2025 04:00, Lucas De Marchi wrote:
>>>>There's a mismatch on API: while xe_rtp_process_to_sr() processes
>>>>entries until an entry without name, the active tracking with
>>>>xe_rtp_process_ctx_enable_active_tracking() needs to use the number of
>>>>elements. The number of elements is taken everywhere using ARRAY_SIZE(),
>>>>but that will have one entry too many. This leads to the following
>>>>warning, as reported by lkp:
>>>>
>>>>   drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
>>>>>>include/drm/drm_print.h:228:31: warning: '%s' directive 
>>>>>>argument is null [-Wformat-overflow=]
>>>>     228 |         drm_printf((printer), "%.*s" fmt, (indent), 
>>>>"\t\t\t\t\tX", ##__VA_ARGS__)
>>>>         |                               ^~~~~~
>>>>   drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of 
>>>>macro 'drm_printf_indent'
>>>>     226 |                 drm_printf_indent(p, 1, "%s\n", 
>>>>engine_tunings[idx].name);
>>>>         |                 ^~~~~~~~~~~~~~~~~
>>>>
>>>>That's because it will still process the last entry when tracking the
>>>>active tunings. The same issue exists in the WAs. Change
>>>>xe_rtp_process_to_sr() to also take the number of elements so the empty
>>>>entry can be removed and the warning should go away. Fixing on the
>>>>active-tracking side would more fragile as the it would need a `- 1`
>>>>everywhere and continue to use a different approach for number of
>>>>elements.
>>>
>>>Patch looks fine, and dropping the terminators is good. But I 
>>>can't say I understand the warning. How it will process the last 
>>>entry if entry->name is NULL? Hence bitmap will not have the bit 
>>>set, hence the dump cannot iterate over it. I must be missing 
>>>something, I wanted to say obvious, but I hope it really isn't. 
>>>:))
>>
>>yeah... I could reproduce it only with the compiler provided by 0day,
>>for microblaze arch. Even the same gcc version for x86 didn't reproduce
>>it.
>>
>>>
>>>Regards,
>>>
>>>Tvrtko
>>>
>>>>Aside from the warning, it's a non-issue as there would always be enough
>>>>bits allocated and the last entry would never be active since
>>>>xe_rtp_process_to_sr() stops on the sentinel.
>>
>>^ this paragraph tries to explain why it's harmless, which made me not
>>even add a Fixes trailer. Indeed xe_rtp_process_to_sr() will never
>>process it, hence the bit will never be set. The I can see is that later
>>when we are dumping, we are using for_each_bit_set(), passing as max the
>>bit related to the empty entry. So maybe there's a diff in bitops for
>>that arch that makes the compiler **think** the last element could be
>>accessed. The alternative fix I started was to pass `ARRAY_SIZE(...) - 1`
>>in the for_each_bit_set(). But that looked ugly.
>>
>>Note that it's a build time warning - if that really happens in runtime
>>there's probably something terribly broken with that arch.
>
>Hah.. go figure.
>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

thanks, applied to drm-xe-next,

[1/1] drm/xe/rtp: Drop sentinels from arg to xe_rtp_process_to_sr()    
       commit: 8aa8c2d4214e1771c32101d70740002662d31bb7                 


Lucas De Marchi
