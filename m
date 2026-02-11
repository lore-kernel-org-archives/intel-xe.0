Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F039ECD6C1
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 16:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4D510E628;
	Wed, 11 Feb 2026 16:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqQB461X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C0010E632
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770826645; x=1802362645;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yHYRfo9yGzQlEF1NEsoZTsW8edPbXxvwEFSq+TMU5IA=;
 b=IqQB461XZzuQSqBSuugNj41YSBekAOvx2lUe4e1vqjbiKFNJ5FRLE8fN
 jyc3YngKqKnZlkJLWNSzL8Kb6Qtb5hA2P7H2WVzSOXzWxCOuP81WVcw5c
 r7+L5c2r8hWivuMyvrXdabZ07TEk31mxkMCc5bU1KvO0GjAEu6KBPNxe3
 /a1b46l8JQ5/kVIWnYf+7NyFQ8Pk0/66r7G2pfmzB48C29HnTt7ozCMxv
 1bUUzizMMJsLu1WXiCcXb0DGokj3NW7enurJ8ZMQ1rWLgRFYqVYX3rktS
 ZfZktojTVnF4N+LBlhYGceRhfw3EnVhIi1j0AtYp0qom0ztadEF96NeHj A==;
X-CSE-ConnectionGUID: GS+PQ1oISJKpWw/YjHjPlw==
X-CSE-MsgGUID: sQh5FgAcQ4ChgX+B9FCqkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71967414"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71967414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:17:24 -0800
X-CSE-ConnectionGUID: FHblSVWYTRmoOIAGfVU3pw==
X-CSE-MsgGUID: V2Ze/WIERvOKX+bYwbgdiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="235282321"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:17:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 08:17:23 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 08:17:23 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 08:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9dg83S2Bi8V6aRV39sRw9JwzIaoSEssz/ms583+sFY5x2GJcLK/m1BieU7a3QjyvShh4TFCNuptaCPCIMok/uRE0eLhg0BQX4bCelLcejDlGmFMI+myg80Z45GgZXyA+PQNMood7Pe1pj6l1sXwlNjh9tR/1FOQvIwpu4wrwNGLL+JMLssFxMWcRcYonBrpY6j/dnvvpFJB2j6F8KwLLe9WyltZVY1sZUOd/AV+Sx9sQmSIHpzZZ7TI4elV+VTi9nItlCBQInhZpbTd72XI7+w5VcidOdqos1F9HkAsKroF8uJwD22Xlg6lWLmHpEnrBoKdvjf6B3poCT1ZoTse7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPVoFAWl9pId5KQ8+sN62ocjnTW080EbyrDm0KsG5cE=;
 b=Hw0YcoX20n1rO2n5fQnlm/TivssntUDNkhMN9ZEwTrcCIwV9gmE223WfUelgaKGbMzkMlQ1782zmVSgGFiqfjz+qurVWdYhFC3cK/GYPbQx6N6IwledGi+Vp4VOBSG9mtlhR4vmjyVCrx+6V4021c245rieRjL2ESLa5a1F3VJvUoCv0JlWProkddVOEpXrXpJIT1zAeyCgtigci7cvmhr+HWni1RDkLMmZz1/ZljmKJjBsRK5WuM6GZKxa+/inD1STiKhSAwOZ561n7L1xuO59YmpH8G+/Ubk2hLcxs5jvjvnLQPiIMx8K2H6DpVe7H1fNp+fqvqkpyM8PQubDpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 16:17:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 16:17:16 +0000
Date: Wed, 11 Feb 2026 08:17:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v5 5/9] drm/xe/vm: Prevent binding of purged buffer objects
Message-ID: <aYyriSl/d6IRDbr5@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-6-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211152644.1661165-6-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0132.namprd04.prod.outlook.com
 (2603:10b6:303:84::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e30ad0d-ae0e-45f5-4361-08de698905a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MeuF/YJkvT6ROrJZrqB6kE9VzIb2gczdAuOvOSCHeut8qooVjylhohViib?=
 =?iso-8859-1?Q?dwpIqFp2VuheMbzLJg3+SMDwgRZr4pCvx/OGHeQlKsEm18YwiHPXCXFU0g?=
 =?iso-8859-1?Q?pVsn/kk7XkEfVjWndlF2W1UOzSvr9l2h54JlC1zQyS0u9keQ/VR7fzp1Yn?=
 =?iso-8859-1?Q?T/sx523pnL3dNVnKGYY7Te7caEYWovFkjqzp2Pr62Tnd4CPEBKEIQY38FY?=
 =?iso-8859-1?Q?AyF2dUpoPdy8qfi/Qh+NSbwH8OQF765l3mRA5hymKwoOMS+o+6MuwxydW+?=
 =?iso-8859-1?Q?MLDF/3ExaoiaLygcsZRfjGSufizl5glHmdbAvbFqSHeb3F1ZLYDoV4VFEH?=
 =?iso-8859-1?Q?ohstyEcuRnjxeGKzcVgqMNjZjxE6PVAnuxy1URzZohqEteww6zYTSzcdVp?=
 =?iso-8859-1?Q?q6XDAreXAguf0unZDCw1hPFI7caCwj+WmB8FTgQY0bD64RccXvJnhBVkCJ?=
 =?iso-8859-1?Q?RjPuWovrx69fVim8UgFjFRebWiVGaPJ4eqdA/XnJXckPdDzPOaVCgl/XgC?=
 =?iso-8859-1?Q?UhplV7tDsG+D4AvG48rUznTJ9XZ9Yvw/3qIWw5w6MGwZTfqgncVR4bYWkj?=
 =?iso-8859-1?Q?MT8PJDC0GqlMcY1QnAXsWMoDdllkZ3d30vlOZaj3aRqXoCbQ5sWTFM2+LQ?=
 =?iso-8859-1?Q?mln9vLG0nNoQf1ooP5hK9U2et7/hdTXlazo+idF5q2s4+65tbC+3sDvemk?=
 =?iso-8859-1?Q?HIPjwuh/r8sW1FcIHpzg8RVLvzUBC++ro4qMe7ZDpyrVojV3SxgZXMgEuk?=
 =?iso-8859-1?Q?tkgkIOHTytuXAOS4ldI9QLdNh+0FH9O4oLxVbsii6+gm5RfiLL81el0YqJ?=
 =?iso-8859-1?Q?JnSE2969UIaWVCOY6AOUuTWs9cCShIoQP2I14m6aBZTHvQPiZpIGfVedrA?=
 =?iso-8859-1?Q?i8sAke7/XpWSEUiPv/L+pJbksd+SG+4iVgqsu4DhsVRCNU0TJU1FK5Yq2U?=
 =?iso-8859-1?Q?KVYA5cH5950UMtRHjwO61VSM/yXWv7tNA2sfEZoNz3RNexFUB/ZfqYAOiD?=
 =?iso-8859-1?Q?yc5NBMhXJodTclEOSjSG+uxA/uzN1pkgOihtmAG/TtVxZfzQW7Y52lO0x9?=
 =?iso-8859-1?Q?3id39aEVr7Xe8xrNb7SVxR+1374l1GY2E6kGXnwvamQ86+uNmx2G3+Xpcp?=
 =?iso-8859-1?Q?I2QaHhWXe8BUqdtdcnqBZ+9vYBdieDGPhBn8+DfpuqnUBIVF26VAfK2/fw?=
 =?iso-8859-1?Q?b16VVT7PcRZCXV8icN7nALhH+B8WmmOrT3jWTP2YKjtCZ3fW7KOVNs6dyo?=
 =?iso-8859-1?Q?EPE+Zy/ue9vaX8fldtfAUpCPIFpNmnQ7B5s5mzLUr4gjY4lXYdANPsnOGs?=
 =?iso-8859-1?Q?KhxKUQKx9VgcDIQB2azAaYs9v1r1z77oAoX2SMWBGFbZcIRDGA1XSZ/uYG?=
 =?iso-8859-1?Q?Ff9o6zf3qfr40Z5aRVw5NSUlOppJvS10PoNeaAGEqg5m/yB74Y+2P9FSwj?=
 =?iso-8859-1?Q?ziDvL4mlADvd0qQ2Lbn71ZlEBKkb+WHwa/LncI2lD8l51nbEcXQFaqTBhQ?=
 =?iso-8859-1?Q?rOuvwrEoqcsSL8wnkgKfeZ8Y9WjonnNLwafCzvrbQD1UwgnpcJK/8TU+Eq?=
 =?iso-8859-1?Q?Jlz2Asci+iFGi4fhHedoj/C6zNrN3LNeIXnh05OEn3vKlKIc9BndAuRlfU?=
 =?iso-8859-1?Q?V5F3oCl8vaGpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7WKA48a3KDpuNr/RFe/rBmNTOeAu+8L8yYdQ5FqxHBXYvGC8mevpS9jvnW?=
 =?iso-8859-1?Q?ILXhTsz0beJbAcJtdwMsmOChCAyJEUl4W4lKkjckCNSHdYVfGSzcD4JwaN?=
 =?iso-8859-1?Q?5yzWP2dbOacyd4viAYY5XcjuPkUp1xmmlV1KEoPY6Pzl4dlxdbcjqxQ434?=
 =?iso-8859-1?Q?0B/71YCQi/DW6IElufUTmz9ZeQ6Njd1oLkyJ05R1EKikN+fQyElGehVrCW?=
 =?iso-8859-1?Q?tS29C6LUKm8WW/yk7OolE5qbAQf3NZuFBHBWiZcdZwFFkV2uSUaZ41swUc?=
 =?iso-8859-1?Q?o+T4WQtZJgZ+RUuBUIV3bPbK+5anySDK+KCjaNY0POyHVv0lQpLmmpw6hx?=
 =?iso-8859-1?Q?/t4lUfnpyqiIo61SYrRMZFuMoZkRFOwcf/faPbqg2DoC5CZDb4dibwmtX/?=
 =?iso-8859-1?Q?WEXUWGBpSuoBmjGFrmbHrk7Xav/O1mJty8lg4kMkJPc3/Xu5IFT1XVpm6x?=
 =?iso-8859-1?Q?J/RPb4ip9LUM7s2ylcsP6a4usFFY1+/KHotljlgbhwSydHVbPjwLHhb9wS?=
 =?iso-8859-1?Q?4PLQYoVqpfvddEUN1WNNIuukoRTD6Bzj7n/JEJdAINZXPbBsQxdzBZ5JVO?=
 =?iso-8859-1?Q?F4hP0Rx4DdhaEFqetZo4GpmKvR6trtrRYJ4Es6TrDQQR3SnU5ehp2gAHIq?=
 =?iso-8859-1?Q?nDi/gEIAtRZ58kWuskHoZAwrFPrIlhguHI5tWUadFfU+/Ixo7559p9J3c5?=
 =?iso-8859-1?Q?OcyaI5jx25iXgEMN96e1nHsTebku2c1PcPDOMhIJDcyyTAUn6II6urFaxO?=
 =?iso-8859-1?Q?0AzBc11/Ccrx7L25cRCszJHPoxyRvmXjrlkBy4vqaxdOdSAwyUi21lelM4?=
 =?iso-8859-1?Q?xDnw4pSNwitk1yd1ROVySARCnWRzfXrMRCMMYMrXoHRFmaxVG/r75Y763A?=
 =?iso-8859-1?Q?lFtshIbMtZlmScOG2HShwwnozd0hAwz0ThMBS3jSslzcr/LOSdxrBrvEl0?=
 =?iso-8859-1?Q?vuA+vOyIJqDQqS8LYugF6JWGvtY1SRajqXV8B8eACngAoGjsJpsVP+1Fej?=
 =?iso-8859-1?Q?47rWCmPJDLvdgCTH3SSJgxNXxeD+coKQVGJ97R8dKjgC4ZHrYJdgY0HEXl?=
 =?iso-8859-1?Q?kr6wR/vWkK/q1jvPMxWFC/7jGrFotropHYyrm0AWUrwCTp4aO08Snbo8pP?=
 =?iso-8859-1?Q?7BGlBTq0oh8hoJffEkY5Mf/C9NAnJqTPd9HAI10sKEnJHJf8WeXQHYuJA9?=
 =?iso-8859-1?Q?I+t0uGnf1wZFO8SG9Iw8l4puFWattjuaquftNSm7gHqT7+sFyGHUSjv1/j?=
 =?iso-8859-1?Q?LDdaFczOva0u4MxoxI2uboU7x22lhu9tKWs/kLTm06G0LAg5PKgEdBUKNG?=
 =?iso-8859-1?Q?iFoMJjs7fvc1pRquRjUVzP6jLh+yoanxFlyH38TIcuxye9yy8241OmC8vj?=
 =?iso-8859-1?Q?K+ZXHSAnsKfxtx5OCMO12ATwbK1Y87d50nrRnGO+iQW+F/y4GhFuGEUsH5?=
 =?iso-8859-1?Q?05hyMuznmIFqupOHbMMCi//wP+TUGxwMsMMpYtFsI7SG2ll8+5BI/qWEt5?=
 =?iso-8859-1?Q?be0J06aDwt5fKv87EoRLphiLn2soix47Hr80Nm/dT5MQgcYGyHMLvOF9FT?=
 =?iso-8859-1?Q?wqiS7Qm7tNBd8sd8Cb898bx0BBJvAzRFw+rfOWqcug1iDZOgMCjaoAkkMP?=
 =?iso-8859-1?Q?Y4DpQHVR1gz6KN9JSRUtNSBm5yCleldGN3u4vm6R7eNs1P0sIeomkFtcSE?=
 =?iso-8859-1?Q?xCodLmd/8ZL4a4l3bFoHT1VuwyFQdPpmU2QOWyOMV26uKV/aqLreRypKvA?=
 =?iso-8859-1?Q?YRdqKDtR+HPAm1tFitTay27BPFWunQFGlkXwySfX78AWKXdvvh1jF/WqqP?=
 =?iso-8859-1?Q?iHsKNKufHe9OQPMoEpI6qyo6OYCh8qA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e30ad0d-ae0e-45f5-4361-08de698905a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 16:17:16.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgNS/fMyVcWwu9N7v90JrdZMtyglEgAiwBenM+2X8673Hn3NjVOwyvsnfsPBB7FiJ41IXAXr6vXDHNq/NoluAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8289
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

On Wed, Feb 11, 2026 at 08:56:34PM +0530, Arvind Yadav wrote:
> Add purge checking to vma_lock_and_validate() to block new mapping
> operations on purged BOs while allowing cleanup operations to proceed.
> 
> Purged BOs have their backing pages freed by the kernel. New
> mapping operations (MAP, PREFETCH, REMAP) must be rejected with
> -EINVAL to prevent GPU access to invalid memory. Cleanup
> operations (UNMAP) must be allowed so applications can release
> resources after detecting purge via the retained field.
> 
> REMAP operations require mixed handling - reject new prev/next
> VMAs if the BO is purged, but allow the unmap portion to proceed
> for cleanup.
> 
> The check_purged flag in struct xe_vma_lock_and_validate_flags
> distinguishes between these cases: true for new mappings (must reject),
> false for cleanup (allow).
> 
> v2:
>   - Clarify that purged BOs are permanently invalid (i915 semantics)
>   - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs
> 
> v3:
>   - Move xe_bo_is_purged check under vma_lock_and_validate (Matt)
>   - Add check_purged parameter to distinguish new mappings from cleanup
>   - Allow UNMAP operations to prevent resource leaks
>   - Handle REMAP operation's dual nature (cleanup + new mappings)
> 
> v5:
>   - Replace three boolean parameters with struct xe_vma_lock_and_validate_flags
>     to improve readability and prevent argument transposition (Matt)
>   - Use u32 bitfields instead of bool members to match xe_bo_shrink_flags
>     pattern - more efficient packing and follows xe driver conventions (Thomas)
>   - Pass struct as const since flags are read-only (Thomas)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 67 +++++++++++++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 21a2527ca064..71cf3ce6c62b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2907,8 +2907,20 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  	}
>  }
>  
> +/**
> + * struct xe_vma_lock_and_validate_flags - Flags for vma_lock_and_validate()
> + * @res_evict: Allow evicting resources during validation
> + * @validate: Perform BO validation
> + * @check_purged: Reject operation if BO is purged
> + */
> +struct xe_vma_lock_and_validate_flags {
> +	u32 res_evict : 1;
> +	u32 validate : 1;
> +	u32 check_purged : 1;
> +};

This looks better, thanks for the cleanup.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +
>  static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> -				 bool res_evict, bool validate)
> +				 const struct xe_vma_lock_and_validate_flags *flags)
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -2917,10 +2929,15 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  	if (bo) {
>  		if (!bo->vm)
>  			err = drm_exec_lock_obj(exec, &bo->ttm.base);
> -		if (!err && validate)
> +
> +		/* Reject new mappings to purged BOs; allow cleanup operations */
> +		if (!err && flags->check_purged && xe_bo_is_purged(bo))
> +			err = -EINVAL;
> +
> +		if (!err && flags->validate)
>  			err = xe_bo_validate(bo, vm,
>  					     !xe_vm_in_preempt_fence_mode(vm) &&
> -					     res_evict, exec);
> +					     flags->res_evict, exec);
>  	}
>  
>  	return err;
> @@ -3013,9 +3030,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_MAP:
>  		if (!op->map.invalidate_on_bind)
>  			err = vma_lock_and_validate(exec, op->map.vma,
> -						    res_evict,
> -						    !xe_vm_in_fault_mode(vm) ||
> -						    op->map.immediate);
> +						    &(struct xe_vma_lock_and_validate_flags) {
> +							    .res_evict = res_evict,
> +							    .validate = !xe_vm_in_fault_mode(vm) ||
> +									op->map.immediate,
> +							    .check_purged = true
> +						    });
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> @@ -3024,13 +3044,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.remap.unmap->va),
> -					    res_evict, false);
> +					    &(struct xe_vma_lock_and_validate_flags) {
> +						    .res_evict = res_evict,
> +						    .validate = false,
> +						    .check_purged = false
> +					    });
>  		if (!err && op->remap.prev)
>  			err = vma_lock_and_validate(exec, op->remap.prev,
> -						    res_evict, true);
> +						    &(struct xe_vma_lock_and_validate_flags) {
> +							    .res_evict = res_evict,
> +							    .validate = true,
> +							    .check_purged = true
> +						    });
>  		if (!err && op->remap.next)
>  			err = vma_lock_and_validate(exec, op->remap.next,
> -						    res_evict, true);
> +						    &(struct xe_vma_lock_and_validate_flags) {
> +							    .res_evict = res_evict,
> +							    .validate = true,
> +							    .check_purged = true
> +						    });
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -3039,7 +3071,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.unmap.va),
> -					    res_evict, false);
> +					    &(struct xe_vma_lock_and_validate_flags) {
> +						    .res_evict = res_evict,
> +						    .validate = false,
> +						    .check_purged = false
> +					    });
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
> @@ -3052,9 +3088,18 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  				  region <= ARRAY_SIZE(region_to_mem_type));
>  		}
>  
> +		/*
> +		 * Prefetch attempts to migrate BO's backing store without
> +		 * repopulating it first. Purged BOs have no backing store
> +		 * to migrate, so reject the operation.
> +		 */
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> -					    res_evict, false);
> +					    &(struct xe_vma_lock_and_validate_flags) {
> +						    .res_evict = res_evict,
> +						    .validate = false,
> +						    .check_purged = true
> +					    });
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err = xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> -- 
> 2.43.0
> 
