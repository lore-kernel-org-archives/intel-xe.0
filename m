Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3CDD73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 18:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDBD10E1B7;
	Thu, 29 Jan 2026 18:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3SlxE69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E067710E1B7
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769709803; x=1801245803;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+mxhQ9tGcUO3TTvn7NPt962nv6Y3lQOMq2kAqRKY+8w=;
 b=G3SlxE69jbpalb1fbPTa5qxoFdeR4y+tX6Msk8y1yr/zGNoc8id0dZJJ
 pqO5Ufud7RAHJvgYzJYoEJcUUYgavDmUUf1BXPXQtuTRUSb7AokNo4Stm
 tTqsFVFe2hd1Wt8u7/VVOHMN7IG/8GZBWCXu1ls0TbisK8kJ7OA8rwzJz
 5ZlwRMRpAqv5qSIU85O58V5Kaq9VGSxsq6erzpuwM8bHDP2F+5s7BxcQo
 /vAqjhjjB5LVT/3CEeVd/+ckl5A+7DLyFi0jnPVKXtqBUX0KbGk84abdi
 xHB2HDQSvj7SOV8tz1A+JlocOfuAQZ48qEAlJvVWzHFeUSAfqLK/YHgoO w==;
X-CSE-ConnectionGUID: GACsV+j5ST+QztYyU9mUYQ==
X-CSE-MsgGUID: xQaHmzjUQ1+ubtavpb3rhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81595204"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="81595204"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:03:22 -0800
X-CSE-ConnectionGUID: qcWAQMS/SRu3hPQjT6imOg==
X-CSE-MsgGUID: Vi3eRV/uR2+j9m4ea1lN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239891172"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:03:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 10:03:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 10:03:21 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 10:03:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBX98U/eL+KfuqNx80OLtXmgueJpIwX3dT2KIulyjqxXQpOY5XhvJ888ISdOI5lc+k5RfddW/034Br+5CmHQCmupyttsSwhlfSf1ICT6SLdHsfj78xiYdHRZoiA/spE5WZ2irrB6OjSzJSQSvm0ZIoie1mgx9OIOO66hDZmhB/YBzcGXTzhVXKGNVM42MHFTryhphRlLGTFsKd7vHbRKrZq5CHrNExTr0NJ7eqlTXsl2wTPMC1fBv8vEaeNfQO2qFov1/y9TXF7WE/pJ9mbKS2qdZqhymvrN7UQ2D8qaQ/2AkwCR6KS5rUueReQFmbHAugYuCGRxRS+KvwQHGdLYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmEUnaNdjJIWcX9At/YbnBJlIZtxIox8yaKQ54cUtZI=;
 b=SaKqSdhZxik/q6LsIajSAQ443MFqCBdEL9ZyEkqqcTDabRRg6JdQABjazP3K6XTpip6t+k9zqyt+FGglbLA0OUYYg29EqTt5hvnKYeIpD6f9/FujxPPaK3TxAlAJVF6wONocTWxJtDmGHGd4Lw+cpU8JCAmlpd02KB56xo1O5PHDIeDNtEfQ7m4uv6yfG/TQfmv6Py7d0btMSLRkbEJ8Mi8JZeK6PtgXVaXTPcPKSqhhOUZYt/iglm/wiDLc7GPMnPLI25G2R47UFrrp3tt7hSZ7E+545TCDl28unbPX4x7MxCGX0yAjA0vhTga04PajX/95jfKxU19s+rVWGRnaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 18:03:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 18:03:19 +0000
Date: Thu, 29 Jan 2026 10:03:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Message-ID: <aXug5LbEvo/EKh3Q@lstrano-desk.jf.intel.com>
References: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
 <20260129125141.523087-5-satyanarayana.k.v.p@intel.com>
 <39c1fd57b78f09761867a469fae16c347d879dcb.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39c1fd57b78f09761867a469fae16c347d879dcb.camel@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 42777541-8aa7-415e-04d1-08de5f60aed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DcLPvmDzCZKnA7FN3ivDCjHE8DJbmCuSrxPOJy6glohVbjh+a+TCyvcam6?=
 =?iso-8859-1?Q?QV70oyLCi6JsdsBGY4kZiZ+OcHChSKxnHQ3rWbMrMlMBGNAxDVw6PPCLJu?=
 =?iso-8859-1?Q?8OLBtlLnb2wPVO3fJrrP5AnuZFKGAQJT5miwzItbtZPNyGCEhOAx8yapwd?=
 =?iso-8859-1?Q?Smq08McyKB4E0SVYXqzbcgOEzahyCKivsPjsx+vSOoeMCReH8EhcKzq6jv?=
 =?iso-8859-1?Q?KPyaOu37QXeTvZzaJANSGzvUI7g9Zm9T+nP5U3SKNSh3Sw3JNOX6sW3JHT?=
 =?iso-8859-1?Q?whi1rkjC/S15gIsjOXGB76sNKEE2zzED7V8XXYDkG2ffkBifZR4ehslxoe?=
 =?iso-8859-1?Q?pb8psN6Qy/MI19QanQcmdmFILGyeZOl4OfytBJFKnQUXOXEn0mXZsKhiEE?=
 =?iso-8859-1?Q?f/kok56f3GLI6jCFlR6f0tDnKrZ9Yp2Zf4GNN8ejkMTvzxz0oDUIBbxe8O?=
 =?iso-8859-1?Q?MToIwNj5aYk034CGBspSohFqwMq9D/UK+4YBlGvUEXO/h6r2sYLN3kqUN0?=
 =?iso-8859-1?Q?SW/rC3AGvqoByWvgAGjV17bC7gcGSLX4dTaDh+G6Jdy5MYGEXzvncFNZ8L?=
 =?iso-8859-1?Q?uxJdNUtgSVEsWdjxuy++1S7Hn6EECf069KCCj6LZ1qNsC4vDEaGfIoYWj4?=
 =?iso-8859-1?Q?6dJ4n5Kzz9DvdLBLPztSahLdqVnxVZOpK3Fz1clQCOYWnWS7iq4vBSnpnJ?=
 =?iso-8859-1?Q?fK83AEQNi9wTj8YQtLTzYqyw+NP2THeRlto/5GelX5YdepYXF8BDgpAwLY?=
 =?iso-8859-1?Q?XkY0hMtE/whKQX/HOKox55h02dCQYthmjyWLRWeRczJNBJqkbivDOiCd75?=
 =?iso-8859-1?Q?J4xCirnrEwaPkSdU1WnYBxlwyZcuIbnjj5giYkJHq5Sckh9BJimGdAJD+s?=
 =?iso-8859-1?Q?y0nEC2GP+PMcjgmX+BWLGOo4gn9C0ObENK/fVxyHRse2WEXOqNvTVdojz2?=
 =?iso-8859-1?Q?YHryoL6SaL7Dk54emrazGVIvDLM1aKKTlXAoTuRa8BbCVv+5Q7QHDrtOpc?=
 =?iso-8859-1?Q?YXf9FtQKcelv2DeJc8YaX45sraM7R4qLiDx4Fn6+L9Ax2bfceM0lcj3ZYZ?=
 =?iso-8859-1?Q?LdjsWD54iCQ1txqyNeEWhTtzn17BxPKxVBRHSLB7B3vAQcKaX8ykPN3an5?=
 =?iso-8859-1?Q?tUOHt0BM6XKLfuZNVVEXp7IepXdBfSwnPm//c+qf99JDP5bHA7l6Lz6Rjp?=
 =?iso-8859-1?Q?P0WwoSMOLexiqzlOp/5IBKPnVuByaKQ03YQBkifKMlciQsLcBzsT0VuLog?=
 =?iso-8859-1?Q?z9FLTMUmAPqwvmioPDfvJDnmhdRl4Haq1U8lv3ZYpS+RTZauNp/eqPTDXz?=
 =?iso-8859-1?Q?s+S7IZTCZyWdt34hly7htRiI+GkPLjVKqbWUbaTWQrb1dxjpQMariaC87W?=
 =?iso-8859-1?Q?4gT4aIh8BJGJMm9cKw57LSCp9yu0mCx03cw8xBBvzC7aIfmIOU9wMiN531?=
 =?iso-8859-1?Q?lRa/Ag/r0Q4ot5jPZqi689/9ceGGMoc6P/zbLA4ZSAEZ6UiMBjA9cwVsKg?=
 =?iso-8859-1?Q?3cYb432i9IJDBV64/8QUFK5MtHB0v5KN+vkdlI/zlm0/+p896/6PcJGP3r?=
 =?iso-8859-1?Q?gP4SLMQW/FIzqgcJBAjFtMQRzOA3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SOIfXuHFrJXgt1IhGQ312TajDLiFBf0wKnSBUR1RoQ4C1GTYOirCi2rQic?=
 =?iso-8859-1?Q?Ew/l611OIQeQnHy8VHnAbIR+LggrLAmhucgy3zYepiLfMc+FQt3z3RIW+O?=
 =?iso-8859-1?Q?E7jSL28jO6nM/A3zBDANPIwR422UcI21opDDFTrU+hi8rTylkDWvk72LpM?=
 =?iso-8859-1?Q?I2WIYKmzoCCOyPEDiHd4enm4LQN0IG9PomubJPP2/HQleySB7LTd6NthrN?=
 =?iso-8859-1?Q?+OK9ke6+emTgBD3kGozTJosuSve1WNp1fKwuiokc0c7WeHT0biJNC+6b9i?=
 =?iso-8859-1?Q?M8HDpco6QLLQTB5IOoQOXDWD7kgiXf2Nhzt4TbozPCsOfHpgEPnrMPVBkH?=
 =?iso-8859-1?Q?oDX9JzDU/327nUmVsFKc9FJw3SAihbqPB2zaAx2OMIJQkjLz0Yzhj2s5ue?=
 =?iso-8859-1?Q?9BNzUQLSSfUdHxuREHeWSErvTuV4D+LhC/a5c44wrcH/QQtHM8PAulQDCJ?=
 =?iso-8859-1?Q?Mxj1FQWKkFRNPcc4KBJiE+fRsAD7E/DyWWzrXWpaLZH3O3PEhIIgd8XhbB?=
 =?iso-8859-1?Q?O2PgVWf8fCWNsCOatNAKF+O6yGLu8SQ2zQHfzmSiEaEoezUXo/l6YdPcMB?=
 =?iso-8859-1?Q?uvBxs3Ykcpr+A5Q1gur00Gli5neQDPZxQuB6ObqYJYSqD3K5HFqpmBp1/c?=
 =?iso-8859-1?Q?oTGrVfX3DAnzHFYJpQTkxNYcRLoRbzhgkSuxS3D7jh0jBkrkHezh4uB1rh?=
 =?iso-8859-1?Q?dbiCtf6pP47qdemnOLmEeuS2sJrUGm6EZgwCs9FkYufV8Ie6uW0czJtGaT?=
 =?iso-8859-1?Q?B98lnpuVkE7buQZYrEmKCQ522GjEFzJT9yyf22wAW8ALqxao6aH0nOhBh5?=
 =?iso-8859-1?Q?fEDGUWvHiUT4IZNiHvSvOi85OVaeBg5wYjmcsSJfNd1Zr1o36JuOjblIM9?=
 =?iso-8859-1?Q?oO3NMw8r8qOVS1yeKCUo9yM6vCWl+bAWqZBVt9b+CWXgIw+vjqUxtwrsz+?=
 =?iso-8859-1?Q?9gb6v+fjEHLYfi7EYDnKi6SFYrNzMBheDWM09722SkUqwxptyi96T+W8mQ?=
 =?iso-8859-1?Q?jao289lKlpaRHSuYWeeFvKPRxFOEOlGoIwThSpl90yVRuFnLS76zDPGGov?=
 =?iso-8859-1?Q?T9RLAZM722e5+uuoHH2qHUxX7IruyyHLQVQ3fw2qIXaij+8OWU5c6rW1c1?=
 =?iso-8859-1?Q?jeF6rVemLTh/esNYOr/7FQ0cmUoz9N1M3LyDFWqD45KWP3hxfU9Tn1Of2w?=
 =?iso-8859-1?Q?rYfXpRjGYF3gpx6OpoAZ8oJcwVmVHw+xqjXnV0FQUyJ27MfC8IlhwB+D4M?=
 =?iso-8859-1?Q?hVCTLQ6Lc18LvAbG6mhHs/JJwXXgQO05JwOpdpv6tM5whYfLcPpSF5IqCF?=
 =?iso-8859-1?Q?OmOGhF4WVGXgnjNAAEZs4cuSlkoFe5BpqOwmHdvEgOnczePPTwAXb8euel?=
 =?iso-8859-1?Q?GiKORfXCFCx93tiMel6cSEynuZHXuYktQdbqXjumiKGDOYAz3emIlxuqkr?=
 =?iso-8859-1?Q?Z51fkB3KT78ayWPNT2bUTUhUL0ZPiltc+x/SXLS2M9884rJR1FSWPQ2H8m?=
 =?iso-8859-1?Q?SaBI/Jw6S1LlvzGpH9GTm9/GgxRP5b6VYxgnmaoGAEBiPfcPrGsvQkraEL?=
 =?iso-8859-1?Q?H/MHdcbni9sLTBQVOmQt8D9yyA5k26JHZYq++Y4ZFO2urhLRm/PFFGX/r0?=
 =?iso-8859-1?Q?mvPl9lZB2ltkdRhR3d7vmgmzz8G7jocCc3tprBOqLigWqbODLpf0bvSK08?=
 =?iso-8859-1?Q?EkN08sey6fI0GvvXWASu/fAfv/Yp7oh0+TCd4PwsQo3WjcJ8V3tUvRtNTR?=
 =?iso-8859-1?Q?HkGVJaySEeuA8DwfLs2P9Zwru+oQvFKvUDt9OX9Dc2FKyjDGy2GnwJlyua?=
 =?iso-8859-1?Q?ATT5+MqC7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42777541-8aa7-415e-04d1-08de5f60aed5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 18:03:18.9127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxIDhM86qYucykiAUsssD9vOvABV0YHIm7+xug/4kaH/D1wSAxMX8vgepzx3iNHos5mGHi4ho0zNWIhT9t/5BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
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

On Thu, Jan 29, 2026 at 04:39:37PM +0100, Thomas Hellström wrote:
> Hi.
> 
> On Thu, 2026-01-29 at 12:51 +0000, Satyanarayana K V P wrote:
> > CCS save/restore batch buffers are attached during BO allocation and
> > detached during BO teardown. The shrinker triggers xe_bo_move(),
> > which is
> > used for both allocation and deletion paths.
> > 
> > When BO allocation and shrinking occur concurrently, a circular
> > locking
> > dependency involving fs_reclaim and swap_guard can occur, leading to
> > a
> > deadlock such as:
> > 
> > ======================================================
> > WARNING: possible circular locking dependency detected
> > ------------------------------------------------------
> > 
> >       CPU0                    CPU1
> >       ----                    ----
> >  lock(fs_reclaim);
> >                               lock(&sa_manager->swap_guard);
> >                               lock(fs_reclaim);
> >  lock(&sa_manager->swap_guard);
> > 
> >  *** DEADLOCK ***
> > =====================================================
> > 
> > To avoid this, allocate CCS save/restore BB BOs using GFP_ATOMIC,
> > preventing reclaim from being invoked in this context.
> > 
> > Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands
> > with BO")
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> 
> If shrinking and allocation is indeed happening concurrently, then
> GFP_ATOMIC is highly likely to fail. In fact it shouldn't be used if we
> can't gracefully recover from a failure or if the failure doesn't
> matter at all, like in debugging cases where we can lose data.
> 

This is a good point. We might need to rethink this one. Would
GFP_NOWAIT be better here? Also as you have hit on - only the allocation
path can fail which is handled gracefully (i.e., the shrinker path
doesn't rely on allocations).

> I'm trying to wrap my head around the sa manager shadow approach and it
> seems to me like external code putting the sa manager in a particular
> state and the internal lock is accessed from outside the sa code with
> no clearly defined locking rules / asserts? IMO it's a very odd and
> fragile construct, in particular when used with guard() where it's
> unclear exactly what scope is needing locking.

The lock protects:

 - xe_sa_bo_swap_shadow through xe_sa_bo_sync_shadow, so this includes
   xe_bb_ccs_new as it picks the correct SA based on shadow state.

> 
> I'm trying to find some documentation to explain why this is used and
> the only thing I can find is 
> 
> "Directly clearing the BB lacks atomicity and can lead to undefined
> behavior if the vCPU is halted mid-operation...."

This could be improved.

> 
> But what if the vCPU is halted during xe_sa_bo_sync_shadow()? What is
> exactly is the atomicity in this case? 
> 

The vCPU is updating the shadow buffer which isn't programmed on the GPU
so if it interrupted mid-instruction writing, the GPU doesn't hang on a
partially written instruction.

Some back ground, I had suggested a AVX based solution to write out /
clear instructions solution [1] but it was rejected in favor of a shadow
buffer solution which appears to have lockdep issues.

Any ideas here would be helpful.

Matt

[1] https://patchwork.freedesktop.org/series/156482/

> Thanks,
> Thomas
> 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_bb.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > index 8b678297aaa2..355365625df9 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.c
> > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > @@ -62,7 +62,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> > dwords, bool usm)
> >  struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> >  			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> >  {
> > -	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_ATOMIC);
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	struct xe_sa_manager *bb_pool;
> >  	int err;
> > @@ -78,7 +78,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32
> > dwords,
> >  	 */
> >  
> >  	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> > -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> > +	bb->bo = __xe_sa_bo_new(bb_pool, 4 * (dwords + 1),
> > GFP_ATOMIC);
> >  
> >  	if (IS_ERR(bb->bo)) {
> >  		err = PTR_ERR(bb->bo);
