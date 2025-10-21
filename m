Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3468CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 20:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6324C10E039;
	Tue, 21 Oct 2025 20:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMGLEdy3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC7E10E039
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 20:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761079834; x=1792615834;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=af+MExJL1Nr29Lt0ZgEZTd9Ra1LQJ5h00cfS/kzUvC8=;
 b=lMGLEdy3pzUHHPqfrdC7YB7uNuVWhLgobzuQboLKEGMuZOrNV8/+6wpx
 CuWnOS0Ykjr77aMsIxpM9gH+mZA8U0zRMFUO/TPNwlczehzr02WHDkRrS
 IzWNCRkiAzTG2ksXY7W/TYmvcMsjT6NEcE528w9uYr4O8eZvqgBXJ4EDs
 A3THLNP30pm8uCFxavxec+O7kT6wEekeJAjCdcnNGzTK06EmcXKEO1iLl
 0+8uxSeAzJyNHzifvnPytT64ScguCih3vreGLvqQvf7GtzMpW4dqOhazc
 xxQef5ozQUjRyp/BbdaMU/ujcrER2gf77OIa4tE1Ee0btFIwRM4ETvXiE g==;
X-CSE-ConnectionGUID: fIUcbxnTS5e9pgZfTIzkrg==
X-CSE-MsgGUID: l7IiGwPrR8KJeSRHqJHlWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63140423"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63140423"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 13:50:33 -0700
X-CSE-ConnectionGUID: Eb+FwteqSYWNC9rlM9uy8A==
X-CSE-MsgGUID: X97bhu61Sn+369r6xaexXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183390320"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 13:50:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 13:50:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 13:50:31 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 13:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETPyhyFpxg39gKv0ILV67vl0qlMI25DV+Bdd9zqC2OEjZ/DVXmTMSyPcKNDq3yAJFGHzyaGpBUvQp39URrmhSZUJc8jdCw7oCGPCBklB7z25IqESfQt734y1Sg/fYZ/aIB8MeBEcKy6yXFMGcAEUxIXA8L5z/AP5h64cgM62SPzk91/LJC3LlX2nTTrgeh7n/CbJ9Nd+IsNMMjB3W9cUbEn8a5MRmRZjo5oB/9y/hkvbFLv38e3gDzt/50r8bGDby4DfsoSIjoBKG+xng3JuvQoiM54Q6wavUg05xg8DcbX+JZWNMwndK85vlWVBxPpTRIEwcpNOBgJpzo4sP+vKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eabXYzHUDbN4R9+Ea2HrlME8UUjwKB+rpVOrGi4lBDU=;
 b=sR5StJRiazwAaW21Xjyboa7J0bPp4YEXjoDFzpXsedsQCuYtzai2xwKlPivAbDHcNuCka3ypjQWfgjSEtEBkbbwwWCMsDHZmBd/ZU/wwblnDg42ZYrxNIjTArypMn+Evf6Lhd29qrhnq97tciVZFR9ZOK6B7IzuvHoYiRXTXv4htvlcDXAebIAK+rk/5aXgRRA/ycHNawa7A21r5C46fVI8Ie8fVrbIR2VcK/c53BjcPB6keCMbk4aHIYQ9NTHj2m3P1LQVFQHQMxKbIOusvI38lWNtLn5UqN4eBSH5jA1xTVjag2MRydtd4d0TbJ0Jz81hHbnksblstdiXgXpPdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Tue, 21 Oct
 2025 20:50:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 20:50:29 +0000
Date: Tue, 21 Oct 2025 13:50:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Santa, 
 Carlos" <carlos.santa@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Avoid serializing unbind jobs on prior TLB
 invalidations
Message-ID: <aPfyEgGRRZXpj7Um@lstrano-desk.jf.intel.com>
References: <20251017165217.493595-1-matthew.brost@intel.com>
 <20251017165217.493595-2-matthew.brost@intel.com>
 <8a2ee0e807fd17057df5c2253b19c623b0c23d3b.camel@intel.com>
 <aPfuxg77e8nwtoHI@lstrano-desk.jf.intel.com>
 <7e2afab209224282ab3a211972364bb5ec1fce44.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e2afab209224282ab3a211972364bb5ec1fce44.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ed4d3a-87a3-4c29-1109-08de10e377f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWg1N21aYTBza0FROC9NZE94UGd0VGdBMXlIU3BqQnp6N01GcVNubk5tYzk5?=
 =?utf-8?B?bDFZUlFDWnJtL1M5MFBlVFZNcDB6cjA3SG5JeU9hTmlpVnkzWGFaaWFkdS9V?=
 =?utf-8?B?dXJMOUkvOE92TXV5eW5GY3pnVGFjNDdWbmN6M3g5bnQyNkxjcXM1Tk9reVV1?=
 =?utf-8?B?cm5tVGxFcU54TlhaVVhnZTlDcXVGYU9VLzNzOFBoaW12N3czaXh1ZFRSaS9Q?=
 =?utf-8?B?TW44cjc2TGk2aEJkMGdiRitrR3VuU3ZnMU9Vd3JwV3JINEVxeFpPT2RCbnZo?=
 =?utf-8?B?WTBZMitOM3JDL0NMVmI2dEducG5Rc3JWRlhzY1ZoRzBsNTcvalZPN0JCQnhs?=
 =?utf-8?B?eFNqRFo2WlhlNUMrTVRKY1VES3dDbTdIeWEwak92d1czNExSakpLSjJSWGVv?=
 =?utf-8?B?dWZETSswL1NkMDRwSnFpbm1YUjZ4TjVMREVxWld6YXp4UVdCSTA0OW8ybEZs?=
 =?utf-8?B?QmN1Q00veStjbTBheHFFSE4xa0p4QVIrMDJQVlFYVzJ6c1dmeUdZUVFSVStW?=
 =?utf-8?B?WU1qOFFqWlBuTHdpZ2lNTS9jZjVNczBiY01pZS95cUl2Ty8yandOcUdJZHVu?=
 =?utf-8?B?cVhrU3hjMHU4WTIvSWd6ZGUwdzdBdVY4SE9NTTd0cm5jYU5UTlZSTnNEYjIx?=
 =?utf-8?B?ZldFR0plbSt4bmtGeGd6N0NUZ0wxVlhKeU5hZWVPY0h6bDdLOFNWY2d2by9L?=
 =?utf-8?B?cmlCdEFrbCtmT01kU2MrRDROM1h3VWdzTmE4OGdDQXR4eXNKVmprZHoxQVJE?=
 =?utf-8?B?QVQ4c1BXM3dpelg2VHhvMmZ5Ky9RYmo3N0lLNmxDa2MrTXh5Uy94OVZqN2lU?=
 =?utf-8?B?OFB2RnpTMFlVeG50SWc1RFFYVDJGa3RRL1phenh3TXZ0VjdTS0tVaVNPYStl?=
 =?utf-8?B?OXk5MTZVK3hzTUx1VXZ0a1NFang3SGdyYkNoS1pkaFVxV3cvajVRWitqQzJT?=
 =?utf-8?B?aWN4a2hxcjFBdTUvRnFzUm1XZnpUYlEySG95NWc4OHMwaEVFbzMrWEhhK2lj?=
 =?utf-8?B?Qy9hR0tBTkUwampFbXJTWFMyclRVQmFUS1VZcGg3VlhuV21lK2czSi83NUE0?=
 =?utf-8?B?cjZBUEVPMElRalY3eDl5YnJYRUZNTzNGZ3lGVURrMTFQeitGNzF0M2o1aFNz?=
 =?utf-8?B?S0lVZjRYUU5WSE5XdDJ3U1BRVkRyeTk3R3B5OSttSkU1cTNtdU9naFAxdmJy?=
 =?utf-8?B?aFpqdG8vQ2ZyQXhmWXVzSG9uQ3BEMUF5R0Z3UEZDMWFBM0tpNm1mcTZyaExK?=
 =?utf-8?B?NXRSQ3pTOEk0Nks2eUdCcWtGNjV2Q1JqOWU1ZkdKM0xDYWUraCtkYjdiR3Fl?=
 =?utf-8?B?eWlKMi9vTHlNRzVRMFIxRHZvTS84K3NkdFVQNUtnZU15MmwrS0tJanpHS0N4?=
 =?utf-8?B?NTlTZ0xNNmI2SjRrc1lFdEZtOCtXZFFTZjJqYzVMakpJSFNLcGl0L0haeitn?=
 =?utf-8?B?Y0NtRXRLSW5GYndKVXFseHY1bVRpQ0pOTW5DQmR0MU83djVYTnlkSW9CeTh5?=
 =?utf-8?B?TVlKaENkUkNyaFlZT3JwcTQ1OGRPQVlxYmEydTJNZ3JVQXhEdC9Zckc1WVZF?=
 =?utf-8?B?UDlIaHVxOTdNNW1UTlY0VkRoS3ppYkJLVjRkdWtNcU5nN1BCbnRoQ2puTU5J?=
 =?utf-8?B?dGtyKzdUSkM5Qzdkd2RtS3Z5cmgxSmtKVHluYUZJYzAzZlo1TGtPaTdJVWxD?=
 =?utf-8?B?S3RuT2tONFBxMUo0NWpERy92ME1JVUFpWVYydGpOcXA1am9LczY2ODIyUEh0?=
 =?utf-8?B?VXZnWjhuRCtPMURoRUQxWjhQWGFzaGhFd2V5a09wYVpoMmVJRnJvMC9WTlNT?=
 =?utf-8?B?WmlzNTljVjZUOTN5NUNoOWtZUXR0UEhoUFloaUhoekc0VVM5QmFNVlRJWkVK?=
 =?utf-8?B?RjJGZXJCUnlKVU9UY1dJeVBZYlpPcitXQ0VaUHFsamJna0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clpVcDFGcVFacSt3YUZocVVXNFZtWHgrVG9kL1ZZQm5KMVE5RXJ1MzBKSFY3?=
 =?utf-8?B?d1RTRm5sZ0YvKzB5VkUwN2xFdEFja2JDNFdBS0E0VzZQK0V4eHg0cWpWcUx5?=
 =?utf-8?B?YWdSM3owNjhMeDAvRjk0QTNBenBOWWFJWlVUZ2o4K1VkbzljZ2lzTUNZLzhH?=
 =?utf-8?B?cXdUV0E0RmdJeHBjRXB0UDlVNG1KcDJwVVJmbWpvNEFTaTNFNkkrWUtRNDRP?=
 =?utf-8?B?UVBpS1lHQVJ0VDVWaGs2STBHZGUyN0VtZEZGei96dlN5cVp3NjBteG9ZSjBO?=
 =?utf-8?B?bGZVeW11Q0ZJMjNMSXlPOGlSaG9VU2tibUhjU2RacVZDQUNTZWxkNTZyN0Ry?=
 =?utf-8?B?ZW9HRXFBb1Y4STgrZm83MTFVSGJpWVgvOW5rRCt4VFlaTGVWNUp3bDdpOVl0?=
 =?utf-8?B?em52NGh6ZXpDZ0h3Z2Z6NlRyZmltMmNRckMzenNORlNtY0RyRVpJUUZhblAy?=
 =?utf-8?B?SkJDbStnMjB5VzNwMHhXT2FZdkV6dGpNdW9KUy9ScUg4OUlaOG1WdzFaQ2tk?=
 =?utf-8?B?OU1wcWh6RnNpdUxNcGtmaGU3b2ZhTFIyMy9XUzVGSnlQb0NFQm5kTTAxNS9O?=
 =?utf-8?B?b3U3VGlHMk5wL2EvRzBOODh4aXQxOEt5eXZzSjhDck1zZ2p2Qjl2c2FjRURa?=
 =?utf-8?B?YnpsOVR6c1c3UDhYRE5uRUdocWVkdFZST3RHTSsveTFVOExuWDI5WjZYS005?=
 =?utf-8?B?TTQzK1RyZS9acUFRdnNMWDY2d2svRlQwNmc2dUp1d24xbTRqVUx0aExDRTZs?=
 =?utf-8?B?Q0gxMDdIZnpSSTlHV0I5ZytaUm5ySE82dGtqT2RhMHNMYVN2dzZCS1ppZyth?=
 =?utf-8?B?bkRLdzZqakVPLzQ0azY4bFhhWjJBUDVtQmZtY0RLQkZhRzVwUFVrVjM4bFVx?=
 =?utf-8?B?R1ZkbGc2eWVUQ1VNSkdIL20zNG8zTERJR1Q2K1VQL2MrTW9WVzlOaXJLTXEx?=
 =?utf-8?B?Y0VPZjl0TTNiaGt1N0dTalB2Mm5hbnBDRGk3anZtdUUvV3pyN05mRVlTWUVw?=
 =?utf-8?B?VlgvazBrTVlWZG8yT0R1ZjlPNnlYS3lhV1ZuWXh1ejlkTSs3MkJ6OVdZSlFu?=
 =?utf-8?B?dXV5anMxRFJXSlRHdUJhRis2Smx3b2FVTVdsTk1WTXMrWC80cEZYK0NqT0VO?=
 =?utf-8?B?WG0rWk9zVEcwSm9TRTRFRGw3NXZ3cWlMaHE4OGJWZzNwMDBBZVR4MitPck5s?=
 =?utf-8?B?WEZlT28vYTBPV3YvSjVTaDZVTXByZFROWStjQmFHakRDcTc5VVB4YkgxMlcr?=
 =?utf-8?B?d0VQN1RxYTV2STg3TU9IbFUzb2c0aEVZaFlaYWppdlFzRmkxMEZYa3BXeFhU?=
 =?utf-8?B?b0tYM1ZtaWZYbUNCZlhUdmVEMXFCeE8yRXMzdHFRU0pJUklZeG5HY0w4OG9n?=
 =?utf-8?B?T1p1VU8rYW1qSmRtSTI0VWxEeW40SWtPWXMxczh5ekNXd00xNG42Nm9JMVBy?=
 =?utf-8?B?aTZOVXRPU3lId2tpSnptbVhZVzhyNWZPU3c0YUJ4QTlDUnhxWHZUb08zOFZK?=
 =?utf-8?B?bys2bWxweFpMdUozZml2NEhxN0loQTNLNTdrMGtQQjRZZDZVK3phbmYrY2xG?=
 =?utf-8?B?N1VWL1dKcWpZZHZka1BGdTlPS29PVkNleGM0MDl3NXU5aGhsUHllamkzd1N5?=
 =?utf-8?B?NkI2bVp4QTNOSlY1WEdTVXBvQm5TK0MxRC9WdDRZeitRT25WSGtKdWxlUk10?=
 =?utf-8?B?QkVsZ3RSYkFaaDdoR2R2K01QR0JhZHBDMkUxb29mVVM1NHc4ZlNYTjcrU1FX?=
 =?utf-8?B?OUtNaVhqOXEyNmgvZElBaDFtbEUxN2kxblR6eWxZMFFXWHVoNnEyRkljSy9N?=
 =?utf-8?B?NHVYdUZldEZSaVQ1WEdFT2QxT3pYQ2hJUE0rd01qeXBlU3pZZ0NKZU82ZG9I?=
 =?utf-8?B?VHVWWEhDblp5SlpnbnJQQUs3RzJLRGhWaU55YnVaaU5tN3JCTTBZOHQ2RG5i?=
 =?utf-8?B?TjlkVmdYcmpFZlhmZEJUWXpaNElEeG5Za0dLcVlyZnhEWDRTZ3VFUHVkSkRU?=
 =?utf-8?B?VHhpcXhlYVlvdXdFTHJtSmIzQXJneGdJVm9kRmthVkV4S2E2eHdoSXFsUStv?=
 =?utf-8?B?ZExTeDRScXlWVWI3YXpwMGdsRTg3VkMwWjRaWnQ0UWhuWHdkbHMxK3hSK0dn?=
 =?utf-8?B?WEFsd1pkZTlwdWNMYnRZbnlmMFBNRGZVeWpueFptNzZ6K1FEUWlzS2JzU3lm?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ed4d3a-87a3-4c29-1109-08de10e377f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 20:50:29.1934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ky59SgO4yTBAmpzjec4acyZ1vOdbOsv8D9Z0B8r5ctKHJ8cPHiO1vBntV4oiEoIrP2g3ecLKsvPUp/3vIlmm3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7556
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

On Tue, Oct 21, 2025 at 02:43:07PM -0600, Summers, Stuart wrote:
> On Tue, 2025-10-21 at 13:36 -0700, Matthew Brost wrote:
> > On Tue, Oct 21, 2025 at 11:55:56AM -0600, Summers, Stuart wrote:
> > > On Fri, 2025-10-17 at 09:52 -0700, Matthew Brost wrote:
> > > > When a burst of unbind jobs is issued, a dependency chain can
> > > > form
> > > > between the TLB invalidation of a previous unbind job and the
> > > > current
> > > > one. This leads to undesirable serialization, causing current
> > > > jobs to
> > > > wait unnecessarily for prior TLB invalidations, execute on the
> > > > GPU
> > > > when
> > > > not needed, and significantly slow down the unbind
> > > > burst—resulting in
> > > > up
> > > > to a 4× slowdown.
> > > > 
> > > > To break this chain, mask the last bind queue dependency if the
> > > > last
> > > > fence's DMA context matches the TLB invalidation context. This
> > > > allows
> > > > full pipelining of unbinds and TLB invalidations while preserving
> > > > correct dma-fence signaling semantics.
> > > > 
> > > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec.c          |  3 +-
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c    | 18 +++++++++--
> > > >  drivers/gpu/drm/xe/xe_exec_queue.h    |  3 +-
> > > >  drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++--
> > > >  drivers/gpu/drm/xe/xe_sched_job.c     | 44
> > > > ++++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/xe/xe_sched_job.h     |  7 ++++-
> > > >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
> > > >  drivers/gpu/drm/xe/xe_tlb_inval_job.h |  2 ++
> > > >  8 files changed, 98 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > > b/drivers/gpu/drm/xe/xe_exec.c
> > > > index 0dc27476832b..6034cfc8be06 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -294,7 +294,8 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > > void
> > > > *data, struct drm_file *file)
> > > >                 goto err_put_job;
> > > >  
> > > >         if (!xe_vm_in_lr_mode(vm)) {
> > > > -               err = xe_sched_job_last_fence_add_dep(job, vm);
> > > > +               err = xe_sched_job_last_fence_add_dep(job, vm,
> > > > NO_MASK_DEP,
> > > > +                                                    
> > > > NO_MASK_DEP);
> > > >                 if (err)
> > > >                         goto err_put_job;
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 90cbc95f8e2e..d6f69d9bccba 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -25,6 +25,7 @@
> > > >  #include "xe_migrate.h"
> > > >  #include "xe_pm.h"
> > > >  #include "xe_ring_ops_types.h"
> > > > +#include "xe_sched_job.h"
> > > >  #include "xe_trace.h"
> > > >  #include "xe_vm.h"
> > > >  #include "xe_pxp.h"
> > > > @@ -1106,11 +1107,17 @@ void xe_exec_queue_last_fence_set(struct
> > > > xe_exec_queue *q, struct xe_vm *vm,
> > > >   * xe_exec_queue_last_fence_test_dep - Test last fence
> > > > dependency of
> > > > queue
> > > >   * @q: The exec queue
> > > >   * @vm: The VM the engine does a bind or exec for
> > > > + * @mask_ctx0: Mask dma-fence context0
> > > > + * @mask_ctx1: Mask dma-fence context1
> > > > + *
> > > > + * Test last fence dependency of queue, skipping masked dma
> > > > fence
> > > > contexts.
> > > >   *
> > > >   * Returns:
> > > > - * -ETIME if there exists an unsignalled last fence dependency,
> > > > zero
> > > > otherwise.
> > > > + * -ETIME if there exists an unsignalled and unmasked last fence
> > > > dependency,
> > > > + * zero otherwise.
> > > >   */
> > > > -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > > > struct xe_vm *vm)
> > > > +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > > > struct xe_vm *vm,
> > > > +                                     u64 mask_ctx0, u64
> > > > mask_ctx1)
> > > >  {
> > > >         struct dma_fence *fence;
> > > >         int err = 0;
> > > > @@ -1119,6 +1126,13 @@ int
> > > > xe_exec_queue_last_fence_test_dep(struct
> > > > xe_exec_queue *q, struct xe_vm *vm)
> > > >         if (fence) {
> > > >                 err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > &fence-
> > > > > flags) ?
> > > >                         0 : -ETIME;
> > > > +
> > > > +               if (err == -ETIME) {
> > > > +                       if (xe_sched_job_mask_dependency(fence,
> > > > mask_ctx0,
> > > > +                                                       
> > > > mask_ctx1))
> > > > +                               err = 0;
> > > > +               }
> > > > +
> > > >                 dma_fence_put(fence);
> > > >         }
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > index a4dfbe858bda..99a35b22a46c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > @@ -85,7 +85,8 @@ struct dma_fence
> > > > *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> > > >  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e,
> > > > struct
> > > > xe_vm *vm,
> > > >                                   struct dma_fence *fence);
> > > >  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > > > -                                     struct xe_vm *vm);
> > > > +                                     struct xe_vm *vm, u64
> > > > mask_ctx0,
> > > > +                                     u64 mask_ctx1);
> > > >  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> > > >  
> > > >  int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q,
> > > > void
> > > > *scratch);
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index d22fd1ccc0ba..bba9ae559f57 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -1341,10 +1341,21 @@ static int xe_pt_vm_dependencies(struct
> > > > xe_sched_job *job,
> > > >         }
> > > >  
> > > >         if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL))
> > > > {
> > > > +               u64 mask_ctx0 = NO_MASK_DEP, mask_ctx1 =
> > > > NO_MASK_DEP;
> > > > +
> > > > +               if (ijob)
> > > > +                       mask_ctx0 =
> > > > xe_tlb_inval_job_fence_context(ijob);
> > > > +               if (mjob)
> > > > +                       mask_ctx1 =
> > > > xe_tlb_inval_job_fence_context(mjob);
> > > 
> > > Can we rename these ictx and mctx for consistency?
> > > 
> > 
> > Yes.
> > 
> > > Also, do we really need both of these here? Shouldn't we always
> > > have
> > > the primary GT inval (ictx) and so just need to check the one? My
> > 
> > The code as written, we'd only need to check primary GT but Matt R
> > eventually wants the driver to be able to boot without the primary
> > GT.
> > There is a bit of work to done to that work but I didn't want to make
> > it
> > worse in this patch.
> 
> Yeah makes sense, was just thinking of how to make this a little
> simplier. I don't really like that we're looking at both contexts here
> when we really just need one of them. But we're also doing this in
> other parts of the driver (like the primary/media GT TLB invals for
> which this is based), so maybe no problem. Just good to at least note
> this, otherwise to me it isn't super clear why we need two contexts
> here at a glance.
> 
> I think at least having those name changes (ictx and mctx) would help
> here.
> 

Yes, will add a comment too.

> > 
> > > understanding is the reason being that we might be adding either
> > > one of
> > > these as the last fence so we need both checks. But in that case
> > > would
> > > it be better to check against all dependencies or even just the
> > > last
> > > two? Wouldn't that also help if multiple apps are trying to free at
> > > once here so we have interleaved unbind dependencies?
> > > 
> > 
> > Depending on how the bind is setup, we may check further dependecies
> > in dma-resv - see all the other checks in this function. This is
> > covering the case for last queue dependecy only which is at least
> > sufficent help with ChromeOS case where this is triggered with a
> > burst
> > of user unbinds.
> > 
> > We might still have an issue with a burst of SVM unbinds where this
> > can
> > serialize though, that would however likely need some DRM scheduler
> > changes though fairly similar to this patch. I can maybe think on
> > that
> > one in a follow up in a later series. Also I probably should switch
> > over
> > SVM unbinds to drain the entire garbage collector list and issue a
> > single unbind job too.
> 
> Makes sense to me, but I'm also fine having that in a follow-up patch.
> 
> > 
> > > > +
> > > >                 if (job)
> > > > -                       err =
> > > > xe_sched_job_last_fence_add_dep(job,
> > > > vm);
> > > > +                       err =
> > > > xe_sched_job_last_fence_add_dep(job,
> > > > vm,
> > > > +                                                            
> > > > mask_ctx0,
> > > > +                                                            
> > > > mask_ctx1);
> > > >                 else
> > > > -                       err =
> > > > xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> > > > +                       err =
> > > > xe_exec_queue_last_fence_test_dep(pt_update_ops->q,
> > > > +                                                               v
> > > > m,
> > > > mask_ctx0,
> > > > +                                                               m
> > > > ask_
> > > > ctx1);
> > > >         }
> > > >  
> > > >         for (i = 0; job && !err && i < vops->num_syncs; i++)
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > > > b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > index d21bf8f26964..7cbdd87904c6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > @@ -6,6 +6,7 @@
> > > >  #include "xe_sched_job.h"
> > > >  
> > > >  #include <uapi/drm/xe_drm.h>
> > > > +#include <linux/dma-fence-array.h>
> > > >  #include <linux/dma-fence-chain.h>
> > > >  #include <linux/slab.h>
> > > >  
> > > > @@ -295,19 +296,60 @@ void xe_sched_job_push(struct xe_sched_job
> > > > *job)
> > > >         xe_sched_job_put(job);
> > > >  }
> > > >  
> > > > +/**
> > > > + * xe_sched_job_mask_dependency() - Determine if a dma-fence
> > > > dependency can be masked
> > > > + * @fence: The dma-fence to check
> > > > + * @mask_ctx0: First context to compare against the fence's
> > > > context
> > > > + * @mask_ctx1: Second context to compare against the fence's
> > > > context
> > > > + *
> > > > + * This function checks whether the context of the given dma-
> > > > fence
> > > > matches
> > > > + * either of the provided mask contexts. If a match is found,
> > > > the
> > > > dependency
> > > > + * represented by the fence can be skipped. If the fence is a
> > > > dma-
> > > > fence-array,
> > > > + * its individual fences are unwound and checked.
> > > > + *
> > > > + * Return: true if the fence can be masked (i.e., skipped),
> > > > false
> > > > otherwise.
> > > > + */
> > > > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64
> > > > mask_ctx0,
> > > > +                                 u64 mask_ctx1)
> > > > +{
> > > > +       if (dma_fence_is_array(fence)) {
> > > > +               struct dma_fence *__fence;
> > > > +               int index;
> > > > +
> > > > +               dma_fence_array_for_each(__fence, index, fence)
> > > > +                       if (__fence->context == mask_ctx0 ||
> > > > +                           __fence->context == mask_ctx1)
> > > > +                               return true;
> > > > +       } else if (fence->context == mask_ctx0 ||
> > > > +                  fence->context == mask_ctx1) {
> > > > +               return true;
> > > > +       }
> > > > +
> > > > +       return false;
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_sched_job_last_fence_add_dep - Add last fence dependency
> > > > to
> > > > job
> > > >   * @job:job to add the last fence dependency to
> > > >   * @vm: virtual memory job belongs to
> > > > + * @mask_ctx0: Mask dma-fence context0
> > > > + * @mask_ctx1: Mask dma-fence context1
> > > > + *
> > > > + * Add last fence dependency to job, skipping masked dma fence
> > > > contexts.
> > > >   *
> > > >   * Returns:
> > > >   * 0 on success, or an error on failing to expand the array.
> > > >   */
> > > > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job,
> > > > struct
> > > > xe_vm *vm)
> > > > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job,
> > > > struct
> > > > xe_vm *vm,
> > > > +                                   u64 mask_ctx0, u64 mask_ctx1)
> > > >  {
> > > >         struct dma_fence *fence;
> > > >  
> > > >         fence = xe_exec_queue_last_fence_get(job->q, vm);
> > > > +       if (xe_sched_job_mask_dependency(fence, mask_ctx0,
> > > > mask_ctx1)) {
> > > > +               dma_fence_put(fence);
> > > > +               return 0;
> > > > +       }
> > > >  
> > > >         return drm_sched_job_add_dependency(&job->drm, fence);
> > > >  }
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h
> > > > b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > index 3dc72c5c1f13..81d8e848e605 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > @@ -58,7 +58,8 @@ bool xe_sched_job_completed(struct xe_sched_job
> > > > *job);
> > > >  void xe_sched_job_arm(struct xe_sched_job *job);
> > > >  void xe_sched_job_push(struct xe_sched_job *job);
> > > >  
> > > > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job,
> > > > struct
> > > > xe_vm *vm);
> > > > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job,
> > > > struct
> > > > xe_vm *vm,
> > > > +                                   u64 mask_ctx0, u64
> > > > mask_ctx1);
> > > >  void xe_sched_job_init_user_fence(struct xe_sched_job *job,
> > > >                                   struct xe_sync_entry *sync);
> > > >  
> > > > @@ -93,4 +94,8 @@ void xe_sched_job_snapshot_print(struct
> > > > xe_sched_job_snapshot *snapshot, struct
> > > >  int xe_sched_job_add_deps(struct xe_sched_job *job, struct
> > > > dma_resv
> > > > *resv,
> > > >                           enum dma_resv_usage usage);
> > > >  
> > > > +#define NO_MASK_DEP    (~0x0ull)
> > > > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64
> > > > mask_ctx0,
> > > > +                                 u64 mask_ctx1);
> > > > +
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > index 492def04a559..f2fe7f9fbb22 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > @@ -32,6 +32,8 @@ struct xe_tlb_inval_job {
> > > >         u64 start;
> > > >         /** @end: End address to invalidate */
> > > >         u64 end;
> > > > +       /** @fence_context: Fence context for job */
> > > > +       u64 fence_context;
> > > >         /** @asid: Address space ID to invalidate */
> > > >         u32 asid;
> > > >         /** @fence_armed: Fence has been armed */
> > > > @@ -101,6 +103,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue
> > > > *q,
> > > > struct xe_tlb_inval *tlb_inval,
> > > >         job->asid = asid;
> > > >         job->fence_armed = false;
> > > >         job->dep.ops = &dep_job_ops;
> > > 
> > > This means the "finished" context per the entity definition right?
> > > Can
> > > you either add a note here or change the job->fence_context name to
> > > reflect that? Or otherwise why is this adding the +1 here?
> > > 
> > 
> > The schedule context is entity->context, the finished context is
> > entity
> > + 1 - this is in DRM scheduler doc. I can add a comment to this for
> > now,
> > and roll a better fix which is DRM scheduler helper to fish out the
> > finished context into this series [1]. DRM scheduler stuff moves slow
> > so
> > that latter may take a minute and didn't want to block a fix on that.
> 
> Can you add some quick documentation there to that effect? Just nice
> not to have to go back and forth to the entity documentation which
> right now is just implied.
> 

Will add a comment.

Matt

> Also thanks for the link to that other series, I'll check that out too.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/155314/
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > +       job->fence_context = entity->fence_context + 1;
> > > >         kref_init(&job->refcount);
> > > >         xe_exec_queue_get(q);   /* Pairs with put in
> > > > xe_tlb_inval_job_destroy */
> > > >  
> > > > @@ -266,3 +269,14 @@ void xe_tlb_inval_job_put(struct
> > > > xe_tlb_inval_job *job)
> > > >         if (!IS_ERR_OR_NULL(job))
> > > >                 kref_put(&job->refcount,
> > > > xe_tlb_inval_job_destroy);
> > > >  }
> > > > +
> > > > +/**
> > > > + * xe_tlb_inval_job_fence_context() - TLB invalidation job fence
> > > > context
> > > > + * @job: TLB invalidation job object
> > > > + *
> > > > + * Return: TLB invalidation job fence context
> > > > + */
> > > > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job)
> > > > +{
> > > > +       return job->fence_context;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > index e63edcb26b50..2576165c2228 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > @@ -30,4 +30,6 @@ void xe_tlb_inval_job_get(struct
> > > > xe_tlb_inval_job
> > > > *job);
> > > >  
> > > >  void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job);
> > > >  
> > > > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job
> > > > *job);
> > > > +
> > > >  #endif
> > > 
> 
