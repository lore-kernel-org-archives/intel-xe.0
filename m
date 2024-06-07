Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E8CC27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B173410E0E9;
	Fri,  7 Jun 2024 18:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHxsDXdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B822F10E0E9
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 18:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717783879; x=1749319879;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PCUPTPi32fZahAeVDb/fQvTinyRuTTvQHSKWt9+VD2o=;
 b=WHxsDXdOsFZ3nOESQ4NJh/qM8Fsd65cTJBwiyYVblHwMP/C1n3Ufw20H
 Gnf1HEpUIlv2FzTlOS7QJMKWvdHwnNWBPwonaY2XOFMavIJ6+IYCsrF4e
 /Tn2YqwaDr74vIrRFYWos9fYD445vc/qpooafgg2aIeCpbE+2Xt7J0sDW
 YfpLJaVj0ipVnMwY/4Gdn6pllI4hiaMDh7ezEsNgdysfEzQ8JUpYWgLqO
 X1y7wf0Yn6QkZwNbRPTivCy7dkJgHcmVrUx9i94SM9J2SzjZcC3yvTYc9
 izuqTKZN8wB1w4hgqJhgb79QRRTmB3vHKDhD5kRBkUvd2jWC6muue+4AE A==;
X-CSE-ConnectionGUID: QaS0NlW0SoeWdMsxPUEx5w==
X-CSE-MsgGUID: mfjK/gQTSJm47UuORPwumQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14754168"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14754168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:11:19 -0700
X-CSE-ConnectionGUID: hhBLq1YQQwirBCNeeCUtwQ==
X-CSE-MsgGUID: igRYwHafSLG+CM8nUWaGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="69569997"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 11:11:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 11:11:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 11:11:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 11:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBwx3tFtSzTAppCABsxTTSg/OdUsoalZOs+5/K07G8lsLkKGjhlSf5vHvuJhiRc+/4cBxm5Gi0tKZhMqhO0seN2D8A5s8i9YkWMhMD4L4NBAL9CbfUS2xCNz2G/paP8sOSo6t+2kaYNZ4F9JogbqVMgiUA/M4mHK6spOxL7GdAhwBQ37sEeo2Zce8E4WCU5qaOuUgQLdhn8RMsZ+0qa8PxVNIvZM6YdHzEtIQ9rIXbFUVLsBXTZi1TckuOZUZFXTn/jN2WwG1Akhj7bFDbXlSM7hQuzZAhdUgExiZ+8RVzYhtgTISzvoCZLkqcp+m5fvfddnCMoVzpKUPG9kwzwtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLl24iqTPyIeCVSivTZayxEgHUipQfbiREtCbi+HLjk=;
 b=Jo0mbarOVzfxDIc4aDS+Thsj8JsfFRLYCCno0JTQQUzm6rQ8Y+ASB0f0Auq0cJ90bdM2R7nIgI+1eKXrNnYa9oGoSTOxD/+NB2iEIpKlG+z1+st2bU8rcl5KPM9tifLRR0pfAQhkXErxGp9EH2+CsmoKqUkF7poK1X5ekuBeyiFy1V5NZ3Hz1Pn/8iGrPGj+A1UcsQ31ZhHjFZMtXkY/gWxZdGhXu6nh9FM0pfE+YN7jXL1SMy08mhwBUaRYKul5S8xJSFFbRbc3OOy4LHYWaoSYYBQsVEZGzSvpKF09g+abwRRjRPzJ2cJxmMFYEZYqR3gGmIfk5VgfMUD5/4HQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 18:11:13 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 18:11:12 +0000
Date: Fri, 7 Jun 2024 18:10:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ghimiray, 
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Message-ID: <ZmNNBq8iuUplWM9T@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-29-oak.zeng@intel.com>
 <ZhdPsV/ou2DMQe3O@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991AB46782299FA3E2ACE7F92042@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zh2ClEZweYvYFpWN@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69916E3FB64283557E36D0F692FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZmNJwDBolFep0foV@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmNJwDBolFep0foV@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 7381efa3-dd68-4c4c-be47-08dc871d36c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yk+1hfTYt/C5GenNjZKoxkzTe6ecfTdORy3fIFj9C0xFMmk6h+Lggbu614?=
 =?iso-8859-1?Q?52Dk/KbF+EDJQtGxIzZDkV+VxMhtlO/YUlnAKFZZAbmS7VOAWTxZYb9oQB?=
 =?iso-8859-1?Q?hHKgJ+JKH2jYYLjOIpzaifAkVhATDqSACuBh4bycTb5PrqgSslOPqG5C3a?=
 =?iso-8859-1?Q?QgAg9SznJWwDAl8qxkttNE+wIKkO6y12SCtcl2BnVGltTsjJLMN8vWrWBa?=
 =?iso-8859-1?Q?eIlCcM64Q+RbdNyTrXeMAKTuWbRjdatZu5jr9BoPp2sjGAHHEKAonTmtes?=
 =?iso-8859-1?Q?g88iWAIOAgY8Khz2qvzriArL9cxZSoc/a+MV0hIORhQ+y0DRAArkvnhsY1?=
 =?iso-8859-1?Q?42UeJG77KogUkQS6nWVNGQ3ieCHEjf6DgdMEiKlSNnOJOmKbw3Gr6z7QW4?=
 =?iso-8859-1?Q?eFyToPsSEZj/euziyZotus8cUrChqMOo8Aez0ZRU9sH47UFp6Wliic+uYc?=
 =?iso-8859-1?Q?Utv+DLNaLbK98SNk49vXWhNLpfnB1R5gGArx9Qan1VP9QpD1OmkuBubKxD?=
 =?iso-8859-1?Q?cMwQjVP+bSG64yMwgvz1pRb5Fxue5JINb1NowfqmLBuRwbAlRw+dEZITMn?=
 =?iso-8859-1?Q?u77lW+6ibRi4TbBpSus2EqJ7CFXjRpuLGgrIeFxzDSqaIxISnEMwEaGgsD?=
 =?iso-8859-1?Q?0LsAtKxc7KZR8QbITZ1cx36OocgBzFzNlRzHHoHlOzOe5hGbGsigf1CLh+?=
 =?iso-8859-1?Q?44BoGzWJwGoUT9cNa4sEkbBSy8NeuSD7vcQtW2unMv3v9DvGcUPUSMKksZ?=
 =?iso-8859-1?Q?I7gcUxgydxW6ByOxa4lBGVvOqjK+w1WmnhalwdKJMJn6JrwF9z6xsB/4M5?=
 =?iso-8859-1?Q?M944mbfgPYspAYW7IkUD39nIcp7zmyaSGKQw8KuhX/RLhavgBhcYgmoDNk?=
 =?iso-8859-1?Q?M/ibZ+agYbZmOsC07iUGwxpWbx5wK6r+IfuE/9SnY6NZRKpSjE3dAfTraL?=
 =?iso-8859-1?Q?Zg3hHd8/2joVmBQxcSWYK2fiB9FS0FiBM9XiroeF/b5o7dOW8Gvx4vddP7?=
 =?iso-8859-1?Q?DyYWfxGyy8rS6yGdMNBb6LB8IPs+JNaltHYoC1LKwc+CdTYS1fKf3Yx0Du?=
 =?iso-8859-1?Q?XN1UFrXDSAz4vM9ZDeXYLrCpAi5bwWbADXcbef6bI/ktBbSUENBuH4U35j?=
 =?iso-8859-1?Q?+5iSoqRDv//YH42mmtwJvaOuemRu0193fmuI3FB5TgkMtHjwJVMMbWqDYo?=
 =?iso-8859-1?Q?RpUkv7i8VYj78ph05i63u+ej8jNyO4GYWx5WX4BQYAUEs05dOiKdaOKrh0?=
 =?iso-8859-1?Q?eHc1CyiaVE6pb/khXfxKkfabIpPnAOQXmg62F8JbX3YjFux0Cr2I25SVbH?=
 =?iso-8859-1?Q?8xMOU8ZZYEgYp04IwBpB3xNuCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0yrtj57rGD1QDx9Le7CVMNSnMWeNE7Li92O1kL9Ik3ehFAkOrZw29kfnvX?=
 =?iso-8859-1?Q?q0FBKv3QVEY/QfER/tThZAmrNh0Uf9xslrHsPQ5o/awbfdScWGCcwB6qai?=
 =?iso-8859-1?Q?u7bDMb/iSkziYoX87tqNlyLh+/N5Ak5re0535AMJOofdnr7oIy2atPWg7o?=
 =?iso-8859-1?Q?TY5R0ry5RMT+03RPpbINRkgMgZU+eYZn8noAoyZiHJWW/DUtaOe2HpEpU/?=
 =?iso-8859-1?Q?StqEBeHT4hpeP65RZ2O1fixDR5pmHuOka4vb0sbPa1u3StfMIlLfdRLhbY?=
 =?iso-8859-1?Q?YpCZNU9DRRcPDSuyhR45KZ7jTBK7ppWj6KxNqB2+6Akb2+Ek1yoq29KtPF?=
 =?iso-8859-1?Q?mKNd7snMv0cbPQOZudS4HA0F8lC5vaxbIiHo90dieaWKtlixcLG9rogG0W?=
 =?iso-8859-1?Q?OB9le6H1Trtp0B5+wM9zxAyVxC3SP+o1t0pSm3mJe8AtjEulOT42Vwhbwo?=
 =?iso-8859-1?Q?MhGJssPNHX4rkzHLkac9XQh0eYAAmXNw16Yx8cE5U7v5EPIFUTzhGVV0At?=
 =?iso-8859-1?Q?/jThcWFlbRIOdUrGCe57h+1yvyQHHJ/h7iU5oW7Tj4CsKue/ryD3TShyQt?=
 =?iso-8859-1?Q?6LJG7TWjgrfxHDie5uGmaPh352+mcTjkLW83e6fRIJD/GRdZhOggoPcu+F?=
 =?iso-8859-1?Q?sYn3rPOG5oh6dXVkoHkrKBgGlOzqaITax8N6fNt3TOX+LeefVRFa30BScq?=
 =?iso-8859-1?Q?IfTOHg5At3jrPtMlX6qluntZkAxFdyIJHiWmH5BbyS495WqxJhPGgyYv1e?=
 =?iso-8859-1?Q?X2s+AjHwPaR35NzrBZ1XSKXv/jkwOBsfHHjthYY8v4320+dT/1D/1rxqvd?=
 =?iso-8859-1?Q?Pkw/zLZyToe5ttF9vpe1thDrCBJd1XMHvqFLvXhSBJwu1BIyHnNUgwumZk?=
 =?iso-8859-1?Q?pdvhw8in0aov/eFrH5uXt82qx7aYMHFDqpJAYhU8x+NyjpKuUJFNi8wGo0?=
 =?iso-8859-1?Q?jIYqMIB6R7zH7K0v/oY9gVjIVkmQBa1/YbXfLFR4IgDT2/tNL3hSq0Lpwp?=
 =?iso-8859-1?Q?NI8kM1Z310pM/eFXjVTM3WYxbMyIMZY69HamUyZ9elvqEDMjhrvoykC2Hu?=
 =?iso-8859-1?Q?otWJ1a8nxelsuzpGSsOF3DpcjVjAjUkurWEAyaJQa+fuN/L36d47zaxGpq?=
 =?iso-8859-1?Q?AyxMOHVbn1X8N6h8LPIAlGVXfRVQNTnSx59bdfLPbg7aKt9+K/xcQQSVc1?=
 =?iso-8859-1?Q?G3ET5GVMyEM1LQfoS0J3ldnpfnU975FpKPW0G/D6XQFbQ+L1cSv/JPNOpr?=
 =?iso-8859-1?Q?r+kPR3MqwgIAbRqXTkJgJrMJ7T0cQ2GttxATUqZt+4cVhAW8mSop9jMe1z?=
 =?iso-8859-1?Q?Cd2pQIQGstkkihFfSn1QQcTh/v5VHqgkqg1iGGKSP2n4mN05vmOy7FRcDz?=
 =?iso-8859-1?Q?oOXDVNNA5bi6g7Qu0+SyhGEX0QJXtYSz/fS6O/YA3ORkJzEdgxOkYKjp/J?=
 =?iso-8859-1?Q?W4/mCqbxcITKmpXI8MUxNshr75UogIEVjENo7kQrJzZJVPNie2AZ2CrfVm?=
 =?iso-8859-1?Q?kRe2xaRiVX8XaRPfQnKMBabbKbMfEwd6tx3HRVkvSZcRalfzZl6zhBVb1j?=
 =?iso-8859-1?Q?KSaI5sHzWAIR6n+yktzpd2KtVRCJM2KliBTZJ8oV/UYEYCk2A5K4t8Nymp?=
 =?iso-8859-1?Q?WJgKPTPLW9B6eqDksbegaUs57JjGEmpsqBT8A0yUkhdQkz5G+ElXArNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7381efa3-dd68-4c4c-be47-08dc871d36c7
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 18:11:12.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNyqZuKVnowUJPbh6jSY3/rssdZuGsgrs7fpdNSasGIwz9wb/DiRH2yVgY1pkk1i1bOZ+Qicx+LHCbERQ6Ai2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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

On Fri, Jun 07, 2024 at 05:56:16PM +0000, Matthew Brost wrote:
> On Fri, Jun 07, 2024 at 11:12:00AM -0600, Zeng, Oak wrote:
> > Hi Matt,
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Monday, April 15, 2024 3:40 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > > Brian <brian.welty@intel.com>
> > > Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to
> > > vram
> > > 
> > > On Fri, Apr 12, 2024 at 03:21:04PM -0600, Zeng, Oak wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > Sent: Wednesday, April 10, 2024 10:49 PM
> > > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com;
> > > Welty,
> > > > > Brian <brian.welty@intel.com>
> > > > > Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to
> > > vram
> > > > >
> > > > > On Tue, Apr 09, 2024 at 04:17:39PM -0400, Oak Zeng wrote:
> > > > > > Introduce a helper function xe_svm_migrate_vma_to_vram.
> > > > > >
> > > > > > Since the source pages of the svm range can be physically not
> > > > > > contiguous, and the destination vram pages can also be not
> > > > > > contiguous, there is no easy way to migrate multiple pages per
> > > > > > blitter command. We do page by page migration for now.
> > > > > >
> > > > > > Migration is best effort. Even if we fail to migrate some pages,
> > > > > > we will try to migrate the rest pages.
> > > > > >
> > > > > > FIXME: Use one blitter command to copy when both src and dst are
> > > > > > physically contiguous
> > > > > >
> > > > >
> > > > > Yep, touch in this throughout the series. Only vram needs to be
> > > > > contiguous though as we dynamically create PT mappings for sram pages
> > > in
> > > > > the migrate code. Getting this in a must and should be done immediately
> > > > > IMO as this a very, very basic perform thing we know needs to be done.
> > > > > We will likely have to tune this code quite a bit for performance so
> > > > > getting known things done would be helpful.
> > > > >
> > > > > > FIXME: when a vma is partially migrated, split vma as we assume
> > > > > > no mixture vma placement.
> > > > > >
> > > > >
> > > > > Agree we do not want support partial migrations. We likely want to
> > > > > return -EAGAIN for something and fault back to a smaller xe_vma chunk
> > > > > size which I discussed in [1] and add comment on in [2].
> > 
> > 
> > I thought into this when I worked on v3. I end up with keep the xe-vma not splitting, but migrate partially of a vma. A vma can have mixed backing store now... To support this, I had to make the page table update and invalidation range based (vs whole xe-vma based) I am testing it. Not very sure how well this goes.
> > 
> 
> A few things, I strongly oppose mixed storage within a single GPU
> mapping. I view this as an unnecessary complication.
> 
> A GPU mapping is not a VMA - it is a subset of a VMA. It has been agreed
> upon we have a 1:N relationship in SVM. With '1' being a GPU VMA which
> reflects user IOCTLs (e.g. initial large bind, madvise calls which can
> split the VMA). The 'N' being mappings dynamically created on upon GPU
> page fault. This a xe_svm_range (subclass of drm_svm_range) in my PoC.
> My expectation is that any post has something similar to this agreed
> upon relationship implemented.
> 
> Here my view is the 'N' never is mixed storage.
> 
> See my comments about 'page grainularity' migration in 'implement
> functions to allocate and free device memory'. If you are doing page
> grainularity migration, then 'N' is exactly 1 CPU page (could be THP)
> thus you never have a case where partial migrations or mixed storage is
> needed. Any spliting / mixed storage by definition is not page
> grainularity.
> 
> If we don't fully support page grainularity, I think the grainularity
> for any operation is allocation size of 'N'. e.g. Upon CPU page, CPU
> unmap, evict, 'N' is fully moved, invalidated, GPU unmapped. This
> simplifies the code quite a bit. See 'Migrataion', 'Partial Unmapping of
> Ranges', and 'Examples' in drm_gpusvm.c. Of course open to others idea
> here but anything that is more complicated that what I'm suggesting,
> expect push back.
> 
> > One thing I realized that might now work well is the range based invalidation. Say we a pde entry covering a huge 2M or 1G page. If we only zap 4k in this rang, we will need to split pde entry and replace it with many pde/pte entries. Even though the zap_ptes/page table walk functions are range based, I doubt it works for such case. I will have to test it out. I think even if it doesn't work, it worth to make it work as an improvement area. For example, core mm obviously support such function, see zap_pte_range.
> >
> 
> If we have GPU page tables larger than the CPU pages, then we are not
> doing 'page grainularity'.
> 
> This is a large source of confusion for as you seem to have conflicting
> ideas in reply to reply. Do plan on supporting 'page grainularity' or
> not? This is unclear to me.
> 
> If we don't support 'page grainularity', then see my above for how I
> expect an impedance mismatch between the CPU page size and 'N'. That
> applies here as well.
> 
> > 
> > 
> > > > >
> > > > > Migration should be best case too if we fail migrate we can always leave
> > > > > backing store in sram too.
> > > > >
> > > > > I do have question though, when do we get partial migrations? A user
> > > > > having called mlock on some of the pages? I just want to make sure I
> > > > > fully understand that case.
> > > >
> > > > Yah, mlock could be one case...
> > > >
> > > > I also looked the hmm code. There are few other cases where
> > > MIGRATE_PFN_MIGRATE is not set (so we skip migration after), such as pte
> > > is NULL and vma is file-backed (not anonymous); entry is swapped out to
> > > hard disk etc. see more details in function migrate_vma_collect_pmd.
> > > >
> > > >
> > > > >
> > > > > [1]
> > > https://patchwork.freedesktop.org/patch/588526/?series=132229&rev=1
> > > > > [2]
> > > https://patchwork.freedesktop.org/patch/588528/?series=132229&rev=1
> > > > >
> > > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > > Co-developed-by: Niranjana Vishwanathapura
> > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > Signed-off-by: Niranjana Vishwanathapura
> > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_svm.h         |   2 +
> > > > > >  drivers/gpu/drm/xe/xe_svm_migrate.c | 115
> > > > > ++++++++++++++++++++++++++++
> > > > >
> > > > > Same comment on file structure throughout the series apply here too.
> > > > >
> > > > > >  2 files changed, 117 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > index c9e4239c44b4..18ce2e3757c5 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > @@ -83,4 +83,6 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> > > > > >  void xe_devm_free_blocks(struct list_head *blocks);
> > > > > >  void xe_devm_page_free(struct page *page);
> > > > > >  vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> > > > > > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm, struct xe_vma
> > > *vma,
> > > > > > +							struct xe_tile *tile);
> > > > > >  #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > > b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > > > index 0db831af098e..ab8dd1f58aa4 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > > > @@ -220,3 +220,118 @@ vm_fault_t xe_svm_migrate_to_sram(struct
> > > > > vm_fault *vmf)
> > > > > >  	kvfree(buf);
> > > > > >  	return 0;
> > > > > >  }
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_svm_migrate_vma_to_vram() - migrate backing store of a vma
> > > to
> > > > > vram
> > > > > > + * Must be called with mmap_read_lock held.
> > > > > > + * @vm: the vm that the vma belongs to
> > > > > > + * @vma: the vma to migrate.
> > > > > > + * @tile: the destination tile which holds the new backing store of the
> > > range
> > > > > > + *
> > > > > > + * Returns: negative errno on faiure, 0 on success
> > > > > > + */
> > > > > > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm,
> > > > > > +							struct xe_vma *vma,
> > > > > > +							struct xe_tile *tile)
> > > > > > +{
> > > > > > +	struct mm_struct *mm = vm->mm;
> > > > > > +	unsigned long start = xe_vma_start(vma);
> > > > > > +	unsigned long end = xe_vma_end(vma);
> > > > > > +	unsigned long npages = (end - start) >> PAGE_SHIFT;
> > > > > > +	struct xe_mem_region *mr = &tile->mem.vram;
> > > > > > +	struct vm_area_struct *vas;
> > > > > > +
> > > > > > +	struct migrate_vma migrate = {
> > > > > > +		.start		= start,
> > > > > > +		.end		= end,
> > > > > > +		.pgmap_owner	= tile->xe,
> > > > >
> > > > > Again helper to assign owner.
> > > > >
> > > > > > +		.flags          = MIGRATE_VMA_SELECT_SYSTEM,
> > > > > > +	};
> > > > > > +	struct device *dev = tile->xe->drm.dev;
> > > > > > +	dma_addr_t *src_dma_addr;
> > > > > > +	struct dma_fence *fence;
> > > > > > +	struct page *src_page;
> > > > > > +	LIST_HEAD(blocks);
> > > > > > +	int ret = 0, i;
> > > > > > +	u64 dst_dpa;
> > > > > > +	void *buf;
> > > > > > +
> > > > > > +	mmap_assert_locked(mm);
> > > > >
> > > > > This mmap_assert_locked is ambiguous, we should make it clear if this
> > > > > read or write locked. Doesn't it have to be write to do the migrate
> > > > > pages?
> > > >
> > > > I followed hmm document (Documents/mm/hmm.rst), see section
> > > "Migration to and from device memory". It explicitly write a read_lock in this
> > > document.
> > > >
> > > > I believe a read_lock is enough for the
> > > migrate_vma_setup/migrate_vma_finalize().
> > > >
> > > > As I understand it, the mm.mmap_lock protect the process's address space.
> > > When we modify process's address space such as mmap/munmap, we need
> > > to hold a write mode lock; if we only read process's address space, such as in
> > > the migrate_vma_setup/finalize, or in the cpu page fault handler case, we
> > > only need a read mode lock.
> > > >
> > > > I also cross checked amd driver. They also use a read lock.. see function
> > > svm_range_restore_pages in kfd_svm.c....
> > > >
> > > 
> > > Yea, I see that too. Trying to figure out the locking, IMO the locking
> > > document might actually be wrong, or the very least the locking design
> > > is very ill-conceived. We can discuss internally a bit before I
> > > publically share my grievances.
> > > 
> > > >
> > > > >
> > > > > A larger question about the locking... The CPU fault handler holds the
> > > > > mmap lock in write mode, right?
> > > >
> > > > No. since cpu fault handler doesn't modify process address space, instead it
> > > only fill up cpu page table for some valid address range, a read lock is enough.
> > > >
> > > 
> > > Ah, yes after digging around a bit I see this.
> > > 
> > > > >
> > > > > I'm asking as basically I think at least initially we want to hold the
> > > > > mmap lock in a way that the GPU handler and CPU handler do not race.
> > > > > i.e. From fault userptr create in GPU fault handler to issuing the bind
> > > > > we prevent the CPU fault handler from running.
> > > >
> > > > Yes we hold mmap_read_lock in both cpu and gpu fault handler to avoid
> > > that race.
> > > >
> > > 
> > > That's not how rw lock work. 2 threads can both hold the read lock in
> > > parallel (shared read access), only 1 thread hold the write lock
> > > (exclusive write access, no one can hold read lock either). Thus my
> > > concern about the cpu and gpu fault handler running in parallel and the
> > > larger locking design questions. Again we can talk through this in
> > > detail internally a bit.
> > > 
> > 
> > 
> > It is a great question of the gpu/cpu handler race. Obviously my above thinking is wrong. Here is my new understanding: 
> > 
> > think about this scenario: address backing store is in vram - cpu access - cpu fault- migrate_vma_setup - invalidate gpu pt  - gpu access same address - gpu fault - migrate_vma_setup triggered by gpu fault - this read back pfn of vram backing store because cpu fault is not finished/migrate_vma_finalized is not called yet, but since gpu side would only migrate memory in sram, so migrate_vma_setup from gpu side wouldn't return any valid pfn to migrate and gpu page fault handler would return successfully and gpu hw execution is resumed but immediately trigger another gpu page fault, until cpu side migration is done. 
> >
> 
> This is hard to follow, especially given your comments drop wrap at 80
> lines or so. Please use an email client which wraps. I don't think you
> reasoning is right.
> 
> I have worked this out and landed on HMM locking documentation is wrong
> or at least doesn't work unless a notifier is installed upon every GPU
> fault. Bascially the GPU handler takes mmap lock in write mode to work
> around this (a notifier installation takes mmap in write mode which is
> why I reasoned HMM lock doc suggestion works in some cases). Longterm
> will need some depth though about to fix this. It might be an extra
> MMU invalidation event upon migrate_vma_finalize or somethig... Again
> see my PoC, it has comments in the code explaining this.
> 
> > 
> > Similar when gpu fault happens during the other stage of cpu fault handler. Same thing when CPU fault handler interrupt a gpu fault handler.
> > 
> > This seems work to me but we need to test it out. We will add a test case for this race condition. @Bommu, Krishnaiah fyi.
> >
> 
> I have a test for this, see race sections in [1].
> 
> [1] https://patchwork.freedesktop.org/series/133846/
>  
> > > > In user mmap/munmap (such as kernel function vm_munmap), we hold a
> > > mmap_write_lock which prevent it racing with cpu and gpu fault handler.
> > > >
> > > >
> > > > >
> > > > > I'm having issues figuring out how to prevent races between initial
> > > > > binds of userptrs and userptr invalidates on faulting VMs. This race is
> > > > > seen any xe_exec_fault_mode for example... So preventing races
> > > between
> > > > > CPU / GPU fault handler with the mmap probably is a good idea initially.
> > > > > Likely can make the locking finer grained once this is all working and I
> > > > > figure out how to handle this race better.
> > > >
> > > >
> > > > I don't quite follow here.
> > > >
> > > > Initial bind of user ptr... if you meant the bind in gpu page fault handler,
> > > then the racing with invalidation is roughly like below:
> > > > Invalidation is called with mmap_write_lock
> > > 
> > > Is it? If the notifer does the invalidation via migrate_vma_setup in the
> > > CPU fault handler we established about that only the mmap_read_lock is
> > > held.
> > 
> > Yes the cpu fault triggered migrate-vma-setup/invalidation only hold read_lock. 
> > 
> > It was the munmap triggered invalidation in my mind. For this case, we hold mmap_write_lock during invalidation, so it is mutual exclusive with gpu triggered migration.
> > 
> > But a cpu fault triggered invalidation can proceed during gpu fault triggered migration. As explained above, it cause extra gpu page table invalidation which is just fine because the consequence is just extra gpu page fault (and later migration). So functionally I don't see a problem of this scheme.
> > 
> > The main reason we hold a read lock in gpu fault handler is, gpu fault handler doesn't modify process address space, rather it only traverse the cpu page table.
> >
> 
> Again not following, but quite sure your understand is not correct. See
> above.
>  
> > > 
> > > > In userptr_pin_page, we hold a mmap_read_lock, so we know during pin
> > > page, invalidation is excluded.
> > > 
> > > Nope, see above invalidation can happen when userptr_pin_page is
> > > executing because of the read lock. The seqno check (described below) is
> > > what prevents programming of bad page tables.
> > 
> > You are right.
> > 
> > 
> > > 
> > > > After pin, before programming gpu page table, we check whether there is
> > > invalidation happen *after last pin but before programming page table*, if
> > > that happened, we retry
> > > >
> > > 
> > > Yes, that is how it works on tip but I am refactoring it in [1]. I was
> > > trying to avoid the retry loop by turning PDE/PTE writes into clears if an
> > > invalidation happened but not sure if that works without a larger
> > > refactor due to nature PDEs being shared. I may need the retry loop but
> > > that also gets tricky with array of binds... A few options here and will
> > > land a on solution once [2] is merged.
> > 
> > I discussed this retry loop (I refer to the retry loop in xe-pt-userptr-pre-commit function before your change)with Thomas some time ago. I agree the retry loop scheme work
> > 
> > But to me other scheme without loop also work. As long as we have a retry check before programming gpu page table, it is fine to me. 
> > 
> > If you have further fix in this area, I will keep watching and pick it. 
> >
> 
> I have this properly fixed now in [2]. Faulting VMs will return with
> -EAGAIN if the seqno check fails in a bind. If will be up to the page
> fault handler to retry. In the case of user binds, this so race I
> currently am just kicking the -EAGAIN to userpace to retry. I could
> change the later if people disagre and retry in the kernel too.
> 
> [2] https://patchwork.freedesktop.org/series/133034/.
>  
> > > 
> > > Regardless my point here is still valid - it may not be the worst idea
> > > when getting this code initially up and running just to grab
> > > mmap_write_lock in GPU fault handler as a BLK (big kernel lock) to
> > > prevent all races. Once the code is stable and stress testing in place,
> > > switch to finer grained locking as define in HMM document (or newly
> > > defined if we fine locking design is insufficient).
> > 
> > As explained, I will keep the read-lock for now. And we will test it. If we do run into race condition, I will try write-lock and come back.
> >
> 
> See above, you will hit a race.
> 

Hmm, I'm thinking now and some of the races might actually be avoidable
'page grainularity' migration... You'd have to play around with this but
my initial thought is probably at least helps, if not out rights fixes
the races.

Matt

> I strongly suggest you checkout my working PoC and IGT and play around
> with that code. If you change from write lock to read lock in GPU
> handler around VRAM migration and hmm range fault, the 'race' sections
> fail.
> 
> Matt
>  
> > Thanks a lot for the great questions Matt! It is very helpful!
> > 
> > 
> > Oak
> > 
> > > 
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/series/125608/
> > > [2] https://patchwork.freedesktop.org/series/132246/
> > > 
> > > >
> > > >
> > > > Oak
> > > >
> > > > >
> > > > > > +
> > > > > > +	vas = find_vma_intersection(mm, start, start + 4);
> > > > >
> > > > > find_vma should work fine here.
> > > > >
> > > > > > +	if (!vas)
> > > > > > +		return -ENOENT;
> > > > > > +
> > > > > > +	migrate.vma = vas;
> > > > > > +	buf = kvcalloc(npages, 2* sizeof(*migrate.src) +
> > > sizeof(*src_dma_addr),
> > > > > > +					GFP_KERNEL);
> > > > > > +	if(!buf)
> > > > > > +		return -ENOMEM;
> > > > > > +	migrate.src = buf;
> > > > > > +	migrate.dst = migrate.src + npages;
> > > > > > +	src_dma_addr = (dma_addr_t *) (migrate.dst + npages);
> > > > > > +	ret = xe_devm_alloc_pages(tile, npages, &blocks, migrate.dst);
> > > > >
> > > > > Again as I discussed in [3] I think this should be broken out into a
> > > > > different step with the blocks allocated before this, and here just
> > > > > populate migrate.dst from the existing blocks.
> > > > >
> > > > > [3]
> > > https://patchwork.freedesktop.org/patch/588523/?series=132229&rev=1
> > > > >
> > > > > > +	if (ret)
> > > > > > +		goto kfree_buf;
> > > > > > +
> > > > > > +	ret = migrate_vma_setup(&migrate);
> > > > > > +	if (ret) {
> > > > > > +		drm_err(&tile->xe->drm, "vma setup returned %d for range
> > > > > [%lx - %lx]\n",
> > > > > > +				ret, start, end);
> > > > > > +		goto free_dst_pages;
> > > > > > +	}
> > > > > > +
> > > > > > +	/**FIXME: partial migration of a range print a warning for now.
> > > > > > +	 * If this message is printed, we need to split xe_vma as we
> > > > > > +	 * don't support a mixture placement of one vma
> > > > > > +	 */
> > > > > > +	if (migrate.cpages != npages)
> > > > > > +		drm_warn(&tile->xe->drm, "Partial migration for range [%lx -
> > > > >  %lx], range is %ld pages, migrate only %ld pages\n",
> > > > > > +				start, end, npages, migrate.cpages);
> > > > >
> > > > > As discussed above, we shouldn't support this. We should fall back to
> > > > > smaller xe_vma chunk size until we find one that works or simply leave
> > > > > the pages in sram and map those pages to GPU.
> > > > >
> > > > > > +
> > > > > > +	/**Migrate page by page for now.
> > > > > > +	 * Both source pages and destination pages can physically not
> > > > > contiguous,
> > > > > > +	 * there is no good way to migrate multiple pages per blitter
> > > command.
> > > > > > +	 */
> > > > >
> > > > > Touched on this a bunch throughout the series, lets do better than a
> > > > > page a time migration.
> > > > >
> > > > > Algorithm should be very similar to what I discussed here [4] but with a
> > > > > few key differences.
> > > > >
> > > > > - I think the sram pages can be unpopulated (page == NULL) if the user
> > > > >   has not yet touched the page
> > > > > - Also I think the MIGRATE_PFN_MIGRATE bit being clear is valid
> > > > >
> > > > > In these cases this indicate we have to issue a copy for the pages we
> > > > > are accumulating with contigous vram addresses.
> > > > >
> > > > > [4]
> > > https://patchwork.freedesktop.org/patch/588526/?series=132229&rev=1
> > > > >
> > > > > > +	for (i = 0; i < npages; i++) {
> > > > > > +		src_page = migrate_pfn_to_page(migrate.src[i]);
> > > > > > +		if (unlikely(!src_page || !(migrate.src[i] &
> > > > > MIGRATE_PFN_MIGRATE)))
> > > > >
> > > > > Discussed this in the CPU fault patch, once we call migrate_vma_setup,
> > > > > on subsequent errors we need to call migrate_vma_finalize to revert the
> > > > > pages to the original state. At least I think if I am reading the doc
> > > > > after this correctly.
> > > > >
> > > > > Here on error we just free the pages...
> > > > >
> > > > > Matt
> > > > >
> > > > > > +			goto free_dst_page;
> > > > > > +
> > > > > > +		xe_assert(tile->xe, !is_zone_device_page(src_page));
> > > > > > +		src_dma_addr[i] = dma_map_page(dev, src_page, 0,
> > > > > PAGE_SIZE, DMA_TO_DEVICE);
> > > > > > +		if (unlikely(dma_mapping_error(dev, src_dma_addr[i]))) {
> > > > > > +			drm_warn(&tile->xe->drm, "dma map error for host
> > > > > pfn %lx\n", migrate.src[i]);
> > > > > > +			goto free_dst_page;
> > > > > > +		}
> > > > > > +		dst_dpa = xe_mem_region_pfn_to_dpa(mr, migrate.dst[i]);
> > > > > > +		fence = xe_migrate_pa(tile->migrate, src_dma_addr[i], false,
> > > > > > +				dst_dpa, true, PAGE_SIZE);
> > > > > > +		if (IS_ERR(fence)) {
> > > > > > +			drm_warn(&tile->xe->drm, "migrate host page
> > > > > (pfn: %lx) to vram failed\n",
> > > > > > +					migrate.src[i]);
> > > > > > +			/**Migration is best effort. Even we failed here, we
> > > > > continue*/
> > > > > > +			goto free_dst_page;
> > > > > > +		}
> > > > > > +		/**FIXME: Use the first migration's out fence as the second
> > > > > migration's input fence,
> > > > > > +		 * and so on. Only wait the out fence of last migration?
> > > > > > +		 */
> > > > > > +		dma_fence_wait(fence, false);
> > > > > > +		dma_fence_put(fence);
> > > > > > +free_dst_page:
> > > > > > +		xe_devm_page_free(pfn_to_page(migrate.dst[i]));
> > > > > > +	}
> > > > > > +
> > > > > > +	for (i = 0; i < npages; i++)
> > > > > > +		if (!(dma_mapping_error(dev, src_dma_addr[i])))
> > > > > > +			dma_unmap_page(dev, src_dma_addr[i], PAGE_SIZE,
> > > > > DMA_TO_DEVICE);
> > > > > > +
> > > > > > +	migrate_vma_pages(&migrate);
> > > > > > +	migrate_vma_finalize(&migrate);
> > > > > > +free_dst_pages:
> > > > > > +	if (ret)
> > > > > > +		xe_devm_free_blocks(&blocks);
> > > > > > +kfree_buf:
> > > > > > +	kfree(buf);
> > > > > > +	return ret;
> > > > > > +}
> > > > > > --
> > > > > > 2.26.3
> > > > > >
