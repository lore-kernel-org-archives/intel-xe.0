Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2DCC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 16:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7691110EBEC;
	Fri,  7 Mar 2025 16:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0cSUsSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C4010EBEF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741365449; x=1772901449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=87GeKM/4lG3oIXgQWijqZuL3OERU0q7qK114mNF8OfI=;
 b=W0cSUsSptris6AMgq7GrWSB0fki1K/t7HyHsoSHKPotUmTPOF0ua4OrG
 wOgyyoBCVElOz7dX/fQ2aFyDgFkbHO0K+OKe5Cs7No8od7LzVWpcJnzc3
 BetJYzAhH6EcyoUHL6c/vDD09an5ZC57iwgGpJfDJ5liIW4cQdMRbTc6d
 Cw6sMF64uO7+ud33PuYFh6tLBPqa8O3sgNNYT1SaxLk9J17xv6hMX35fZ
 dYl0RfZ5JMbzmP/07ernscujF/6rU2rVlLdgeES6oeIkl95A1GzAHm310
 /80qPHeXFyUuAt//2jaCfBfdZ5JKv8EImeRHGBfqNNjGtLwOnetLO+0IM g==;
X-CSE-ConnectionGUID: k8s3clsDSACUYbSTmNAGqg==
X-CSE-MsgGUID: yy+Bnw4RRH6q5OqCKdpXoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46344112"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="46344112"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 08:37:28 -0800
X-CSE-ConnectionGUID: rhWe1yGnRH20GvbFNkVOFQ==
X-CSE-MsgGUID: 63bvwS5FQHuhQ//9fs6vUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124596766"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 08:37:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 08:37:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 08:37:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 08:37:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHaTItKg2TcubHTSRw688OIU/9LjAA954SRghLbPM+Lssr7Ou/CIXTU276hrV0DBEVCpGUwFpHQ/iE63CysT/98qr6VOuvXNJOtu+Sx9OH14SPOWwJ2n9rEw5PhmXESEzekY7ge8aRDuYrN0dWsIoQnoLS8ARXCLxxjscErBxRJN/SsdUBkHgz+r2/APiXl1cwyELeNnSmVr5g3CNV2KTLH/7pgroafXW2VWa3Eqeg2RGxjW9y6OnwZMZrPMcLz+i/MXn1VIwI9GG/nnbk82mX5gs2XMTUthhHJ0KCDue+3UgvVZmc9L7n+MngHCMbomeg0orhC/FI5cT0Mzn6Cypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGtIN+na00gxmFcED/AHiP/G1j9D0he8b9IRXWM0lD4=;
 b=PGnn4XQrHLZz9fnxFoKIHci2yp8y5sPf2n8lv+AbVKyHzZavRBNOMqXNYcZEpGUFKhehEGpbilgJbus67iBlaCDyT0pcCtqSu0FbqeFhC9TMlPNWsqZOFTbk742Ey74BlHDW3uKpN9Ta7Oyg2LEpmdlYhrtkDH/7HVGhiSda9W7Fh9v/qxJH/Jbm4uPBqqx2MNnQEYaNhPnXc/IQ2x8I0GNc1Rwp7iiUccf1AzuJTo1ZMDELWyTD+qkwaLk3zE22M2A14yUH+kkduO6aASXfRDSwQlwYiQ6LTcLro/qNrVAlRzgSfa+/sDMEONJEJ2z/2TBidmUmmmG6sD3rFnJ1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 16:37:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 16:37:24 +0000
Date: Fri, 7 Mar 2025 10:37:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Message-ID: <a3katq6p43gfiuoibpmoxpl6syocu3itqrzoyjezyyr73fydtb@2yqiydazcwea>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
 <20250306-drop-gen-v1-2-03683e56006a@intel.com>
 <SJ1PR11MB62041E43EAF79D2F89F0F40081D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62041E43EAF79D2F89F0F40081D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: c150f076-5d9d-48ab-10f7-08dd5d9656d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uKFeLh3QmCgfWLOUqYNLstxYOpe1oxvGkdwzJs+Rl/JfHVAFwkTGvVyJh/6A?=
 =?us-ascii?Q?3rN9YG9fPjWTGk6PqNiR9W8b/yefUYRHaXv/VoCGThPtgeIvnpjM3f/ms8ye?=
 =?us-ascii?Q?EcwjrbwKK252KsxZz0fpNLNEBsjrGcQPrrx1P/Zb6iR5Gml0FiypnBJViIYj?=
 =?us-ascii?Q?zRoVPjBw08MfbK81eiX3LMj9uhK72Zv2nYvqPPuDUR4+ppQy3vrJT7Pdbwuv?=
 =?us-ascii?Q?Fwpqr5jS6XBFE7jDeEDMbOAtNkhYK/PDHjkExw8SlfJJMB5fNmyH5kAZR1ha?=
 =?us-ascii?Q?74NvwczBORPOi5yOdJ05xpfETnXFN8vXp+JdrRQieR6T3LNRAsHUuaZ24DUV?=
 =?us-ascii?Q?RKUF0T2Qscd2SVUNcYpdIeXSwAil+a2Wid+01jPveXtnMkvt8QLg7tVM5fJM?=
 =?us-ascii?Q?ix1c5CLSCxeJy/HiarEhuf/gq7FUcM87+8GmGcDuhAdM4x2fan7Vw5ycwho3?=
 =?us-ascii?Q?zXwolBdD9Eai8DeDqP9zBfWT+aoIXturcvuXa0gcch3G07TwhosfWOSCPp9a?=
 =?us-ascii?Q?OJbKcF5afzgB9xFObBNVzhLi4kKaMwG2Ss3G4bh3lq3gN7+iRAvA9BBOSL2G?=
 =?us-ascii?Q?gxcsW5fyxnOnh/7wr5N8jqhJOFgCccogriJAMdQvotOSz1SDklyiCniB8Oir?=
 =?us-ascii?Q?ovY/upvavcSQf3QhZTcd4Cv1aeLwc7RrUIBbW635KeAh6wmClDiuQ1POSPXw?=
 =?us-ascii?Q?t1IM9ncgAhCUTDCRphrRM7Tprlefb/gacLoGRb2y9Z/yLEZOn81ojZ2Dp+ix?=
 =?us-ascii?Q?KIONCWSXVodaw44Nlezco/3vrCvod/ErBqhbV0HvHZ+8xkqLSssunk8P7lW7?=
 =?us-ascii?Q?Di2OeRViT5a8p384c5bzMUgohS8AKEc8+siFf4KuTCg+UMBwp4wlaeftHMYF?=
 =?us-ascii?Q?axjCAshPhRjM1ikG5VVwvxCQQip1LHc+5dKSkKXkOquAjBr5HxsAERtZ8ksC?=
 =?us-ascii?Q?C+FTHz2ZGKmyzWRc3RpBHbXd3L3Y3ShltuAif7PbgPbfHY7PtOA4erXbUOs5?=
 =?us-ascii?Q?QBwaTd1Ywg7lLnKxH5dGRGGy2kwNoN2rSB8SosvbB0X1de1nCGSgCmxxHJ2Y?=
 =?us-ascii?Q?7c1rOZyQNfWmCUVROIYdlgZVFxY+nH83Dz6Wi/2QXAiKws/hDjUS2Kt5hzKZ?=
 =?us-ascii?Q?hA16uBvxSwQ8AB9cyIcRYZPYOtSQ3/5T1GNmw2CwVLGKhJjrxLKKTiuAUlPj?=
 =?us-ascii?Q?4YsLhfRV9Ad1hsLaTEw5oPFws1ja3eV0wgmE0oBhAjpbbafqg3RjWFwTSvZq?=
 =?us-ascii?Q?I0mB5kNiLHnMNbqsSDAxEg5Uu/fKbMqi+H5A9s50m0euCpsjzhVjR8kbOSjb?=
 =?us-ascii?Q?Ttv23rhDD2aNYnp7YFJ3ZqHfsG5pSoZPbjZKD6oR04ZYz1InwiiQLHcJ9IXd?=
 =?us-ascii?Q?lUhYUVMaBRaG6w1KnqXzCy6/qxbn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sBycRZ61rZt5HceKXSlXBKwabB7gwY9JLuwuh+ZofLuF8Vt1Bl2kPcUTmwtj?=
 =?us-ascii?Q?P99HcYE5K+Z38657LctSCS6ryk9ZMMHvWgxNRh3y5fol7RH7hT+9LY67M5gE?=
 =?us-ascii?Q?YTO/Whs7Ktvs0Vfd26kw0uODKC/QI6Kzq1rTls29N8Ubl+oxTEVyadtlYemO?=
 =?us-ascii?Q?Bb4keYvFPR0fz9a3fZGNN42sCGyTgoYvNtw89iaSOsdasV5x251M/OGMdi0E?=
 =?us-ascii?Q?x3ImwfKKhGuSzvfifCbxeWOSD7Xrry3i0HeJSq58k0HoKb0clCtk2vVjp0HY?=
 =?us-ascii?Q?wPGmQHoP33ZF/wOUK81aUaRf6BP7GwagcACov2vgHBHujHwiR0EbXBpoIL9b?=
 =?us-ascii?Q?9g9k96kFHeLlf0IC0jIwTJv+9c4SQUJ2CrKuvjFWfdINORteN1GVxUAccKFu?=
 =?us-ascii?Q?nwZdNQ7LfGl4bh097QxY6r+qtU9k1HGoT9XiUN9VxGLndb8FRn6EWj9iNfY2?=
 =?us-ascii?Q?3tFlzuieGI+xnKL6bqXEZLLN0xzKe0k5n2PbAMqG0BtTsdtnPLHbRkIb3zbH?=
 =?us-ascii?Q?4nhihjwHR9aX/e7dz6o3n6O8C85EzQRJ0UlBlGRXlwDBAyPSFSaAidSNBguy?=
 =?us-ascii?Q?rqV91C8WyEm+7vhr9+jmUkF3+chdVE6hydIVbo9QQEXJmzhTgH67kH0hfXOf?=
 =?us-ascii?Q?SxJzvDaX922+HOwmLFA3tUZXtZTrHkUXN+zQitHvtKMQktMnah/Jv3+DiusS?=
 =?us-ascii?Q?lL1tc9CW3woWRL9qZgwbejJFECUT1VP1os6MXM6zpV7CUJtLFomrvhtY8kuW?=
 =?us-ascii?Q?ovWYePHmEgQsgsdWY2mGuW8b4wfcoLDDZNktwoTPQfLT/dfL1L0wgmlSJctB?=
 =?us-ascii?Q?3AnzF8ZiBbWC9JokbkDWjzAZCqfKLHOACEil9895QMg4J4Cc5okwkBVZQRKk?=
 =?us-ascii?Q?oY75J2JWpnLI1Sko5mzsVDIzPdQVmO9bugONroKiETOY1H7XUjulL8K6Cbne?=
 =?us-ascii?Q?VeBzAQLBGGmzyHkGBVLgEx0WYgryyBFCtLUzgWJmHFUKzcE179ZWbHy/YTYl?=
 =?us-ascii?Q?n3heEHvZXpn8yjgLYxFS7//5sL1NiwKw2BCcP0Lnw9F3keGYIOKZ8CNoiTx5?=
 =?us-ascii?Q?RYgWY1RAt5/OndhTauVlTgjFW7Ww3BV14DfPSAHwdSvl2mX9PYnSO8U/efGh?=
 =?us-ascii?Q?Jqqy2hptz0TOmVRyaDonYy2e7v4svoXniIe2YtBmrIOAtB78yh3B+I/t7+St?=
 =?us-ascii?Q?QdLeMVKMqI58GjabF22mzUnjjJ3f+Eg6qzqjtSTCQIlcxVH0tFU83LWSbZsp?=
 =?us-ascii?Q?2jPyMGBT9CMeqkIFSDnI8O+hqGMd500JDzVzWxlZ9K0oCjcXMH1S6wAPIffi?=
 =?us-ascii?Q?pmBesEgLPeo5kSivt5DLKUOVn2hS29TH/jGCeeJTKmnC8t/toC4i+gEAkYqH?=
 =?us-ascii?Q?jzJ4jDWJuCfgZ5FPGE1mHyEawKdQzZxOBMdTyDpEtgNAY+CeyH40xazl6vql?=
 =?us-ascii?Q?DwhoZNXDdaXsmSuKEmjLWk9TnXZDl1IDiFqfVgE70gHhQKGZkF9QyQml4lbF?=
 =?us-ascii?Q?YRhavKc2qzmeaLCcIOdK5YPR2PYwJGjw7lPqrv0PhaMyo0yiaOE4Gzj6lRAB?=
 =?us-ascii?Q?l4Pg0KSDVKyYE+rPp6MLDaLzGCKfCWcw9E2z5w9wAlVuOumxoSgxyCGHXikm?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c150f076-5d9d-48ab-10f7-08dd5d9656d3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:37:24.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27TtMEu9xGqSp3qoZrrNZx8EUiB5F14EbVBnOdoXKRrPtBmf57T1GqnieJ+pbbKQVWOkk9ty+o5iuUwlc4MHS3x4uCNlJ/5av2w6aLgogPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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

On Fri, Mar 07, 2025 at 12:19:21PM +0000, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas
>> De Marchi
>> Sent: Friday, March 7, 2025 3:38 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Subject: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
>>
>> The registers are already named without the GEN11 prefix. Do the same in the
>> memirq documentation.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_memirq.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_memirq.c
>> b/drivers/gpu/drm/xe/xe_memirq.c index
>> 404fa2a456d5870837fce225b5150398733d1e98..49c45ec3e83caf9aeff279
>> 912b80a0b109bc4a94 100644
>> --- a/drivers/gpu/drm/xe/xe_memirq.c
>> +++ b/drivers/gpu/drm/xe/xe_memirq.c
>> @@ -86,7 +86,7 @@ static const char *guc_name(struct xe_guc *guc)
>>   *   This object needs to be 4KiB aligned.
>>   *
>>   * - _`Interrupt Source Report Page`: this is the equivalent of the
>> - *   GEN11_GT_INTR_DWx registers, with each bit in those registers being
>> + *   GT_INTR_DWx registers, with each bit in those registers being
>>   *   mapped to a byte here. The offsets are the same, just bytes instead
>>   *   of bits. This object needs to be cacheline aligned.
>
>commit 6b7ece97dd21d2b80a41f6192f89f8848c3b1d76
>Author: Matt Roper <matthew.d.roper@intel.com>
>Date:   Fri Mar 31 17:21:02 2023 -0700
>
>    drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes
>
>This commit does same but probably missed in some documentations. Should we add Fixes tag?

There wasn't xe_memirq.c in that commit:

$ git show 6b7ece97dd21d2b80a41f6192f89f8848c3b1d76:drivers/gpu/drm/xe/xe_memirq.c
fatal: path 'drivers/gpu/drm/xe/xe_memirq.c' exists on disk, but not in '6b7ece97dd21d2b80a41f6192f89f8848c3b1d76'

... it would be in the commit that introduced this file,
commit a6581ebe7685 ("drm/xe/vf: Introduce Memory Based Interrupts Handler").
However this typo fix is not critical to propagate to any previous
version so we can keep it out.

thanks
Lucas De Marchi

>
>However, LGTM,
>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
>Tejas
>>   *
>>
>> --
>> 2.48.1
