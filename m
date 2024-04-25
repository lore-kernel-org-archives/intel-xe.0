Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE7BC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 16:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DE111A626;
	Thu, 25 Apr 2024 16:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adD4Oxqh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE5C11A625
 for <Intel-Xe@lists.freedesktop.org>; Thu, 25 Apr 2024 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714063431; x=1745599431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=icoL3jnYIK/2AnlZe7JbnULbLZq/5R0fzkI7WCpqQms=;
 b=adD4OxqhIZof+bQC1mQ/sMYhFXOFMV3YDG/vIJrjDmW5iuZli/uEOn/b
 SnzVAdtZaVRXhJYMhGbPtBjMS9DNPlF69joxbK1zm0jfAMFrfJfzxmi7Q
 x167xeV7hqahASNJAsSFDVJqUjVB81ARsyhsc6ToQ5ATD8UT9KI+J8l+S
 yfzB2WDUHR/OG6fcFMoJwYHqfBMLHKUrvEi2U/4uliEKijOfrsfUaAFCq
 einiBCSt81OSUm+wJYGkAhDOoeMG8jIMxKa2DvX2gWzwYiYHf9whcpogk
 PeV6rtiMo7Duh6HACa88kTAYJQF+cX1TXps08fsW7P+2x21eS0+NQNC/R w==;
X-CSE-ConnectionGUID: /f+mMg3oTEyh3SzJ9BWTCg==
X-CSE-MsgGUID: HELpBMLUTUuuVp7wLi3yFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35156114"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="35156114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 09:43:50 -0700
X-CSE-ConnectionGUID: JxH7i4yHTsCkexKRBTBkrQ==
X-CSE-MsgGUID: H2tDKMhHTzG7B6fsoQUpog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25154423"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 09:43:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 09:43:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 09:43:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 09:43:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 09:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAGqrIEm/dorJjkciU4bzJdinIHiRKFot6uOJHw2nql3987v29n1eDrUcJFZqGAx1p82LZmIZlBMPyw2g1SFF1tDLeol3obB7GrlXJftfrx46cR6fXnuh5yoiIxQLiC++vnNLDtVluhDP0ASfI5mj6kT3+1/uEhX/+VpwUVoHNI8a0ZBRJGBxowhbVcaM88fiUJsR8CqG7Ab8m7fkZm7/vdydb66iL/F1ifenvIE7z4rrarSOk4l9amdvTmbNxj0Fq9QaQuFHkSc7mAqpUr55cq0Zd+jfjNyTL4+/IZpNq/2uv94loEWRCRh+aYFmoy53+8tdCS05Dw4EtpmKWLzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icoL3jnYIK/2AnlZe7JbnULbLZq/5R0fzkI7WCpqQms=;
 b=mfMsBvXvSsFgvQ65/UvVap8VMeFhC+kdE7xIYt5gcD6ExQBpDmdlgJ3ngEAue67Erew9XMVyIe9fsoq29u3HwRGUdA6HizFhW5qBk3yYHBBt6tkU6hu8u5xbsVmQFfYKgXeX4/lss0yrlDSgq/LLGYEAYxokYzQf02OCvyDcYsRJJYqsSL9sNNMJa4SqjxKhKSsmsFxIWPJewQAmzEG0ybc1LqAKr7M0ZSTjPW3010WYITKJr5ut1VzsNIXteI7qbF1x3RgHBlS6ZGHapCBgJIpA7AYMQNJH38l2XKESON+kLQJ8i/tUSnzVeIpohJdtQZA9NknVW7tDHl9bT7JWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.22; Thu, 25 Apr 2024 16:43:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 16:43:46 +0000
Date: Thu, 25 Apr 2024 11:43:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Pre-release GuC firmware v70.24.0 for
 LNL/BMG/PVC
Message-ID: <s2mcys2ie7mjge2hvba6thhi6u6g4ctlqvgabvhvqv77qsutxk@ltxqxm64364c>
References: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
 <5rudshnr2uoevsufqntr6s5jxko4au57b62s2pdbdw2hel34mz@vtoxpa2klya7>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5rudshnr2uoevsufqntr6s5jxko4au57b62s2pdbdw2hel34mz@vtoxpa2klya7>
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbf9099-8a31-4d12-c39f-08dc6546dff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZwSjPQBB75tZmAUydN+cNVquel9tLsapuQyBVndO+nadslf9MnXYzFPr9c24?=
 =?us-ascii?Q?C6WPqWPAxWJ0Hsgc0C8IVaq5H4DMZPdqKYD5WNkpe5Iapa+ybFUniL34bQ8n?=
 =?us-ascii?Q?qQKvvCzlAP/sOMgS5Jt1OC63ZMU3cQR/6CWfqmcbyKvTtyG8SunC7UcqtADM?=
 =?us-ascii?Q?YMIr8I/zSsOruF95vJlZvc4vx85K7zRvn2K9sTDdiYTWbvA5sy666It22jSH?=
 =?us-ascii?Q?oSglJuUwsKtlCSiTupPAA7K9A2i+B6MAkR8cShEsZvzA8iOmK9akAu7m7996?=
 =?us-ascii?Q?ZoopMwAHNSwvMhCaXdi6xbQ4Dhy9r4CsysCXnIWurZHDRXqxsVgLaBouCiT9?=
 =?us-ascii?Q?uNFDAFztew/tNjyqozLJzEtatXfN53l2+ubBq653L8JbCUV/8TgEzCW1/9hs?=
 =?us-ascii?Q?LxTEqkkkH5fAyySwIX3r+Q+MsvvYsfZ5uGXfpi0se3A4BzvU2pi3sGuB1MEX?=
 =?us-ascii?Q?Jk2cFH7SwaXv1vf0Do1lXmZ7LkbhUB4l3H1jYdaWhUuDa1YgdNaykiMy/CqY?=
 =?us-ascii?Q?nYIcnkPJ5FQlUZyWQYjPSF8/zUpOK7iHfiPorwePWrFU9ULVKaefaWz3/yD+?=
 =?us-ascii?Q?inPnfHHcItjZY+5RRagn6uo2H6zafORIJTnETlmsT6c07uOyMCh1+EgYRaNT?=
 =?us-ascii?Q?w5Nwc/hqvhDfzakClZRKc9fWAmObXowTIqDRah8wHBieux9tNDKVjpDogVxK?=
 =?us-ascii?Q?P0ZJRo5vVRPM5bhUR5IhisiBKcEC3zg7RtBwh23sEN0O9GcCn/bEZ+O7O1A3?=
 =?us-ascii?Q?pGUCGPszNRHhdnpI1G0xNz5HQ5YPvxjehlKvtJ+66IsaTE4sLkGBYtmObBNt?=
 =?us-ascii?Q?EwXZ3++k4UN7IArmaxYWyn/dUXkMWXyvWXC+PS3zLti1741XkvZjdZ9SSz84?=
 =?us-ascii?Q?OPqZZEF8JLj5tgpGvHeLFp65cS5+UUmG//hPDXr+EzpRJeJqrKWxHDfkf+7s?=
 =?us-ascii?Q?klDI37KanQOCggGBlkVjhy8q8ERzCj3WavIehNLoPE4WcmY6iKS26D5Rf/7g?=
 =?us-ascii?Q?2H21sq/uspKX2VfKm8W8jcFYoTlHwPgtkVHk+qqAfzwU3ZWqSLyhEELYAD9d?=
 =?us-ascii?Q?9dmZo4MHv4aGp0R6nMqfMupSs7JHxHEhN7uDfku6qFZgGGoR85Qb4NS6GVDH?=
 =?us-ascii?Q?xjqQdoOmSuCS5BRecWzP1kz/4meC51HoVWk5IcgrJtYyRjwjBuObTFOH1mzX?=
 =?us-ascii?Q?4OrU2RTsaHedQ6uZMyPYuq/b+/OBvfhm8sPsfgpJtk/RptI9K2pHRBkm3T8d?=
 =?us-ascii?Q?SXTMbO9FoclKAr2fvW0PrUtT+c+xUE5z61KneLmZ+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KuY76RKSUDxh3QtAU/iNhZ7GfAjFjGWjVsbffAfsDxvs8R69hWUEuBvvCYWy?=
 =?us-ascii?Q?01vkhCxPEA6fiRys+bJxs9c12RA3Bjpy3kaYX0ZxZpAOnSxyOKCdLCbudQrj?=
 =?us-ascii?Q?7HnYSIw/Plpx6woqieaCnmgLLSZ8CUbtEiBQgdDc2vXc7E/sgxSefOj7bHc0?=
 =?us-ascii?Q?D7p2P/W6fXEmpIq7SILpB+riGuYd7pbYYIy83DYAoo671m3ibi7LWjTCmv2P?=
 =?us-ascii?Q?jC/4WjOGQcFkdrW/RIHv+gSG4Qzupb/ZzX2m9sqj6lUIFOGkswZop7t5LWJI?=
 =?us-ascii?Q?u7b11SFmm1MCG2tAIyh68o7MHNcpCVMBjEYNIen0RChctuzA49S5mjnpwt3d?=
 =?us-ascii?Q?oydRgrzvxawz+S0uh2OLTtQDJc9wVG9JyP3pHIL66VIVLoVEjko72w7zYHBG?=
 =?us-ascii?Q?WhFyngF6x/ezVQafQWR3GnYtpwcIkfQ7IRTT/youyRvscFKUcn8FRC22QPJJ?=
 =?us-ascii?Q?vrGjh1zP2OXjpkNEoU5mCFCuSTY361PxiThSdgZIlXd8yXJzdXHMUTr9niiY?=
 =?us-ascii?Q?aJitPJ70XkLT8fI4bym40ZJRXAlSx6Ojgrin3pfiw+kX+5IqQ4yop7KcDEQY?=
 =?us-ascii?Q?nCY6dubkbC+WPhYG6ba4+ys+UBDdmQNlSJSzShTijMi9nE92rmcMCOmtOarY?=
 =?us-ascii?Q?MzlIyc8jUy8XbAH5psuTkr2UY77SDeAl77pj1XUNnPZe72sDTyl+iPYGul3d?=
 =?us-ascii?Q?A8Zz4eID2SA+SjgqNpfrtddWtHk/wK0u1LO0sxg14CnG/unLFVhBUB+aAyDj?=
 =?us-ascii?Q?+Is+TDguuRSSwcflMDAjtE51rLSAJjpVHyzucjaQHwwoSDprTwPLpMIoUUkW?=
 =?us-ascii?Q?cWdnDB+4tOe00koPUnF1jISd2hbZFeVDAkZinks+CgM7P+J1N7O1mvuR+snW?=
 =?us-ascii?Q?6F0s2GuYbGMKh24GDwS4aZaKfOxiYRR9j6N0f5wg7IfURYybbsPY7VDpjcUE?=
 =?us-ascii?Q?icKMZFkhzdx/fTv2Tx9hvQCNrjspSCPhRQnJJIIlAPAw+s0jlHr9gY4xIVOk?=
 =?us-ascii?Q?X7LWWovSYG8sz+KkCTnj/GKBwvTpVeTYDvS6ASoeWvTwU0zJzTByKr7dIH5S?=
 =?us-ascii?Q?4dMONzl2kceoLm2T3M0c7Rwtbb0R0dZH0sKbBaPPOXvlfFQiknJd7z7TQmZt?=
 =?us-ascii?Q?YnTjOLFSZkocdlWfRLSIlVz4wX3/dxxLO39y346jTobiLM4pOrC3xYNwI9tA?=
 =?us-ascii?Q?3BNOtFOEsycTYmIVpu518axfFgVZUpj5t0WaumDcGtZtrUEgIttFt/D+pmoz?=
 =?us-ascii?Q?r86X8pPlR5IV7JkDQNACFKscAzFDmYpT8s9PN3Id8h0Xns68ekheaFyatcA5?=
 =?us-ascii?Q?Bll5bnEhotyVP6XGDe/b46LSJsrR8rZ+Xm0rscBSGytmLlaNqAnrnqhWpJXt?=
 =?us-ascii?Q?FMspsglT4algMKjQKRac2QJfOEsI0wHTl6SH+MMi6IUoGWZucm1SqSFnWaRu?=
 =?us-ascii?Q?Ywm11JZxewCdFFel3ZaGwOvQ+U/yxCzQhHbAmTs87oW6K7v3fR0tilAsObyz?=
 =?us-ascii?Q?2cp7qeMfKYrYieZFj+xhuPMiu+sKgwN2sCw4UxRhVpKy/jJNK4Glmy+S3xO4?=
 =?us-ascii?Q?WMcl3d93QBnds9pBu9/M/gkE8+thY5k9C7zsLLYnVJWzm8f14OtLdFh53zpN?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbf9099-8a31-4d12-c39f-08dc6546dff6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 16:43:46.1498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtvhfOeo/7YeBLrM/n7jQSY0mVknQmkrt3zmYyBlVqK2dAsBh8o9G2JZtWxTFOKzR+rgdTls0xLZsE+l8ctpnvY+dRkMVJc10jAtu5jRK8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
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

On Wed, Apr 24, 2024 at 03:49:59PM GMT, Lucas De Marchi wrote:
>On Wed, Apr 24, 2024 at 01:32:54PM GMT, John.C.Harrison@Intel.com wrote:
>>From: John Harrison <John.C.Harrison@Intel.com>
>>
>>Update to the latest (pre-release) GuC version for LNL and PVC. Also
>>add pre-release support for BMG.
>>
>>UAPI version 1.10.2.
>>
>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>I will push this to the topic/xe-for-CI branch once we get passing CI
>results.

pushed to topic/xe-for-CI branch. Thanks.

Lucas De Marchi
