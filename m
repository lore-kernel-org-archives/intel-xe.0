Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F44EC5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 16:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0908610E0E6;
	Tue, 10 Jun 2025 16:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uk3OpGDF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13D210E0E6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749574464; x=1781110464;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yMiCErxibCKYBLaSXghg7J6WEFWDsRBvtAMotwzbqyY=;
 b=Uk3OpGDFLgn+mytnq3D/e9eBkfz3cEJklMktm2rwtuXoZUDB+8cnWvfC
 rcB4I3H8UaQsAMGvr9GBfjdEOSyN/R3sX5jkJIp8t4eUhcVOajZrbJ8cj
 MwT2Gb5CvvABpAC/qhnveRgwsDEy6stovTv0xdn+Da4E66si4t/peWUqG
 dEzQg9TRmYSmCWhBHQC2lu0I+1J0RxjMGiJNr/x/eaD/x/n4R0ODtTXrU
 rwDnK2AEcnN/moJx7RvHJSGzuU6OBY38f6BbWJseGvmqwHVCgAfA/N2bN
 H0QCXQL1CQvGuGta4jC86rYMxtHhpzr+OBpt6Ifqv/Tc9fIs8ZoJu3/pC g==;
X-CSE-ConnectionGUID: jf7KbIf2T3We7Yy5tRkGQA==
X-CSE-MsgGUID: Ta9VZQ3cQlOs7mqxh5A9cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51836851"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51836851"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 09:54:22 -0700
X-CSE-ConnectionGUID: 89w+GuTbSFyK+NQQDVMa3g==
X-CSE-MsgGUID: XUou1tpfQUKsysFxm017nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="151886111"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 09:54:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 09:54:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 09:54:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 09:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ul4sOlI1P5S2vSMTqUKnbaaILJMKGgq2sevtLVTeeAz+1xrYYVSKtiK3hhamxu3ZPkxDytynJ0WQvtVVW6Jk0sF9aw1PlulG+70ZBHIJcIcRJPdVkBU0fd8WtPJcpNbmwF3P+8ifR8a5q5yaxwxJGj8vXvRXpwf4k5V0cwLbI3FTBPk/QDBY/rlDFpub54s2jjTAd5XmcfkNH6UEiUnvSEJnioSkMAsl6JbiqIzLBWL/pzbyi/jwiwLc3SM9voEfEQi8SllFteBL3MPLbVp8mhIm6waqh+H1XV7DgIJbzu/iuufkcR3+wtjQ3ek/3VxOn8utS1+ywcmmn6sqojSmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO1x0lyMHZtERRDaFs6WtbtKz68W0lzoggO4aJl/VaU=;
 b=X/SqsyUmsRLc4CtVovPV7w5Uwb+LkAHleiO6mzwvETiy4s/dWZDhn/LCHNfGjjUs3vzsN0frIPmbK3y2LJEpGbyojsNgz42vYj7j0aqfICl9Y1mPqaxtIYRPTKmnr9QMDumd2p0MY25FqZWKhbdyPB3zUBQYGH0IM4nCG8CqGhIw+hnEkjUkM1gwlED0WZ1FYvQRoFRxz0Vrq3TOqPZ7t15+I7D5Ar5S7ifGly4s/OyWya0bTKXfHZOclV8fMQTtpVk1JeTJQuqa76SVYUeqjuy2nRD0+4o0EYxdmVQnjDIzbqrrtDmS2QHPSkNBFC9mW3kSQhOeuV7JK1A2usjzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 16:54:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 16:54:00 +0000
Date: Tue, 10 Jun 2025 09:53:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
CC: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Message-ID: <20250610165357.GO6239@mdroper-desk1.amr.corp.intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-9-dnyaneshwar.bhadane@intel.com>
 <20250609150527.GL6239@mdroper-desk1.amr.corp.intel.com>
 <IA1PR11MB62668338EF7E973EBC4AB446E26AA@IA1PR11MB6266.namprd11.prod.outlook.com>
 <20250610151309.GS5080@mdroper-desk1.amr.corp.intel.com>
 <6925754dbc7e5feb99c98adf30b2354b9cc78eaa.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6925754dbc7e5feb99c98adf30b2354b9cc78eaa.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5ec2a1-77ac-4d01-6197-08dda83f65a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cAbwTJkz9GRz1mP1NIdzqVsp6+weO5lY1jb7FqND/FfB2Igp1FCuzYlso8?=
 =?iso-8859-1?Q?6RGD6grBjvgms1bpRQrCgMt6IfX1k57sTEuDxL2KVwN0P+CbsPmZhNJEY9?=
 =?iso-8859-1?Q?R6stw8HUyiZk4rmnfEKqeobTbeNvxmcTrAmq9QD1KVVI5n8usxdIcDOrUj?=
 =?iso-8859-1?Q?bEE2Xwb5oALesZL+nm3+9zsv7hY1IfGUScS2nwBRPmb3Wu59dtdEoleDaT?=
 =?iso-8859-1?Q?yb5bL8UYcKDVjq/9wThEOnM1ugbPlqfLq1trV5syHaDD8UrA4tZAfe8BZf?=
 =?iso-8859-1?Q?eD5oKwCoHLCcNHPKCXZlt06eTpwU7a0MJHYP6W+FQGUffNuOJYN8lJsYSw?=
 =?iso-8859-1?Q?CAjAt2P5KGU38wyPEIYNltVO5QcRxVXUYOQsy3r7gMS7Ziq8nGQFL1Fn0T?=
 =?iso-8859-1?Q?K03xJ8pVNzzb1+O6sZlMHS2BHj3cRzZQHYgTW4wK54WChEq5J7Co138JCj?=
 =?iso-8859-1?Q?2dcz4kzsn4/xx2tTwrxJzh0HEkaCQP9HCMkcZH484cuu0cqeeTd5T0ES6+?=
 =?iso-8859-1?Q?N0JNZc7QfkeUkEU96QOIIFh4sk+b8g2N7EVErzvTweeEauA3JMZLB8Wc04?=
 =?iso-8859-1?Q?DbktF+pttAAMehhWzPBVGTlWRtYeQdgFoaLthNGzrWWacMDo66SYv2FLJr?=
 =?iso-8859-1?Q?lKIbe/s2XV6DiMTA8HkEPYY9bw4jU787LTbFT6FcNdZq55Zdvz669HC0JI?=
 =?iso-8859-1?Q?vWcvOENpa0qyBUyZuOI3MBXNBRDR9hdswaDIUi5ULu+aSBqbj14rDcaEbK?=
 =?iso-8859-1?Q?PxG+di0+vYcpnP5ntSrFBCDX5exwIca4LSklIaRK/s2IDH5AGW3np3AGw/?=
 =?iso-8859-1?Q?vdrc9W6gyNeSaXeCfv43DF1VFV6GGxVQGBq7JCoqgX3/iJNXBk/P8+a/Fs?=
 =?iso-8859-1?Q?Qe/srdRAK0WnacmKzMven8jeQvufkkpZWjg16zHkiwbrZePnYduW6iAO0K?=
 =?iso-8859-1?Q?cSbyJgZPjAhX537W7yJNYptWF6bWQ+JUVbW5R3EBuaMdMZ2NKXhLdNcy/6?=
 =?iso-8859-1?Q?yABOh+VIQRdxSkZRer6GziMGWqZNWswKHXw7p4vsmaQObP6P+Qyv/w6WzA?=
 =?iso-8859-1?Q?56l55UUiR8/fXHntbLVUmvwEwOaskgL4bX4lbRSS/YgkoTfBY4ZdQw/5wk?=
 =?iso-8859-1?Q?qhByAKQub5ysLJQ6F2L7nQC8v7XdBw435+XRDy45iZBLVcjVkWGPSX8Ksu?=
 =?iso-8859-1?Q?HLIcg4Si+FnIiXcEAFaJyJUch/qyNq0tsWn9PsiAuwaKvCCUe/1U2B8pS8?=
 =?iso-8859-1?Q?Tt8P1dgEKd7lva8JMK0dtZD88NmeGcbdJmXhMPLQhOCWTIPqljd3GqNDr6?=
 =?iso-8859-1?Q?pRHoeU2LLGpSYBDaYVFY6XH6WyqL+p8L/clNSKvB2UfFkcu3aRmnOqPUbX?=
 =?iso-8859-1?Q?pFMWcfchn21yR+KhAeTF9k1qr4oMWU4iiu1yMsyBNBq+WZG8IE9z3Ot52j?=
 =?iso-8859-1?Q?RKMUaEKUs3m+FbzyS+B0Q6EZC+7psXimoKzfJmLUNtyKTfyWTu91nOdDLU?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fwsvON895SPN/uFH6qK/43c/iuYHd+GRHE4OjWWUzepHwf3q4EEZwku2Ch?=
 =?iso-8859-1?Q?NpJHFEPuCmJoA0hAWNrTcSxF0BAMxw9OWWzbEMNPDTk3dKyaNo9Hl6hpie?=
 =?iso-8859-1?Q?1rwX5o74jsWiQDxlwvwy9LZZd+Dal00H7w8B7nEtP4qrFmZPPZfZjkvUVN?=
 =?iso-8859-1?Q?QgJmvJWCRB0GudjPCM+98fjS4MmGQadmgRH0My+qnwu/jkBdK5U3obc25R?=
 =?iso-8859-1?Q?z2627WEXFmrGEg7eQoRXTQ1x8D+8ocNZyRn/SfkTcDZwCyfax9a+K/sRtX?=
 =?iso-8859-1?Q?sIc6ekKj+MTSiO1P3gmRaqmbuUX4t8gyupij0RkwlLPbypqbl2FP+eyYvO?=
 =?iso-8859-1?Q?BopaTa5ygd1PZgRgOB7CaDyDoF3f+isJWR/+nMbvTGece/PzzCg9fe04ez?=
 =?iso-8859-1?Q?B54t4skMWciX2EVz9xH0IVRVcsGEJTRQrAjAttweyf3O8q13my6/BP6omA?=
 =?iso-8859-1?Q?2tWR3zrUgROhP+vp2gQTbPi8eMxlEu8bF0z5RTqx07FN4Z6Gm1ODAXdJk/?=
 =?iso-8859-1?Q?e/eBYLfhLa+W0ibBwrSdT+pOZFMl1fizXFpifou9ufFm8tYzuQYh+g7As8?=
 =?iso-8859-1?Q?DN5RZxdYIFJ1+eadptElUa78Sk0DLYd0Ek/zxfIWmKDbay9nMb2QjuJy8H?=
 =?iso-8859-1?Q?IEn/yLsnIX+voy3hJFIu9s85GFOV6QA7Vd6IN1zmfT/1J1S2uBWtovbGB9?=
 =?iso-8859-1?Q?Kv9WPsU4LJmjxk7DK4rUZcenjPqfP4IsS0Nf6jRb3w87p0tMcUbfREu1uL?=
 =?iso-8859-1?Q?KHcRRGQMGx2ePCn/AblOY0McHBJ4TgYbLIquwazsFALIzAyaqDbxAlft2i?=
 =?iso-8859-1?Q?84o9SrspA0YjMUYMpHIZXH9rghMFZ3kHLlCDdZILU/UvRxtnoHVvrNly5W?=
 =?iso-8859-1?Q?y5n90kBbXmTr3sXCbcZePOs9nurypJ/0sAxwGZML8tIbGl0eHSfrKrDwlC?=
 =?iso-8859-1?Q?cUq59th5L9WCRMHJhTlDRWtRrOVIFh+q1y7FR7ahg6EBB/zDwf+sHg+lCI?=
 =?iso-8859-1?Q?bn8TraUd5RH8+nJZGKbSmCqoB+GyXN39oaf1Pd5EXnp98sPpsYJRFnjzF0?=
 =?iso-8859-1?Q?8hbnpETcsSCo2cmifESmE408t+w57AtMDPYdWJA6LqXZTakaLAXB32RJZL?=
 =?iso-8859-1?Q?SzPNBeru0vMebdME+v6AWv/l1PDKvvBYTD/qJizrPMIwGN0UJ4EPxvddl0?=
 =?iso-8859-1?Q?w9p/N2/BzLectQFRzCPwBKzPu/6Y4BQcBTmPlCMNEYzSMxl1jNKOW7Vcto?=
 =?iso-8859-1?Q?alMSrGJlrX//IQTj1Rgz4irAKPm9Q642XdPefavFxGckO2FRVODOCHl1k1?=
 =?iso-8859-1?Q?vTmtX3Ne7RUBJls4UdL3B4tOXuakeosSzRW1Ss9AM/kd3ALc7Dn3IlMf2i?=
 =?iso-8859-1?Q?J1oTG5bkpymm5drvkiPAM5pDlVSVNIpsN1llFyzc7m7njNz91ENNMmp9vF?=
 =?iso-8859-1?Q?1CmfkPpqV0KYFOvOikgxX+SmiJB7MpCD3FuNsq9h3sVNv9u9q3hMUCq3Tr?=
 =?iso-8859-1?Q?rbYNd5kREBmCm559T6cx838iS/qW03EcnG2F4zW9XBTaPJbXLEvZNAN7fO?=
 =?iso-8859-1?Q?J8jSAJBVKu2OHTHM+rQZsnQuP115dW9jUPoBGgqMJnJYRuI5u/Be1/H2IT?=
 =?iso-8859-1?Q?BLiC9oIDsI9G+6HkdZKYj2vKj+HdQLalOrhw8/p2Aqg/c/bTobknO+FA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5ec2a1-77ac-4d01-6197-08dda83f65a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 16:53:59.9414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIaTapQ0zRd0yRZzxFS5Ozky/fKalg/K6/ziU6eBlYKAzTVdju9Qyy0P5EBFgG6ZjJJoFPktnQ5mG12OS8QFpzTuTmSiz4PAN/jf31juxn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Tue, Jun 10, 2025 at 09:31:51AM -0700, Taylor, Clinton A wrote:
> On Tue, 2025-06-10 at 08:13 -0700, Matt Roper wrote:
> > On Tue, Jun 10, 2025 at 06:49:01AM -0700, Bhadane, Dnyaneshwar wrote:
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > > Sent: Monday, June 9, 2025 8:35 PM
> > > > To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org
> > > > Subject: Re: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port
> > > > A and B
> > > > 
> > > > On Sat, Jun 07, 2025 at 01:21:03AM +0530, Dnyaneshwar Bhadane
> > > > wrote:
> > > > > WCL added a c10 phy connected to port B. PTL code is currently
> > > > > restricting c10 to phy_a only.
> > > > 
> > > > This seems like it's a characteristic of the platform rather than
> > > > the IP itself.  We
> > > > should probably go ahead and break WCL out into its own display
> > > > platform that
> > > > we can match against rather than assuming WCL only uses display
> > > > 30.02 and
> > > > vice-versa.  Or maybe we can just update the existing PTL
> > > > condition if this
> > > > function would never be called on PTL with a non-existent PHY B?
> > > Hi Matt, 
> > > 1. We could add the WCL as display platform. But for now, there is
> > > not much reason to add the WCL display platform define for single
> > > instance. Thoughts ?
> > > 
> > > 2. We could not extend the condition directly with display-
> > > >platform.pantherlake && phy < PHY_C as it will wrongly select the
> > > c10 PHY type for the PTL itself.
> > 
> > What do you mean here?  If there's no PHY B at all on PTL (based on
> > 72571), then this function should never get called with phy == PHY_B,
> > right?
> 
> This function is called for very PHY. This function is the only way to
> determine in the PHY is C10 or C20.

It's called for non-existent PHYs that a platform doesn't have?  What's
the flow to get there?  It's been a while (and the design has changed a
bit) since I looked at this part of the code.

> 
> > 
> > >         
> > >         But can be done
> > >                  if ((display->platform.pantherlake && phy ==
> > > PHY_A) ||
> > >                  ((DISPLAY_VERx100(display) == 3002) && phy ==
> > > PHY_B) )
> > >                         return true;
> > 
> > The PHY types are a characteristic of the platform, not the display
> > IP.
> > So we want to try to avoid using DISPLAY_VER checks since then we'd
> > do
> > the wrong thing if this IP gets re-used on a platform with different
> > PHY
> > configuration, or if other WCL SKUs show up at some point with a
> > display
> > IP other than 30.02.
> 
> If this is the case, we need to make a new INTEL_DISPLAY_DEVICE for
> WCL. Currently WCL shows up as a PTL to the driver.

Yeah, if there are legitimate platform-level / soc-level changes outside
the display IP that can't be handled with common code then we should
define it as a separate platform.


Matt

> 
> Clint
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Dnyaneshwar, 
> > > > 
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > Signed-off-by: Dnyaneshwar Bhadane
> > > > > <dnyaneshwar.bhadane@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > > > b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > > > index 75caccb65513..59eee0edef79 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > > > @@ -40,6 +40,9 @@ bool intel_encoder_is_c10phy(struct
> > > > > intel_encoder
> > > > *encoder)
> > > > >         struct intel_display *display =
> > > > > to_intel_display(encoder);
> > > > >         enum phy phy = intel_encoder_to_phy(encoder);
> > > > > 
> > > > > +       if ((DISPLAY_VERx100(display) == 3002) && phy < PHY_C)
> > > > > +               return true;
> > > > > +
> > > > >         if (display->platform.pantherlake && phy == PHY_A)
> > > > >                 return true;
> > > > > 
> > > > > --
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > --
> > > > Matt Roper
> > > > Graphics Software Engineer
> > > > Linux GPU Platform Enablement
> > > > Intel Corporation
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
