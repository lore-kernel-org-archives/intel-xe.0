Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E130CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 16:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DA510E214;
	Fri, 24 Oct 2025 16:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMrpYklc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C4710E214
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761321927; x=1792857927;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H1F4ft077F81vUtoDdoXqpd/IyTFDHCjstzTKTShRLs=;
 b=OMrpYklckGymNw1S7DzsOQ9BrRN/9AemGS3eq7uouxBpLyZMIy6tjRNK
 uVjqSWuyhSgLpGRqAATqM+iu4Q6V+WFOwYCLXH3aLNrTykMLKljGh+Dc9
 NXt9UpoTPlMYdAQA/556OBA2wVdRarOPuHHBMmspNEL1SlQ2htb5c6u95
 PYwIhf3IQ3Fs4ZhyUlnftmS0oHkyEkM2BjoaGyeSowrS4D4McW4YucJk1
 jfxRBLmg3MPU1dRm9H+QeYL6qhN+q38kU//pURq0WhPl+dxQiQ/axQsHa
 DFUgd2lNAtccJWDqDbnuZedDK1gYc6GHV8thCF+BRtSrXH9XNVZw+R9ls w==;
X-CSE-ConnectionGUID: fazB72aXQI6WFhVkxmJnsw==
X-CSE-MsgGUID: Thq+nz8nToirCQI31o2PNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67150062"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="67150062"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 09:05:26 -0700
X-CSE-ConnectionGUID: 4pLbibzQQZWBzKSw5z6olw==
X-CSE-MsgGUID: k3e/HN4FR62a/njNRwfbUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="215118428"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 09:05:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 09:05:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 09:05:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 09:05:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T70qQrEiv+NjPYUYRucAjPYhk+P0QI/+2Q0RXZuwB6FlDC6P6QhjstDwhtm3tMT0ImpgmihUgl4bp/4SHuIdoxUD5hH6C2Qdiy/lLM0le5Phs5BqWmu6b2+zBCFTnyNJ/AKR7I7nEI7br71WxzkiGbuZJuWFJWvmwNQrYs6ani8LencUEfFCSvcL06+1ZFWdCwhJQVe4BqBDmoktNBW7PCrC5lSkaDKWrh3tE2dIYayavFDE/mzCooZo8u8csq3RMv73VMRbKUo1qVSpx1CcG55Wn0xX3R7CAuf4JqoOBSg43ue5ai1TUnzKUxrCja32V7RS4dJvHRq709ZHA0G0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2padpVT//gV/CTKhWmO+5vuFhqNRxcSWKeIT85Hyo8=;
 b=QQ1BXrDF1eF6dW9XW6GSawEm3lXvwFA4JdJIge1qYH2L6nJ0mM8ZYLdFBi2gH/AA5GsbB9Af2FvK8PMv59kUnPbH5nUTM8Y8VK95b+z4CSzrZ4a325hgJsJoPpnsWGGMT3If5hGGqtm76gUb7a0rz815Zfp+B4jgUSGwlL6Zaup9yPxp1gv+yOAOaOsx8bImipLQAoYBf9jVnLmIFnT7rFuZnl+7y4nVwAScfB+XZHZa5bpJpGZ0I1CKfi0nuT13lsYam3PTjRfjfP0Hc9P7V594MO0OFo1sP4acakWeV0oAfhnLz4imHXNWkSXRGzVHf8Q6RPlqXri1VpVmnqcA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPF0515C3CD3.namprd11.prod.outlook.com (2603:10b6:518:1::d05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:05:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:05:15 +0000
Date: Fri, 24 Oct 2025 09:05:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v8 1/3] drm/xe/migrate: Use AVX instructions to prevent
 partial writes during VF migration CCS batch buffer updates
Message-ID: <20251024160512.GB5409@mdroper-desk1.amr.corp.intel.com>
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
 <20251024133522.16970-6-satyanarayana.k.v.p@intel.com>
 <aPuFuykBdiwM41Z2@intel.com> <aPuHjlbbeJq8FpWr@intel.com>
 <670ce0ec-ce9c-4003-afc8-8e508e41564a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <670ce0ec-ce9c-4003-afc8-8e508e41564a@intel.com>
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPF0515C3CD3:EE_
X-MS-Office365-Filtering-Correlation-Id: ec303d6b-a16c-4b72-a155-08de13171e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FDr8JRDz1v7VEtYKQtirhmvgCF5H7XRuE8fFpCT/MJxZC4mYVY34LYqBge?=
 =?iso-8859-1?Q?8VPxnY0X2mRTAA865DMCzIdwaqDVjrHX7i3fKkFTNt8buEipT6hWHNfqhu?=
 =?iso-8859-1?Q?rNsrBJ/kVxaaSjV0DPzXpVW+ELX3EFLwwwmun9m4qJb4LBf3IzwpOQhYnh?=
 =?iso-8859-1?Q?+Mm9ZvJnHpbwQ165bJlzZwIcyxKAkctut5FEgeYs89lPj3v8TIei0a1/y0?=
 =?iso-8859-1?Q?T4PHTbuRDyiK22bg7Lv3ixDdudTrWHnRsB1ZaZkM6w8r9cYYAnKWp06tnS?=
 =?iso-8859-1?Q?/u4jubGQw1FklY2Lpp9gZlSvdtcN/o+dioAXw0IcRuM0GC5TPIjY1hIrBt?=
 =?iso-8859-1?Q?wCPGhGlYwUPtXr3qHq1u4cltqYHSJEJaY8zbP7hDo/FsrSWx50cK8v5OEF?=
 =?iso-8859-1?Q?3VxhyfPJBx7ELC6rwNtq7X1sg+k18p3ccFga/mCwUzFekg8wizVp+S1GOl?=
 =?iso-8859-1?Q?9wVuhYOf8V3Uko9yljN1Jq3EIlSo8a3dBL0qBLD01PFuNBTYIhMBj6i8Uk?=
 =?iso-8859-1?Q?nX/4QPTFdh8rTXZ7Nub/ZOLmuP8lXmPF4j8fmrHAgmGCBVD1fIeflQSlny?=
 =?iso-8859-1?Q?nHhGrtn0zbWXed9bKBJw0IgtQBV8sn5RwIoe7G1gctGsltmeVPGsmEmuew?=
 =?iso-8859-1?Q?GNNyDx7NcEPUzEsitUTo0KrgZY4XCDnRFTfbztla+Do99bek8p3DttatQu?=
 =?iso-8859-1?Q?50zQPznjH/GN5t4y39KTX0nVLViE/sgoFprqTpNMxJtUXwqqz/133j9rVi?=
 =?iso-8859-1?Q?L5dm/nVWMBPIi14/66hJcuedwPmk9RBA2aqa2XZKHSlRm5yPS6joCJe7dU?=
 =?iso-8859-1?Q?rkXlN0eb5sBJtLzpbr0WpMOIgA12hujy/X3vuR2OTxEHaxzSAJM5s5Sst/?=
 =?iso-8859-1?Q?ow97D6aZLBcDFqimWdA5UAB4Ioha1vd4BjEp3lfVRGYIN5LjAI7sB6tjyh?=
 =?iso-8859-1?Q?4Q16JoXMfKvHdOjaTVOL/CLR0ixy0x1DtTwcCYfyp1+lwSnHBda8TaZn7e?=
 =?iso-8859-1?Q?J6xTQt347+ZT5zKMxdCAfvVU8VmkFqBYt54uspoUisKZVwgNGgRHHw8lBy?=
 =?iso-8859-1?Q?rfokgGSxIuTWH13qNaVl0/7E14A91UzzNS0b4QLT5D0xsTAyZozhHmAn+h?=
 =?iso-8859-1?Q?O/YWl3+Y7jRTUE3hMh7Wfj7lrolOqvEOE/k6bwrytUmHx1aT4s/gWhwT55?=
 =?iso-8859-1?Q?g8HQNnfL3vbBsAcll4THkIzRX5xyrQmxDcSAS+Qevfl+kXZt2WSvgcH2DH?=
 =?iso-8859-1?Q?QBmAFK6otVEtgSeoK6riuAL3683DEOCkD1sDkWvAuY6tiszhOdKdYriT+0?=
 =?iso-8859-1?Q?3ZnR2V9LbHUS7zKJ6el83sHx0/rMKZ/0Ng1sK1ac+BnRdiFzo1vFIRD6Fe?=
 =?iso-8859-1?Q?SOuoLiFZwbf27L7FarMpdFwQdiRkyTzb7W4ttzwbwfv5KaAysxL2pBH8vZ?=
 =?iso-8859-1?Q?7zOA3FyBiaKHh6IJ6AJtIOCrbwP3QqpIMXHhnDiofihd+QkVFHyFwQIgrA?=
 =?iso-8859-1?Q?ivk/LPPrsRG2P2PxD+y+hy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+1Q9oVYBEiYwgj+Hj/CRYgiEX3ylI+lD3lp66uy8isHUxWx5C7ZvNLNjna?=
 =?iso-8859-1?Q?49uKv+TFYPy+qKOiuB+pyCfQxB24tgc/xSrFNooF0oiEDryPTo9AonvHW7?=
 =?iso-8859-1?Q?PA0J/q2ezrtpZuPzXZ7rXkPgNs0hfvT9Jk3AAVU4e5vs8CidJAzdWqD1/W?=
 =?iso-8859-1?Q?s8PbKZYpFbDS9OPu3x3dsCxB0zBgsKwXkTqE+zJrQALixbZlwwSzHdNBWo?=
 =?iso-8859-1?Q?IYvUzkLZr9P/mniVgBjKDiUmvGeiNbp76MsW2Xz97p0Suj9Wi8hXKRPUnv?=
 =?iso-8859-1?Q?Kno9Y/XRAhKKB5jbh/aD7lgPusgxlkZnTpO0Z6Eu6F7zHkB2hhSXZaCV9j?=
 =?iso-8859-1?Q?4e3gQSzDxdBWAv9P56NlSUb5sat0j9Jz92RdzdZZ6inL5vRuqOTOhFFccs?=
 =?iso-8859-1?Q?OPXq+nW8Lyc9X2BBOTLhL679WrMylA/7pJDlVxPo+jSsKv4pflFOMV9xkA?=
 =?iso-8859-1?Q?KtdY+cgzEIitVBqa6GhF7qxf/Vg1bIOyI6wy6/ANuawZ0NCWmlJWyzIO5S?=
 =?iso-8859-1?Q?M+MXnK2X5H8K6fq4puTGxvoX8Yp80mU0W6hIsnZ2APvb/2b0Nos2mSNWTa?=
 =?iso-8859-1?Q?7V4d+VcNTh02UH1m/KW+THI5to1t9gGJ1VRKE7dtzL7a2ap096k8RTvBlP?=
 =?iso-8859-1?Q?qNhX8n5+DhaihcZkCNFjuQ89jeOoV0H/y4Gt1HDOa8qOKYybrNOACO335g?=
 =?iso-8859-1?Q?8aUzy0BLQpma71zxKxZJ/O1JYKATjCLdyUyXF08OHkb/XxpN0/tG4AkGsd?=
 =?iso-8859-1?Q?OdkDNkvYk+OLwpsBpIGmAMK8bG0WitueuQYMcykwxB6HzrVJEx8N9wYygj?=
 =?iso-8859-1?Q?AyaMngPPpwD8w+9r/SODBLRRTI/ne50nN+B+Yov3JsEYTqU2h5OhywETMz?=
 =?iso-8859-1?Q?C64LhaVB2yJJXhDSteetEthPsVtu2+uiRpSCHUqsD9HhAbcXqSNh9WqfaS?=
 =?iso-8859-1?Q?RW/6jkTzRcFPUfCxfZHpb674BUhcQDzOEB/aYqOnr+j6n310/61DcXcRjq?=
 =?iso-8859-1?Q?zbnwYM/AKawf6M1z+lZuoGxKvP+L1iVm1/LvPjx3jEElZCAQF5UCK+97bZ?=
 =?iso-8859-1?Q?xwCVSJhtJ9J9Hi6tG7mG92mXj+jZpGXmkK5exjvlCdsrW1V0lGRgw7l8Pp?=
 =?iso-8859-1?Q?tK9ONbZfbXzXW4DBEbph4WGW44ceEN75epJXY9ap44ItwlOYmTMkfZR7tW?=
 =?iso-8859-1?Q?hFPyPvtqA+u3gXFQWHCAwv1HqGc/niRbWr6Ay1PxraK36LCWMSwjfbX+SR?=
 =?iso-8859-1?Q?cjkePWfy4J2WmpJV1f+7JDAhWfTkhb5RkWch4HHnrCMR4+W1TVi5IvOKpl?=
 =?iso-8859-1?Q?aaCICXhCLx+W/DwYISM0NMvvPOV7cFAbreqxNYlr9pGB19NVrP1ihNjMez?=
 =?iso-8859-1?Q?nEXckIbidWoG3QcpA6eChx2dqlGedaAkoejpH/i8aagNbCtAL3YdfygpvO?=
 =?iso-8859-1?Q?Vb+t9+ddIX6FPJZvjApXUv1LEG5IdCQDmrQ1+gIKpRutAYMmJugkqakH1Q?=
 =?iso-8859-1?Q?lcwbq5OJiTk8ECS2MuvIsdRmoJIHAOb3azrf8XbddWT0sJqdStCu4OZZw2?=
 =?iso-8859-1?Q?3zeYPtJFIUtQLmR3uIx/TP9U0v+Vlrk6/09XTk1W88ByzX2CheGNjYyzOX?=
 =?iso-8859-1?Q?LkylAfPW0N1xcVaDDbNkDnYcCjDZMliWAq4vMx8ErM/03bJRPE0BoB6w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec303d6b-a16c-4b72-a155-08de13171e5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:05:15.0811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZ5GWrhExVaJ7r7b8UsWcWuD1paf7XB5m+oAZ3+7nXCKUbfXAakEP8OpwG/coecZySwIPFTFnIsMzvXeooOqDnhuBoDttZPiwbJPxN7ldiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0515C3CD3
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

On Fri, Oct 24, 2025 at 07:55:32PM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 24-10-2025 19:35, Ville Syrjälä wrote:
> > On Fri, Oct 24, 2025 at 09:57:15AM -0400, Rodrigo Vivi wrote:
> > > On Fri, Oct 24, 2025 at 07:05:24PM +0530, Satyanarayana K V P wrote:
> > > 
> > > Hi Satya,
> > > 
> > > First of all, thank you for the updates.
> > > 
> > > Second, the subject is way to big.
> > > 
> > > This should be enough and under 75 cols:
> > > 
> > > drm/xe: Use AVX instructions to prevent partial writes during VF pause
> > > 
> > > more below:
> > > 
> > > > VF KMD registers two specialized contexts with the GUC for migration
> > > > operations. Save context contain copy commands and PTEs to transfer CCS
> > > > metadata from GPU pools to system memory and restore context contain copy
> > > > commands and PTEs to transfer CCS metadata from system memory back to CCS
> > > > pools. GUC submits these contexts to HW during VF migration.
> > > > 
> > > > Each context uses a large batch buffer allocated via sub-allocator,
> > > > pre-filled with MI_NOOPs and terminated with MI_BATCH_BUFFER_END. During
> > > > BO lifecycle management, segments are dynamically allocated from this
> > > > buffer and populated with PTEs and copy commands for active BOs, then reset
> > > > to MI_NOOPs when BOs are destroyed.
> > > > 
> > > > The CCS copy operation requires a 5-dword command sequence to be written
> > > > to the batch buffer. During VF migration save/restore operations, if the
> > > > vCPU gets preempted or halted while this command sequence is being
> > > > programmed, partial writes can occur. These partial writes create
> > > > incomplete GPU instructions in the batch buffer, which trigger page faults
> > > > when the GUC submits the batch buffer to hardware for CCS metadata
> > > > operations.
> > > 
> > > Perhaps we could summarize the thing here and move details to the comment
> > > near the assembly. The important part in the commit message is to have
> > > the 'why'. Some of the details of the commands like MI_NOOP fill and all
> > > could be in the comment near the ASM.
> > > 
> > > > 
> > > > Standard memory operations like memcpy() are preemptible, meaning the CPU
> > > > scheduler can interrupt execution midway through writing the command
> > > > sequence, leaving the batch buffer in an inconsistent state with partially
> > > > written GPU instructions.
> > > > 
> > > > Replace standard memory operations with x86 AVX instructions that provide
> > > > atomic, non-preemptible writes as AVX instructions cannot be preempted
> > > > during execution, ensuring complete command sequences are written
> > > > atomically to the batch buffer.
> > > > 
> > > > Expand EMIT_COPY_CCS_DW from 5 dwords to 8 dwords to align with 256-bit
> > > > VMOVDQU operations. Update emit_flush_invalidate() to use VMOVDQU
> > > > operating with 128-bit chunks. By ensuring GPU instruction headers
> > > > (3-dword and 5-dword sequences) are written atomically, we prevent partial
> > > > updates that could compromise migration stability.
> > > > 
> > > > This approach guarantees that batch buffer updates are completed entirely
> > > > or not at all, eliminating the page fault scenarios during VF migration
> > > > operations regardless of vCPU scheduling behavior.
> > > > 
> > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > ---
> > > > V7 -> V8:
> > > > - Updated commit title and message.
> > > > 
> > > > V6 -> V7:
> > > > - Added description explaining why to use assembly instructions for
> > > > atomicity.
> > > > - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > > - Include <asm/cpufeature.h> though checkpatch complains. With
> > > > <linux/cpufeature.h> KUnit is throwing errors.
> > > > 
> > > > V5 -> V6:
> > > > - Fixed review comments (Rodrigo)
> > > > 
> > > > V4 -> V5:
> > > > - Fixed review comments. (Matt B)
> > > > 
> > > > V3 -> V4:
> > > > - Fixed review comments. (Wajdeczko)
> > > > - Fix issues reported by patchworks.
> > > > 
> > > > V2 -> V3:
> > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > 
> > > > V1 -> V2:
> > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > >    (Auld, Matthew)
> > > > - Fix issues reported by patchworks.
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_migrate.c | 114 ++++++++++++++++++++++++++------
> > > >   1 file changed, 93 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 921c9c1ea41f..005dc26a0393 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -5,6 +5,8 @@
> > > >   #include "xe_migrate.h"
> > > > +#include <asm/fpu/api.h>
> > > > +#include <asm/cpufeature.h>
> > > >   #include <linux/bitfield.h>
> > > >   #include <linux/sizes.h>
> > > > @@ -33,6 +35,7 @@
> > > >   #include "xe_res_cursor.h"
> > > >   #include "xe_sa.h"
> > > >   #include "xe_sched_job.h"
> > > > +#include "xe_sriov_vf_ccs.h"
> > > >   #include "xe_sync.h"
> > > >   #include "xe_trace_bo.h"
> > > >   #include "xe_validation.h"
> > > > @@ -657,18 +660,70 @@ static void emit_pte(struct xe_migrate *m,
> > > >   	}
> > > >   }
> > > > -#define EMIT_COPY_CCS_DW 5
> > > > +/*
> > > > + * VF KMD registers two special LRCs with the GuC to handle save/restore
> > > > + * operations for CCS metadata on IGPU. GUC executes these LRCAs during
> > > > + * VF state/restore operations.
> > > > + *
> > > > + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > > + * VF state save/restore operations. Since these operations can occur
> > > > + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > > + * buffer are written atomically to prevent corruption from incomplete writes.
> > > > + *
> > > > + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > 
> > > Here you still mention 'atomic' since we already know this is not 'atomic'.
> > 
> > I still don't see how is this supposed to do anything useful without
> > atomic writes to memory.
> > 
> > If the GPU is executing the same memory we're writing then nothing
> > short of atomic memory writes is going to actually fix it. And even
> > that would require careful alignment of things to guarantee that
> > each command is completely contained within one atomic write.
> > 
> The CPU and GPU operate on the same memory space but at different times
> during VF migration. The critical issue occurs during the batch buffer
> preparation phase when the vCPU is still active and writing GPU
> instructions, while the GPU will later execute these same instructions after
> the vCPU is paused.
> 
> During batch buffer updates, if the vCPU gets preempted while writing GPU
> instruction sequences (such as the 5-dword CCS copy command), it leaves
> partially written instructions in memory. When the GPU later executes the
> batch buffer after vCPU suspension, these incomplete instructions cause
> execution failures and page faults.

As was discussed on the previous revision, the architecture document
already gives guidance on approaches to deal with these timing issues;
using AVX like this is not what was recommended.  Can't we just
implement the shadow buffer and eliminate this controversial and
confusing assembly usage?  I think relying on assembly should be the
absolute last resort and not something we jump to when we have cleaner
and more widely-supported options.


Matt

> 
> AVX instructions provide atomic write operations that cannot be interrupted
> by the CPU scheduler. This ensures that GPU instruction sequences are
> written completely before any potential vCPU preemption occurs.
> 
> AVX instructions (VMOVDQU) guarantee that entire instruction sequences are
> written in a single, non-preemptible operation. The 5-dword CCS copy command
> is expanded to 8 dwords (padded with 3 MI_NOOPs) to meet AVX 256-bit
> alignment requirements. By the time the GPU executes the batch buffer (after
> vCPU pause), all instructions are guaranteed to be completely written.
> 
> Here we are ensuring that GPU instructions are fully formed before the GPU
> attempts to execute them during the migration process.
> 
> -Satya.>>
> > > Let a summarized explanation in the commit message and put more here.
> > > 
> > > I'm sorry for being picky here, but I want to ensure that the information
> > > around this code is clear so we don't keep having to explain this over
> > > and over in the future.
> > > 
> > > > + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > > + * sections. This prevents vCPU preemption during instruction generation,
> > > > + * ensuring complete GPU commands are written to the batch buffer.
> > > > + */
> > > > +
> > > > +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > > +{
> > > > +	xe_assert(xe, !IS_DGFX(xe));
> > > > +	xe_assert(xe, IS_SRIOV_VF(xe));
> > > > +
> > > > +#ifdef CONFIG_X86
> > > > +	kernel_fpu_begin();
> > > > +	if (size == SZ_128) {
> > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > +	} else if (size == SZ_256) {
> > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > +	}
> > > > +	kernel_fpu_end();
> > > > +#endif
> > > > +}
> > > > +
> > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > +{
> > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > +
> > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > +
> > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > > +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > > +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > > +	} else {
> > > > +		memcpy(dst, src, size);
> > > > +	}
> > > > +}
> > > > +
> > > > +#define EMIT_COPY_CCS_DW 8
> > > >   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >   			  u64 dst_ofs, bool dst_is_indirect,
> > > >   			  u64 src_ofs, bool src_is_indirect,
> > > >   			  u32 size)
> > > >   {
> > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > >   	struct xe_device *xe = gt_to_xe(gt);
> > > >   	u32 *cs = bb->cs + bb->len;
> > > >   	u32 num_ccs_blks;
> > > >   	u32 num_pages;
> > > >   	u32 ccs_copy_size;
> > > >   	u32 mocs;
> > > > +	u32 i = 0;
> > > >   	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > >   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > @@ -686,15 +741,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > >   	}
> > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > -		ccs_copy_size;
> > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > +		  ccs_copy_size;
> > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > +	/*
> > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > +	 * write the sequence atomically.
> > > > +	 */
> > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > +	cs += EMIT_COPY_CCS_DW;
> > > >   	bb->len = cs - bb->cs;
> > > >   }
> > > > @@ -1061,18 +1124,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > >   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > >   }
> > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > +/*
> > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > + * save/restore while this sequence is being issued, partial writes may
> > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > + * emit_atomic() to write the sequence atomically.
> > > > + */
> > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > >   {
> > > >   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > +
> > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > +	dw[j++] = lower_32_bits(addr);
> > > > +	dw[j++] = upper_32_bits(addr);
> > > > +	dw[j++] = MI_NOOP;
> > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > -	dw[i++] = lower_32_bits(addr);
> > > > -	dw[i++] = upper_32_bits(addr);
> > > > -	dw[i++] = MI_NOOP;
> > > > -	dw[i++] = MI_NOOP;
> > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > -	return i;
> > > > +	return i + j;
> > > >   }
> > > >   /**
> > > > @@ -1117,7 +1189,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >   	/* Calculate Batch buffer size */
> > > >   	batch_size = 0;
> > > >   	while (size) {
> > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >   		u64 ccs_ofs, ccs_size;
> > > >   		u32 ccs_pt;
> > > > @@ -1158,7 +1230,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >   	 * sizes here again before copy command is emitted.
> > > >   	 */
> > > >   	while (size) {
> > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >   		u32 flush_flags = 0;
> > > >   		u64 ccs_ofs, ccs_size;
> > > >   		u32 ccs_pt;
> > > > @@ -1181,11 +1253,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > >   						  src_L0_ofs, dst_is_pltt,
> > > >   						  src_L0, ccs_ofs, true);
> > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >   		size -= src_L0;
> > > >   	}
> > > > -- 
> > > > 2.51.0
> > > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
