Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079F4C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 13:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DE110E7E9;
	Wed,  9 Jul 2025 13:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEq2d0gs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B6610E7E9
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752067833; x=1783603833;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vkz66sA1WcDdgN23ky0kH+8fEL/gD7SYWNww4El3e08=;
 b=nEq2d0gsrjaDJFoKtP04ND/ph6yEShYhzlLyhTx/Mb7cMn4A6t9LTDIR
 K1q/O0EGwHubfY3ck9jP7MxLlRRAxCSuCeiAggQT0nr7pRnilT26inlo1
 TiulFX4K/by1uwqBHu2Z9a5JjB2u4V6KBFqBXKl9TYOIQbYpIe0Xou3cD
 wTW9YHjgUzgfmIr2smZaGfhIHzOoIZpBsPDfHy1PIRinlhXJB5TmvBQXT
 RfMFzloUa3G0DGb39izTD9nEDRTT96hFF1pYJI2Rz3X1ddxF24D/7c53U
 KE8MfPdx8/Bw3BPbiGk+A/4+auwKoJweM1G96H62Sz3qevvq74KC1Ufor w==;
X-CSE-ConnectionGUID: SezK352pSe2xLDGhxMSEPQ==
X-CSE-MsgGUID: 1koM6MIKTreK/vcTqHnoaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54455681"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54455681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:30:31 -0700
X-CSE-ConnectionGUID: EQVorP3JTC6s4ombeefbKA==
X-CSE-MsgGUID: lyeWCNttSbe82TGZLVlaqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155867097"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:30:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:30:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 06:30:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPyoAd8/LkOflwJQ+GL5JjoHWaOtVF0Q5urxNi5hSSKzgtH0cxvLjtn/TiHv0pFr6D1SRlGYAPKrTE7FiRd7HnSHw1x6zOKN/i90EsC1NKLZONdDjzkg+CAOvuFdiozJHJYIVDTvDMgNvoKTZeu/qzwBAnqZpS3ybV9rxfP1ThheGpUQ/6rbJU/KjmICSzRoTIIKcDHNZPeJVydsxWg/cRx0uFbZGNBA0WZImMD1Bf4Bg/1UMGbHWwaiZ8i0w+QeD7S+tP+4nsj+TQHZ6vnYAzvd/jAdxHzJHBoLeao/pYc6g879IaL1gG391Tl4JqdQqzt5vQsszvrD77hySzqjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdIBkYWrcMykBCaYjVl9B+wHmZlZrfV2hP+dEGws/rU=;
 b=Dr+oO8nGEazMWLt8d8+550ddXVf2/C8MR9mOcNxoUNmaV9oLpbgFZ6bWFMa0hDVmmbBaA5u+K0gZljc3ywRwHuJX+TRgogULfchz8y0qsXBCfLcYrOwQ90AQplV6gza4BoXF/DbfjVMYsk8tM3A8YIvxx3g4IntkMtsQAKF1wSsWGwvKtWX1THRGH7005S17U/CrOFdNKdzHAdOxUqDTpZ7gZVQWErQCK2goYA7j8Y8QLL/96erTF8iFyjnwBoAAoZExtPCfTL9qwPUmrEHKfALxSqzqonfV6Xe8WWeIiww+kwlGRV/l3JDOSHdnWRRyDzfCmjm8JizTbr82mYjruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8259.namprd11.prod.outlook.com (2603:10b6:510:1c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 13:30:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 9 Jul 2025
 13:30:25 +0000
Date: Wed, 9 Jul 2025 08:30:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 5/7] drm/xe: Add plumbing for indirect context
 workarounds
Message-ID: <qnewkoddwtg325ka7ekxvbbrrhsrbq54c2wgxogsysklgilo3p@vjcvjqdsexhi>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-6-tvrtko.ursulin@igalia.com>
 <c3p5ysmlyp3so7zyg2xazmbqryyshsq6ae6i3by326z63mn5oo@rsr34lev4mk5>
 <c71b4b3a-9a4c-4ff1-be0d-f7f788565b85@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c71b4b3a-9a4c-4ff1-be0d-f7f788565b85@igalia.com>
X-ClientProxiedBy: BY5PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:a03:167::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ea8a3e-4626-4eed-d9e4-08ddbeecc335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NxXquLXxw/r+cMDMYTGTErbeEOkcHpaTXqH3u0RXflyqBeh5C3fyNR4G15?=
 =?iso-8859-1?Q?+Ie/ushPLVAbjhMTNuDIn0lB+oaH7HTQW8dUzepuJQKTYp+RLnibjvTJQx?=
 =?iso-8859-1?Q?pRgBgU4vR338emdzCZwNLMHMCpqUE2K06x41lXkhs9joKmkEZuQldb5ZsC?=
 =?iso-8859-1?Q?mvtTI7veB21Q3pWVWAFZBCr6k2AdyNbmBITG8uy8OBxhDsCSPUj+mYRe+8?=
 =?iso-8859-1?Q?xv92mqEj+dZeAdnLJ3x5PQ1YyHRSlTg/hZxRFTVvYaOlzAp5x9iYbintUi?=
 =?iso-8859-1?Q?T8JUNeFS0yDQmQj0TRZmgwAABuw+UGMt7yCVRS2Tt5Hq4sfKce4JCpuKqI?=
 =?iso-8859-1?Q?Qs6Hn3PkA+OhiFKA7770RJeTdoBDieUQK5payJD3DEmcLt+ZqjUaQslrrj?=
 =?iso-8859-1?Q?i4103+hTJPMdEEAc7XWhl4r4BGTIHQ21/9oXynPkobSuvern4MkYxE+V9D?=
 =?iso-8859-1?Q?6+/JSuOXx8HlV3a6fE25hGGWvx4NT4Pu/u/KqQNN3tWQmE1A/5QuNrD1zX?=
 =?iso-8859-1?Q?s0PxDlm+IoN98myoaSBlrDqns7SbfK632JJylUF5TlZcvfrpYLumKEHKX0?=
 =?iso-8859-1?Q?M+jScpZ1MWlk5f6FVW63qTvoBjyVawRGrRl/zNXI2x7A5puiFTEReMZWP+?=
 =?iso-8859-1?Q?ux8aQeqI5z+l8rlwsWQXlKCKgH5O1W0QSfEzKFhDn5v5nF5GOGogP2DbN1?=
 =?iso-8859-1?Q?pCbF+/CEOgBs9eTiojAxf35vdON6SwxjQ3Ol5AfOnNTyzvCrnRCxRGPd/j?=
 =?iso-8859-1?Q?6GeaEFGJV+NuQN9MvZvoDJGyaZdWk7ZCmAy0Uc1HwUlN5MWOrBeLlGQvnb?=
 =?iso-8859-1?Q?VJmn4HodwjoL+m2Q2utpBpAzyPtWKi2Lt31KY9wWoi5jJeqeV+0S/ymC5e?=
 =?iso-8859-1?Q?5JpmvXIdpRFbj39GmATCysBdMo/Gtla6H828gUTyaIUunXYRCaY8CCTaQq?=
 =?iso-8859-1?Q?KmST+Dzkv9WN2r9VJCYc03ZS8/ObG6EDGqyaNcOKEqQ+EohS3nCl2UN8rW?=
 =?iso-8859-1?Q?SslkruKops46w30hA8GCEZBPa22DnXWXIHJ+f5xT5BQQ84U9h5y+uY9m6B?=
 =?iso-8859-1?Q?7FKVLwHUt2nmxPW8nmNVkcMUqPrxCsDxsYXN7CoQ9zrJtJN8l7LOHzGVXL?=
 =?iso-8859-1?Q?iVD9CuHCP3KBUeZjsf9rKAMTjRYzMeIxYHJ9TDdwhXRP2RwxSf1uMGOdvZ?=
 =?iso-8859-1?Q?NHiMGb9tyU50hFrYj2l2ZQHglzSrLAt/UgXucZaR/9FtpJXxejHwF+TBcX?=
 =?iso-8859-1?Q?myFSPWa8U1gKN+RB5+m6ufbAIVbIBRtqT1WwVTaolhjd8a+VKwFE7zEelU?=
 =?iso-8859-1?Q?DhRffpLV8cVGgUq3enL6TMheWvBp2FSyKI6pT5qqYEUKE4sOwjTmPdxZ8+?=
 =?iso-8859-1?Q?MoqOovDw4Lsaaj+BVLdhOvnkA6ekeOnII3mLN9tB2Mxx40Zrt0y603rUo1?=
 =?iso-8859-1?Q?UDdRMRYsPJjKdacHz1FNLUgznOo2K8V1847CkCzmRUdw1fl5oa9Wuz4tNV?=
 =?iso-8859-1?Q?aZSuVLrqNIpi94m205rNGw6IlDDe1GLp9WQTQiTNH2Ug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DPaxzrTqiXcR21GZUoFL/utQhqwVJBeMQxE3L9qHEiSwfFd0TG46JeS04Q?=
 =?iso-8859-1?Q?pFuELEzrJ7TcIYUTb/CBxhXEG8xSwNFckcW2txlPxf6ch+IAh5MKfeyRcx?=
 =?iso-8859-1?Q?AJWD1EPXw4M23ALY2vN9lTgRFm9plHIiDdZqZ1z8lSfrT7Erwlr4cXq7SQ?=
 =?iso-8859-1?Q?FScq57yVdecXGq6DBqLcjG9sJhZbyirxbCf+bTy5NBxDt0tEgAmPlNZ3nR?=
 =?iso-8859-1?Q?qcu3MESTm7s03EHbaSIg0TMyIJFTMk0c3Lt6qJXyYgKd68aSNmlDrAG3QF?=
 =?iso-8859-1?Q?HipNRYrOUjHFaWaEVUQjQqbCRLZ98Y13WeeM5HrGvXdxh56674yFWULbsJ?=
 =?iso-8859-1?Q?5sGtwSqUpl/dtDnmmtgCWAfMKA5Vr5Lta76S2QoYcva92sjZCgt85UX+MZ?=
 =?iso-8859-1?Q?DBs9w3WQDzlLpMxXi1DFXs1NV9AGp4AH8w/1M99EjcFQD3j12Zo5OSAoBs?=
 =?iso-8859-1?Q?8qXAvkGR1XujSkbE+WSvr+wamsQBViEMWo4gtSKU51ULgE+QRFu27NioxX?=
 =?iso-8859-1?Q?h9/P4iORDqw7Fa/R+DttljRWCg//VXDH7AC8Y9bQQ1n9pfuUOXlzVk/e/U?=
 =?iso-8859-1?Q?Dm/WEdOk81aFpx+AyO80OM/TiMas0Qg/TkZLUxXI0Fm14NgaZRzZ9lpydJ?=
 =?iso-8859-1?Q?6yY0qvwQKH37L/7/JnxZqLkYaEvkiZfGICdTSxG0FqIaKp8b8g66ztQOX4?=
 =?iso-8859-1?Q?r2E/j+vGjoF+Alh74eFsXinBbpt1uH+r/AV7aUGJNM0dx0XsFOAVHWt/Gr?=
 =?iso-8859-1?Q?ygyVpSUZf+sdmZZjnX/aripi0YS+oNcfbCiq5a/TtqkLbWayozSGHFlkwM?=
 =?iso-8859-1?Q?s04oxf7ZyduPYW/rIEJY1pqt8VE3UujgIZ2ZyGqR3EGA1R30Bz1zLjj7Bf?=
 =?iso-8859-1?Q?hjqNakRI0rbl9jVrbuP66rPw88Mc2Sz8dKm99ljSctLbzMHMg5PVyMSZub?=
 =?iso-8859-1?Q?TFzr3Bh/05o5zQvwdaJ8Pfzz5mYuTLhpfsEfo/C/QcZ9cV+3M1FDuVO4Vp?=
 =?iso-8859-1?Q?x3iEPnzszjMxn/epeGZlOGuQcBXm98xki5zM7diBv2uNOTKimvXIJCP0uo?=
 =?iso-8859-1?Q?GsNA3rem23OgvgBQV8eLoFjclnXTAAK8GUyhZ0xWseU1Q2Gqo44OFW7loZ?=
 =?iso-8859-1?Q?idTWx/uIPq0x30tP/TuCsjf4xtIoW3ls/WD6AX2ktk1vNuWxTWoCyuPeph?=
 =?iso-8859-1?Q?tLiPmuicEqutlhQ4QbGv2Yz5K/b+LvWZXbec4b9VKOCGEKpASwjYMrg9TJ?=
 =?iso-8859-1?Q?2SudFyVpqB9HvNGq8fDtq4gq6VMKBExkdqRrDiAkWWRwl4yzuEeHEOG/bm?=
 =?iso-8859-1?Q?5Qp+9CquC+YEiFFjKQrs8UoI+71HCQNqFedK0u0ILq6xFAQVtF+rAvJY3J?=
 =?iso-8859-1?Q?aEtlo/T8BnR6sT++4y6499/PJ6wgN4HdyTyd656vIuOaGF+kL7Tw9nmlQG?=
 =?iso-8859-1?Q?l0EDEosltaksiRvvCTL6EUOrs3BPxtKg+HYq+P2663nImxCj3h0MJ9jqHL?=
 =?iso-8859-1?Q?uwschR6LIwSR2g2sOENw+QVeqw4oaRYBxJIdzgVHM9oWWtqxl8XNpPRP1L?=
 =?iso-8859-1?Q?fr5XJ1vGO0gkpl7KlNsEze33EKyVimxWRFW42Pe4749M23BXLQBSqITsG2?=
 =?iso-8859-1?Q?kU+mXSai/Z3AZsUnC9MIbueshmiJPiUAts9h89tPVrSPA4hSRhaZ7+nA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ea8a3e-4626-4eed-d9e4-08ddbeecc335
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:30:25.5791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Utwp/yM8onhzTvOujgqbqTvxyTL0D5IFfoLUNIJd1qCbD2gySIguDC0LCNofO8c9ioV1pdrp6U2P39owN15RIcjcuOQpx07FvRjPtqtiIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8259
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

On Wed, Jul 09, 2025 at 11:44:41AM +0100, Tvrtko Ursulin wrote:
>
>On 09/07/2025 00:11, Lucas De Marchi wrote:
>>On Thu, Jul 03, 2025 at 09:20:57AM +0100, Tvrtko Ursulin wrote:
>>>Some upcoming workarounds need to be emitted from the indirect workaround
>>>context so lets add some plumbing where they will be able to easily slot
>>>in.
>>>
>>>No functional changes for now since everything is still deactivated.
>>>
>>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>>---
>>>drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  4 ++
>>>drivers/gpu/drm/xe/xe_lrc.c             | 80 ++++++++++++++++++++++++-
>>>drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
>>>3 files changed, 84 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h 
>>>b/drivers/gpu/ drm/xe/regs/xe_lrc_layout.h
>>>index 994af591a2e8..cfa6db15488e 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>>@@ -12,6 +12,8 @@
>>>#define CTX_RING_START            (0x08 + 1)
>>>#define CTX_RING_CTL            (0x0a + 1)
>>>#define CTX_BB_PER_CTX_PTR        (0x12 + 1)
>>>+#define CTX_CS_INDIRECT_CTX        (0x14 + 1)
>>>+#define CTX_CS_INDIRECT_CTX_OFFSET    (0x16 + 1)
>>>#define CTX_TIMESTAMP            (0x22 + 1)
>>>#define CTX_TIMESTAMP_UDW        (0x24 + 1)
>>>#define CTX_INDIRECT_RING_STATE        (0x26 + 1)
>>>@@ -36,4 +38,6 @@
>>>#define INDIRECT_CTX_RING_START_UDW    (0x08 + 1)
>>>#define INDIRECT_CTX_RING_CTL        (0x0a + 1)
>>>
>>>+#define CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT    0xd
>>
>>this is already the default,  so we can probably skip writting it?
>>If we are writting it, then we should use a REG_FIELD_PREP so
>>the `<< 6` doesn't feel like just a magic number
>
>Done.
>
>>>+
>>>#endif
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>>index e278c12a41f9..70db4c5764e6 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>>@@ -39,6 +39,7 @@
>>>#define LRC_ENGINE_INSTANCE            GENMASK_ULL(53, 48)
>>>
>>>#define LRC_PPHWSP_SIZE                SZ_4K
>>>+#define LRC_INDIRECT_CTX_SIZE            SZ_4K
>>>#define LRC_INDIRECT_RING_STATE_SIZE        SZ_4K
>>>#define LRC_WA_BB_SIZE                SZ_4K
>>>
>>>@@ -48,6 +49,12 @@ lrc_to_xe(struct xe_lrc *lrc)
>>>    return gt_to_xe(lrc->fence_ctx.gt);
>>>}
>>>
>>>+static bool
>>>+gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum 
>>>xe_engine_class class)
>>>+{
>>>+    return false;
>>>+}
>>>+
>>>size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>>>{
>>>    struct xe_device *xe = gt_to_xe(gt);
>>>@@ -717,7 +724,18 @@ static u32 
>>>__xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>>>
>>>static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>>>{
>>>-    return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - 
>>>LRC_INDIRECT_RING_STATE_SIZE;
>>>+    u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>>>+             LRC_INDIRECT_RING_STATE_SIZE;
>>>+
>>>+    if (lrc->flags & XE_LRC_FLAG_INDIRECT_CTX)
>>>+        offset -= LRC_INDIRECT_CTX_SIZE;
>>>+
>>>+    return offset;
>>>+}
>>>+
>>>+static inline u32 __xe_lrc_indirect_ctx_offset(struct xe_lrc *lrc)
>>>+{
>>>+    return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_CTX_SIZE;
>>>}
>>>
>>>static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>>>@@ -1065,6 +1083,54 @@ static int setup_wa_bb(struct xe_lrc *lrc, 
>>>struct xe_hw_engine *hwe)
>>>    return 0;
>>>}
>>>
>>>+static int
>>>+setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>>+{
>>>+    static struct bo_setup rcs_funcs[] = {
>>>+    };
>>>+    unsigned int offset, num_funcs, written = 0;
>>>+    struct bo_setup *funcs = NULL;
>>>+    u32 *cmd, *buf = NULL;
>>>+
>>>+    if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
>>>+        return 0;
>>>+
>>>+    if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>>>+        hwe->class == XE_ENGINE_CLASS_COMPUTE) {
>>>+        funcs = rcs_funcs;
>>>+        num_funcs = ARRAY_SIZE(rcs_funcs);
>>>+    }
>>>+
>>>+    if (xe_gt_WARN_ON(lrc->gt, !funcs))
>>>+        return 0;
>>>+
>>>+    offset = __xe_lrc_indirect_ctx_offset(lrc);
>>>+
>>>+    cmd = setup_bo(lrc, hwe, LRC_INDIRECT_CTX_SIZE, 15, offset, funcs,
>>
>>this 15 is directly related to the 64B align below, right? It's not
>>something in addition, but rather the size alignment since the size we
>>give to INDIRECT_CTX is in # of cachelines (and we don't want to execute
>>garbage.
>>
>>Maximum size per bspec 45954 is 63 cachelines: by passing max_size 
>>== LRC_INDIRECT_CTX_SIZE and reserved_dw = 15 dwords,
>>we would write up to 4036 and the alignment below will make the size go
>>up to 64 instead of 63, since max size is then off by 4.
>>Or did I miscalculate?
>>
>>instead of passing a "reserved_dw" why are we not just passing
>>max_size + reserved_dw, why are we not just passing max number of
>>dwords, calculated here? This would also help stop mixing the units.
>
>I am not sure there was a bug with the alignment code (if there was 
>exactly 4036 of content, then align loop wouldn't run, no?), but 

Below it does:

	while ((unsigned long)cmd & 0x3f) {

and `4036 & 0x3f == 4`. So it will align it to 4096 (64 cache lines)
rather than 4032.

>anyway, I also did not know about the bspec 45954. So in the respin I 
>have changed it to separate the BO size from the max indirect context 
>size.
>
>See how you like the latest.

thanks, will take a look

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>
>>>+               num_funcs, &buf, &written);
>>>+    if (IS_ERR(cmd))
>>>+        return PTR_ERR(cmd);
>>>+
>>>+    /* Align to 64B cacheline. */
>>
>>     /*
>>      * Align to 64B cacheline so there's no garbage at the end for
>>      * CS to execute: size for indirect ctx must be a multiple of
>>      * 64.
>>      */
>>
>>Lucas De Marchi
>>
>>>+    while ((unsigned long)cmd & 0x3f) {
>>>+        *cmd++ = MI_NOOP;
>>>+        written++;
>>>+    }
>>>+
>>>+    finish_bo(lrc, offset, written, buf);
>>>+
>>>+    xe_lrc_write_ctx_reg(lrc,
>>>+                 CTX_CS_INDIRECT_CTX,
>>>+                 (xe_bo_ggtt_addr(lrc->bo) + offset) |
>>>+                 /* Size in CLs. */
>>>+                 (written * sizeof(u32) / 64));
>>>+    xe_lrc_write_ctx_reg(lrc,
>>>+                 CTX_CS_INDIRECT_CTX_OFFSET,
>>>+                 CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6);
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>#define PVC_CTX_ASID        (0x2e + 1)
>>>#define PVC_CTX_ACC_CTR_THOLD    (0x2a + 1)
>>>
>>>@@ -1074,7 +1140,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>>>struct xe_hw_engine *hwe,
>>>{
>>>    struct xe_gt *gt = hwe->gt;
>>>    const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>>>-    const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>>>+    u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>>>    struct xe_tile *tile = gt_to_tile(gt);
>>>    struct xe_device *xe = gt_to_xe(gt);
>>>    struct iosys_map map;
>>>@@ -1089,6 +1155,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>>>struct xe_hw_engine *hwe,
>>>    lrc->flags = 0;
>>>    lrc->ring.size = ring_size;
>>>    lrc->ring.tail = 0;
>>>+
>>>+    if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
>>>+        lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
>>>+        bo_size += LRC_INDIRECT_CTX_SIZE;
>>>+    }
>>>+
>>>    if (xe_gt_has_indirect_ring_state(gt))
>>>        lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>>>
>>>@@ -1213,6 +1285,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>>>struct xe_hw_engine *hwe,
>>>    if (err)
>>>        goto err_lrc_finish;
>>>
>>>+    err = setup_indirect_ctx(lrc, hwe);
>>>+    if (err)
>>>+        goto err_lrc_finish;
>>>+
>>>    return 0;
>>>
>>>err_lrc_finish:
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h 
>>>b/drivers/gpu/drm/xe/ xe_lrc_types.h
>>>index 2c7c81079801..e9883706e004 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>>@@ -29,7 +29,8 @@ struct xe_lrc {
>>>    struct xe_gt *gt;
>>>
>>>    /** @flags: LRC flags */
>>>-#define XE_LRC_FLAG_INDIRECT_RING_STATE        0x1
>>>+#define XE_LRC_FLAG_INDIRECT_CTX        0x1
>>>+#define XE_LRC_FLAG_INDIRECT_RING_STATE        0x2
>>>    u32 flags;
>>>
>>>    /** @refcount: ref count of this lrc */
>>>-- 
>>>2.48.0
>>>
>
