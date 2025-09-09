Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A9CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7601B10E7AF;
	Tue,  9 Sep 2025 16:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Epu1zFpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091210E7AF
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757434556; x=1788970556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fuqGyTCfLwwdD/W1p8HCHpg3pnXiuxCLJaDYDIHEabU=;
 b=Epu1zFpdcD9ewZoB9vLIfnl2xqUtgNMvqgk7JXfSwhT61J2ZP4olqNUf
 o4S2+o/NsoG8Qn7VJxWKPDMlkSp4RBiDuijD1cPmSFJCp5wAA4IiYZa25
 sYKFtWdI+Laq8zp+aChUYYkmGmhAJf1BAwLvXP8Pu30rWOBBtiEKfClyR
 YV8cHXM8iIsXhH9eUGblptiMPNuwxU8QdHm6+zAQn7yoAHMDxxLFcD/Xl
 pc7qpSkI9ma/Ro/aWGyxkEEWzDuVREXfpBrco42/e0R1FP8eXY2u4IYPl
 nCcwCBdKKoU1ESWp6XZFRMBkQHndzbawETkkbXcKKkPHMsKKTKZH3rAjI w==;
X-CSE-ConnectionGUID: pfsKYppZT32BHBrCsEVVcQ==
X-CSE-MsgGUID: HLnZSvZNRReEn44uIU8fGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82316113"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82316113"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:15:56 -0700
X-CSE-ConnectionGUID: NAN5m8lETpSIzkfDSP545A==
X-CSE-MsgGUID: wC77/RQhQx+UZV39ijgzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="178334218"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:15:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 09:15:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 09:15:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 09:15:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qh5FYkiGuSWCU8UQZIyoloEPTG+964Z1+hSjatdl2dAiCGgeEkPkKZxSPdtyyB+FcyV7v2mA9AtfjmiEksO2Lcaxc41g2dUcNjHmG/s+rrgeYDEVg0B7FmjqlDHTnSxa0cFQ/TXposQHnNxcDMpXb/t0/R0rMe1V3v2W0UyuL96PqVjGc8TtPXIKwSXS4QBGIo/ArBTDTmch4dqF4nKNrH/W52NtZhxV1FK7B4CLtU0wmRjlInV/SK0hEJQYIwfOZnnqimFU4uuDMaEKc32snATFTIqovw8DPwqLUs3joTTHJ+t6ycMVMCjgINsTPklq6P1K3WhMTOlWRsljevUG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IjedxhNhevx9uDX/IKN4aVW7ddCok7kPbTHAdIg3XE=;
 b=CgcZMlgHxsEMZs1pQMmsDmXDXIO8bkuwlp6pesO4Ji4KydlNFlMnqbjnExxn5qvzPMG8mmoTpavubzVse/0MAeaiG7jYH4IdhmfKSbEd7pwer89Q3xGp8Rkkzx+gVYPBsCwT27olOT11DAhf/Ge4j5/+VDmyPuf57IhB+MswnKJBn4aRZZspBG+r5KEzNgkDnjhAyY6yTe86NnMUnbaDi+FkjUBXOZkjuLiSCpOXA4PLU99GOyENTgSd/egS/9fcnv72BH4rYwI8k3rvBAs3UhT9fid4RoUKOALgX2ruzkrlrgItZ5u4IWdADKSFsDO6nL/B0Auf6AF7+UmnqtOfYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 16:15:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 16:15:44 +0000
Date: Tue, 9 Sep 2025 09:15:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe3: Correct L3 bank mask readout
Message-ID: <20250909161542.GC150955@mdroper-desk1.amr.corp.intel.com>
References: <20250905215614.796247-3-matthew.d.roper@intel.com>
 <20250905215614.796247-4-matthew.d.roper@intel.com>
 <175742582620.1838.11677776839913024194@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175742582620.1838.11677776839913024194@intel.com>
X-ClientProxiedBy: BYAPR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:a03:100::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 04616c53-90dd-46f4-beaf-08ddefbc20fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jAnxFIR8cDSSpSKhf1hKtdduZGgSFM9QuiUas1swRedBMyB5BlbWVGjuwFhW?=
 =?us-ascii?Q?gIhZeM28SHJIJ2UaYPmP/QpZLaZA3CcAc7BQ4sViiOtRdJ7+65pYZN2XX6/l?=
 =?us-ascii?Q?tpQ8suuZb+yzO4aLV9NSXrGrlGkf4Y4kPyLEyTzDO4JcAJWlP12C0TtSUA2e?=
 =?us-ascii?Q?sX97PyaVL/I/aAKMnD+V+whmqs43lNXJ9lOqguwRUDNDXoghsPEI95eBTHc2?=
 =?us-ascii?Q?ieIUU0ErP0FjYl/Yg72HZYhNBQWMnsjM4gXVOckUuQduIyi5d7oQQgrhzKbd?=
 =?us-ascii?Q?ljR92QL7sEMW10IAbEds/+L3Mf9ceoCeA4py485047wOg5D2NwTUEpPUCRnv?=
 =?us-ascii?Q?/VZ2eCx+tvO+coAOquNzTcLyJPUT3NFk80cd8KeO3rpi7yx+tLSfl9qPtRav?=
 =?us-ascii?Q?sdAmTc30JY6mPhZJF7OCcaEQ6ZGpXciS/CP3mvrqfEs2jZ6xgFAGDdMGFJXK?=
 =?us-ascii?Q?4ZHP0glj4KbREOApFlZ5rvbpP8UssVC0Z5Lwg3t0shUc55XLpt6VbBFpRXQp?=
 =?us-ascii?Q?ti5Qynu8cshXQYQO4VZD63eG279NQQbGN7LowiqN4WRAFkhwlqFLDApyhNhj?=
 =?us-ascii?Q?kkN0rNla/S/xj6Op191B1uz5to/XMfgLLMEfEj/wq6cUv+sD4pCzbpp+pwg+?=
 =?us-ascii?Q?lI4nBop3dxbuHcN6UE9oMJwyAw/kx7P+Ep10fkX+0rQxg8qw06R/9J6h7DuP?=
 =?us-ascii?Q?Ak0o20MtOBQc+zp+h4jGaS3EX98sOkJcu7243HV66FIyVz6wsmHvsyCk/ffW?=
 =?us-ascii?Q?GvQ2rl/u9Bu964OGkFG3gnVC/UBes6L4whxdoziPC0AR21//zR9x64QEs3m1?=
 =?us-ascii?Q?P1Adyh8PjTHlkq/zD96Wza8wpWNRg4jxAzlvPe0n0m75TuijuwEetUkDb5SQ?=
 =?us-ascii?Q?np9iwNuqvXx/uosIoNv6pToydbUu9m2PRMp2zYOpszKSmEHsaE85lSZHjJvV?=
 =?us-ascii?Q?S+YLC1BFIVxP1PqxkORZK8uETxsoTCfhMvZqFu2cwNJ9WPhXbHz+oLeEP3U5?=
 =?us-ascii?Q?FCDV/kT4hT/0NUt6fHm1cCeYUuJ3esRITJZnhfIYn2Bf2muQHksuvn9//b4F?=
 =?us-ascii?Q?cm7HFCRsyRAPgtuJdYJAghvg18A48HZpsZ9P6/0pJKabxVOPvxRVSWJ8s8vs?=
 =?us-ascii?Q?6vTz9htLpk8M5XgBcB5gT7GBX9l6zc7iiFa0PGoP5g2cuofC35TDOnk3uIb7?=
 =?us-ascii?Q?0uTuTU8u6VUTNB/o4dcd0oP0QBgeZYCRXDJC+90SJOsu+JOA+nqPj/v12SBn?=
 =?us-ascii?Q?gGYHi6qi8CLyo1pri3w3cj0AEfUpUE7lrt/ANiolywAdjEia8URW5iZ3woN7?=
 =?us-ascii?Q?9wODoJ8xEQ+DcInt9Q4jC85VdtwCw8MXoZPNNEnEzlON5dU9rEdjpn9rmYE8?=
 =?us-ascii?Q?nJIMcyqSHTL5ZYzJKJUHGo/vrsAdlw49okWfPtkpX8Zm1lRGmg4lP9e00ry3?=
 =?us-ascii?Q?ujFki9NuKIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jeQTnd7VKOn/UaULv1mY1/eBC4CRRCRpHzQbPwxwpUyr2kYUcptSXr+3WBJH?=
 =?us-ascii?Q?bHShO04FMYOYcGhxWqEgkk28F1p6wX86czUFJIpKaBg5KVuvcWR+Bp7C2NOP?=
 =?us-ascii?Q?bWTY5WXbnnCJMYBAsiHBcKKEF6KC+Ydh+rykltjtRFJA5PsBPie6Z2QkVXSX?=
 =?us-ascii?Q?FfBmL765U0cqNhRTnWApDOfpaanAUmosCpEGaYCYldIshwVyXkBg9UcG1iAB?=
 =?us-ascii?Q?qR0r6JfL81YtQlN5McyKjbwN4mC+X8qkoCQbpbK7LKnev9GPtRxWxGx5XWts?=
 =?us-ascii?Q?hBQY9VE0DtXTeF4h5sKLSZn9uAhSwUaqYPGWRR+XYYaKcCwCMFdJ+kyppuJw?=
 =?us-ascii?Q?MGXU8TIhvVN9n7lb/ReXGwkmIil+2MkmFkxY5S/W/74pmugkqUCl13WPT/lN?=
 =?us-ascii?Q?w8Y6UJSn10O/Rf+Mecdq/W9uUT47sOJgEDiby4P+1sEeZCtrndzQe8iS6QrC?=
 =?us-ascii?Q?jcdeluf7lsV5Z67VBurQ/+JVX/MGNKHHcbFpGFFNEbIXJtfVvyrCuIK0v5ev?=
 =?us-ascii?Q?S0jxulABnuLmJXd+KHwsO87BP2y71sEK5DvUb1EVnZ9wDXpwh0NpuzHbVLQZ?=
 =?us-ascii?Q?b5HQIJUO8X5pwG9LNSMMm0fG8ScbNzHVktQCvMxgOujTibHQqY17ctNyxq/2?=
 =?us-ascii?Q?+6Qzalj+clKJg7P/5kkobhKsc0LNQjyEVDQNtqqVUtscawkXqrUobyBzVb7s?=
 =?us-ascii?Q?y5sb3RO0rBoV7P+jslysu+CUmmAjaC+wsslFVesDEkKU9Idzetd5Bgq7y4x7?=
 =?us-ascii?Q?3CqPOADx9yOXaw96JyDXp/8Ohw+2dlcmYROZ16Vs6EDDvn08NVG3kFIlufIX?=
 =?us-ascii?Q?YK22CBemwNLTMkKlFUyDd2wbYm0OQmVCa29Bp27aRpYNqkIrAWFg76PfvCW0?=
 =?us-ascii?Q?ZwqvisSKgM52wG4V+kTN7VSShZLGQ/z6qZR5W8CNQRdRH519STuDk/9NTa0Q?=
 =?us-ascii?Q?4eNfhyKz94cZUhNq1V2CjlxDWK2ckljPn4OHYj+UJPCvfOgJBt+jjrnOq5Eh?=
 =?us-ascii?Q?HavrWSMKkh0zHxjNJHIYZC9K70ZU5B3Tcpb1J6U67xLVYqZlMcm2hyInmD9G?=
 =?us-ascii?Q?vVoxiYPEFC2Wq3yuou51KjU5AjNcyK7D/WRQ4mRGX8xcQDft4kg5cyfi4x3t?=
 =?us-ascii?Q?N6tYu6+b7rEATuEBMCX4+rCD1SEbynkS4Cn65srv48RNQ0b8Rkl25mGCG2Gh?=
 =?us-ascii?Q?rpqVxehEBZ/2Ndrn/iKdGSrXdRg1v2gmxW3uK4P4k0oXfuETp5uiMS3EUlt2?=
 =?us-ascii?Q?qU44OKvdMKimLhuk63ULP0dbEGxCBLgEGDHN+rxMpPqbqK5eyx50WVaKn4MK?=
 =?us-ascii?Q?WwqfGm62dk9WHwbSBQTUPMrU8+hFy6puGTSrNhdNaMeUaRulM/RMm/DlKdFD?=
 =?us-ascii?Q?UKWALsEiTjDwRqUmSbd3mGedtlfKfsqUQGZ2jSmstPf75mEKVSps+1KzkKXn?=
 =?us-ascii?Q?B8usj6ItX3x8wKTLWf288PtT+Jai5FioLEwBuk7RzIae/iT7bR+Ey6qmTpf4?=
 =?us-ascii?Q?E6DKRUwJNiq6itA47dtrJ5e+rEYug813yKRvEzSvkTqgIDAKFqAc+P9SYy+j?=
 =?us-ascii?Q?nfc+F56l3/Qo6RZF1VnU7DbTCSKq/FqhYM8qA/U0K7Y/FjlIv2a9O0SwQ4uP?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04616c53-90dd-46f4-beaf-08ddefbc20fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 16:15:44.4668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwVEJ2cjg/iiVranCtloHkjRmX3BUIroLtspzCvMnUx0YFA39nM7+ocjPs6ULmFc5pEZnqEtcZs6pOKrcg1YSh85Fj6VcbGx4j3QArzvEX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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

On Tue, Sep 09, 2025 at 10:50:26AM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2025-09-05 18:56:16-03:00)
> >Our readout of L3 bank mask on Xe3 had two subtle bugs:
> >
> > - When the bank mask moved from 0x9118[7:4] to 0x9130[31:0], the
> >   semantics changed from being a per-node mask to being a system-wide
> >   mask.  I.e., the value reported by the MIRROR_L3BANK_ENABLE already
> >   represents the banks across to all L3 nodes, so there's no longer any
> >   need to replicate the mask multiple times, and no need to even read
> >   the node mask on these platforms.
> >
> > - Each bit in MIRROR_L3BANK_ENABLE represents a _pair_ of banks on Xe3
> >   rather than a single bank.  This means that we need to duplicate each
> >   bit of the mask we read from the register when determining the real
> >   bank mask.
> 
> Does this mean that we need Bspec 72573 to be updated?

Hmm, possibly.  I was looking at page 73439 which says "This field
indicates which L3 bank-pairs are enabled in the system."  The tagging
on that page indicates that some other future platforms will likely
switch to 1 bit = 1 bank, but that PTL uses 1 bit = 2 banks.  But as you
pointed out the examples on 72573 don't seem to be following this.  I'll
open some bspec tickets and see if we can get the conflicts resolved.
I'll also see if I can track down some more SKUs of PTL for additional
testing and make sure things are truly being handled in a consistent
manner.


Matt


> 
> >
> >For userspace that only counts the number of L3 banks in the mask and
> >doesn't care about the specific bit positions, these two bugs would
> >often cancel each other out in many cases (since a platform with two L3
> >nodes would have the hweight of the bank mask incorrectly doubled by the
> >first bug, but incorrectly halved by the second bug).
> >
> 
> Some Bspec references here would be nice.  Perhaps 73439?
> 
> I also thought about 72573, but the current explanation for the bits for
> L3 banks on that page doesn't seem accurate with what
> MIRROR_L3BANK_ENABLE represents.
> 
> >Fixes: 11a64adcdbcc ("drm/xe/xe3: Generate and store the L3 bank mask")
> >Cc: Francois Dugast <francois.dugast@intel.com>
> >Cc: Fei Yang <fei.yang@intel.com>
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> >---
> > drivers/gpu/drm/xe/xe_gt_topology.c | 11 +++++------
> > 1 file changed, 5 insertions(+), 6 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> >index 4e61c5e39bcb..53bc2bc8cbac 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_topology.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> >@@ -149,14 +149,13 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> >                 return;
> > 
> >         if (GRAPHICS_VER(xe) >= 30) {
> >-                xe_l3_bank_mask_t per_node = {};
> >-                u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> >+                xe_l3_bank_mask_t per_mask_bit = {};
> >                 u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> >-                u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
> > 
> >-                bitmap_from_arr32(per_node, &bank_val, 32);
> >-                gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
> >-                                         meml3_en);
> >+                /* Each bit in the mask register represents a pair of banks */
> >+                bitmap_set_value8(per_mask_bit, 0x3, 0);
> >+                gen_l3_mask_from_pattern(xe, l3_bank_mask, per_mask_bit, 2,
> >+                                         mirror_l3bank_enable);
> >         } else if (GRAPHICS_VER(xe) >= 20) {
> >                 xe_l3_bank_mask_t per_node = {};
> >                 u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> >-- 
> >2.51.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
