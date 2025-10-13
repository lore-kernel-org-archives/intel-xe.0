Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B517CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C467F10E13C;
	Mon, 13 Oct 2025 17:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ay169TNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EED10E13C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760376778; x=1791912778;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G+q1LjgdLIjgIrPDyuj0dlZz4vvRIS/XfBpk8Hm1WSI=;
 b=ay169TNyqM0pBajMvIDgsA+xgeG5djjFcA5419ROvJy6WJVrwV9kG7QG
 +f+Nvbe75htUhhAjL9Ebk5NdM9aBZjLFtx7A5TLjqHpeqa23uW7U2J3EA
 dpRipq7nNAIy0REDeXa9kvcPaTgOa8JQUUwxK0U/1vF64rbvzihYDc/fi
 k33PMgQU3kNYIc7dPjRDdLYEH9wrsRpyFeJXJqoiGw2pcrm9ESGLy8NHN
 /Fdu52oFiPfCirX1drbg012ombg8MtfUBTSCEhUA1EYO7zMvtNv5TGdN9
 Cdvw0zNKTYoQdfr+V4PiSg4KtHjqMDkR96o0XO5lMotUw6FWdkNGFwDP0 w==;
X-CSE-ConnectionGUID: l87N2RtiQC+i/jieKEFWjQ==
X-CSE-MsgGUID: fFd9AlrSR16fwZZvaW37qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73204737"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73204737"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:32:53 -0700
X-CSE-ConnectionGUID: LcgdU1CBRzSUWtEVRy1v2Q==
X-CSE-MsgGUID: 45blXwwITIi648k1LYA5NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180891704"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:32:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:32:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:32:52 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5F4iYpsgXAq3oQHH9qZCKgz0H04iyflftGCwbbxugU/RWPIxsZLwZFzDsa1n1+XAVgamEygDuZK2/vYwMUL3acJpC3fvWNLKsC1mLGmNh9ONsBUPinEU+OW5PGylALjRCkzkCAeT1glM45o1WHHA+O6xo/FwiSnlOIlUaioPVUbByHnsxR6H9JoZORwoP3jJUo0l/Y39Zx5+rMFtSsrd/80lSVz2esqG3nLRs8toyDrrKhYwE1H2YzLRPMtyvAodsy0+HLxHTgvJAsajXbeGRlK/zasjXHP7W/+qaMM1nI5lZe2heR3RExhUVwtbZDwIotKkQXN+dQUDMJaLgrPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryRGj9h1TQZmUc+433jomZUQdAV+cinRcgv8b0KRzV8=;
 b=vsW2cse+/Z2JZwSv90f7wHiFHC3jZoq23kNdpBJjiMJFYA4UvJy/E2g9X39oQA/3scCtMt66XeV5y/HhH7/O9RFitbzZvgeO5sv0g6IgQk/yfwiwuZAP7JUvC/jvXmr2CMqjBHPVkdXCZ09kSBQqgMckxIaE2KWfnU+E5VUWLDGZ1Kii7tL8wqMMfVpDG/iVRglRWlhj0Y1hRZ9d6uVJFfGe86DI3I+l++p1qwWYjJMtcSX/DPtNA8q2cpcayfxZFtiXtLWIc5dYPaUldD4gHa46EHANKzOHnD7x1pQxJBGOC4Pxslt2kL7WJJOYqiiZ7PqIEZU67546l8+sERF0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 17:32:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:32:49 +0000
Date: Mon, 13 Oct 2025 10:32:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <Simon.Richter@hogyros.de>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Message-ID: <aO03vp4Nl3gWlPx7@lstrano-desk.jf.intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
 <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
 <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
 <6aa691b1-1c7b-4534-8698-71cec3952d7b@hogyros.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6aa691b1-1c7b-4534-8698-71cec3952d7b@hogyros.de>
X-ClientProxiedBy: MW4PR04CA0114.namprd04.prod.outlook.com
 (2603:10b6:303:83::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0de23a-359f-41cc-0e55-08de0a7e87f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/i/bAbQRAxVlf9eF5/ebVAvJ5cOz9ZHqD4zuDh1wspznuk0kGZMSv1XD0g?=
 =?iso-8859-1?Q?ch8cv94XQR9cRzRm8PRxHOLmAwY9dreXJ7GrRnlpJBds13Nst570GzqHDx?=
 =?iso-8859-1?Q?r9kyFD6aKoG1xIjWlmRzJ1MKrNTkFPqkI8mbr+Nu2HsHj9uU2xLnP5pcKb?=
 =?iso-8859-1?Q?6YUdC8XPE6IlFnzInkZevYakmsnqIBSEqVNOffRdtZJ2U679ZW1ANiUwb4?=
 =?iso-8859-1?Q?gbXfx5XSng6cU/R6byzHjSVl2zfxpe336gy8Op5X5epZG5Qc0XvteSPYwT?=
 =?iso-8859-1?Q?MUHkR4pAbEaDw7MhIBbrWq8a6twQur8Gw/bgmFDR00A1XwHB8nfEU2itwh?=
 =?iso-8859-1?Q?F0+l+8EJs2OWwLIICFdPLUpHdbltSRrgY4Hjke0BCsObCR8ecqm3gRqK8l?=
 =?iso-8859-1?Q?rBbXM7DkzDEV8y8ghtYKRX78oDAKlW34DqksyV6sDkna60d0xm0ae1dR5j?=
 =?iso-8859-1?Q?JT+9lGk4k3D+FSjnw2G3dw4OHmc5elg7SM7nlrFC5W1mhVS2OGVRz352lg?=
 =?iso-8859-1?Q?m2Qo7jaiuFFD5ugU7MwxbrsuSMOb3FZYmAXZfQ7LSYQGo430pgkI9dVB8E?=
 =?iso-8859-1?Q?YAixFqVbPHBQd1L2Sxf3G0PJmVVgGSAcSvjf83QtmZFs1Mr+70MmPbTa+c?=
 =?iso-8859-1?Q?pfMgoZfRSKZJnEE3g+CZl8S+OlzPoZSOApScw5hMd/xWHvllNNcU7OMPHT?=
 =?iso-8859-1?Q?n0XJKxIncqWgJm4lRdyd2FAIopfXgA5VqCXsB3ljB9PL14vbUbwQcL+nBe?=
 =?iso-8859-1?Q?RNUINY8W2MWLzyD1/MZnWWUQ+E6tLp/4o9QrlDqND01oSR7x29CvZngMqj?=
 =?iso-8859-1?Q?8xSpD4/5SUn9+x0aS/6dd3cfWFIsy8r/6JEvV4Fzwbx/0MOKw0uXh5q+i+?=
 =?iso-8859-1?Q?5BFZ2OMhyVMeotfXvnnmLEviuMwS27CL9F1LYBf33mXjvPcZYfYssK4/dh?=
 =?iso-8859-1?Q?ujSQU3qGRN9n1eiN4s/MYybVqHgdvGQhTr5tHGQ6O7BAS8EkK8XVY1GX+6?=
 =?iso-8859-1?Q?lYRuCXLDwRq+PYWdiaZWVy5jIeJv8yZaXf2sLg0AbkIARzxDpu6/Nnp3O+?=
 =?iso-8859-1?Q?1FJPBHu51cleRQor2Fi4kxkWW69AMh2gRsf65YfRAKqugt4tRyeJF2vA9N?=
 =?iso-8859-1?Q?sSx5YpkdqdYeP/2YGJHh71kYdEGaH46bTKStvfkKEo4Y9lbthsZ96ni43C?=
 =?iso-8859-1?Q?e/D0JFxskmjQibdZ0ylm6ORnw9phWW9ZR3miLz5jOEoNqVuiV9Dr0mVkuz?=
 =?iso-8859-1?Q?/JO/9EY49klqs2j87qXZCHWm9T2yx1c6sGoWuaaPJg92f63BUU2n5NHvpm?=
 =?iso-8859-1?Q?ay9tIj6Ia44GM2TuOxIuQvBLx/k8mHJEzIvKMS6ULC9KIxXqgpemJ8c8aS?=
 =?iso-8859-1?Q?toS6VYIzJDXn5gDF1qtCwL/nKgeFXoXvo7XRIxqh2hgGJ4EyArEjwoDKVt?=
 =?iso-8859-1?Q?Jqt8SoRVuVtz7Akkr0glQRZj+WGxqEV7ZbEZ6e210Z0SupXcuGsUaD1Xp+?=
 =?iso-8859-1?Q?tvZRFFwU6ClB8ztlU9/s7b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Sq8quVMFsQJtvN6QNIjY4MQ0bdG+iKrpdOxz1HFaW5zdp+j/OWWNEfWb6o?=
 =?iso-8859-1?Q?5YwdPSB8LBSAkkINDxXgbDpSQum8sP05n9JLz+J+iPPdwSUF1KYsQU1nfA?=
 =?iso-8859-1?Q?Ga8dOAHMWGeaiiMgpMTKyCoHmRN/irdqR2UFd8wMhEnu+NT7DYk3sn2J9U?=
 =?iso-8859-1?Q?mlvt5hdH7pmhdYFWe2KSqxX0gHMGoBXbcyzTgDmEiNvzd9+kdhSEeYSNGt?=
 =?iso-8859-1?Q?rVk9hUXX0yjfnRyRzo4fX8UX6VWwQZ37EMEqPn6DoXGeYLrjzffwJphil1?=
 =?iso-8859-1?Q?vN0eSapGRP5HuAoobqRaGrNAf1LD/9dNjwmH/krAFTbHHRn/SRaLczGgmN?=
 =?iso-8859-1?Q?z5HK96Pz5NJh5UqrdCI2Vmhvw7+Oev2zWlpVPC9wpgf5OXTDa7t+YOf9gs?=
 =?iso-8859-1?Q?hEnRsB9rl6rpuQyaMn1mkP5/HAR24jGnqRFagcRZkiJBsUY5+dtnB0JdxP?=
 =?iso-8859-1?Q?Beq2lwjsTzqBAgg1H3gWCBJQwJBdu77xCU7OG692511yZVr1xWbQAgwjxF?=
 =?iso-8859-1?Q?2eeblfAUnKM+/gkgKfYV5lghy09gt60TCYWMYy0PboNZsud1p6zwzfKGUc?=
 =?iso-8859-1?Q?JNMa3QhQVmZ0T70UZBEnDB6s9o7YK5Su+YUFS04WdIrptxD9fPI93/9XrE?=
 =?iso-8859-1?Q?dk62C2lSmTU6m25XLR/0ikio0xxR1SEZlerFtmncRpIE0agjITL9Xc5WJp?=
 =?iso-8859-1?Q?V3OirNkULo+KY3bQpAN64S+AsdYumTMOvYrhfE0wUmb6+e6FFDcmiEVdzb?=
 =?iso-8859-1?Q?y7YZ/CdFgA17t66Acp6HVpJETN8eLDf7MizYcYpGqxhZO7RSptSc0LicN+?=
 =?iso-8859-1?Q?QLxcI/yh1gJGt23egaVjABooWFIK3L4x+4tQrGqfWDa1rxBm+sAUKGklK6?=
 =?iso-8859-1?Q?oI/Ll5hsTCkfABrOa5jP8xberyD7M2WYXayGZluiR1YojgWU8SGeEUuDgn?=
 =?iso-8859-1?Q?RtF9TlsdafnqHGol5kHAxAlqEBpZRQZqjx68iUkjjTwyregX/v80sBMWz1?=
 =?iso-8859-1?Q?T+zVXLnowSuGx2wTom9oS9TQvR2PbEs21eNFjkWyfKOEouiv76IyetZ45b?=
 =?iso-8859-1?Q?52ljAqT9pBsL7c84LsGmG4SKTDCvXl0hFmwMQbtyFURGhD2FYqLIqyTPl5?=
 =?iso-8859-1?Q?4Wkc9WsYjOgE8u0tKTweVdeDPJ7pRkR15BrRmd/owjX3T4yEQLmZUO04I0?=
 =?iso-8859-1?Q?Y8C5ZrgDAbYU1jjigCittrH+4meBTqg5PhqUvfiMcd7AdKGt/325YEJCPU?=
 =?iso-8859-1?Q?WlGjkdo0HCgdUwarUjRoGMqwCB84Q6GXNdx4eK86YqBWmZNh38SUYNX+qE?=
 =?iso-8859-1?Q?FaiIfPikHg6R/UVt6Cz/bcbqi5DF+gWdgoyrsEUnmy55YST0mM5Iln4GVf?=
 =?iso-8859-1?Q?726uODqi3oM25SP2SBRyX8heF24xaJRYYvbQ+uyfjF7Y1OZ/ANi1oCMoib?=
 =?iso-8859-1?Q?OUi+VefJU/pDciNLyX6YEJ/y1Cy1nFIVT837nhaM+T5j51VP96LtQXPFfv?=
 =?iso-8859-1?Q?yOs9RXM+XNPnjQ1rBm7d5mWmffLtHP/9KvznaUGIK55svgg7xxuGaCCFlh?=
 =?iso-8859-1?Q?dDneYSqGq/7kqDsvHNxKue8TwGvkNdw+qxuY7XH0r4b5xz+enk5Ffz3ZHV?=
 =?iso-8859-1?Q?w0+0DhdwfLvT4M6nTUiMsXx7+LjL4uXIUysjyXwUplWpncUFKrgN3TTQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0de23a-359f-41cc-0e55-08de0a7e87f7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:32:49.7524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omrH/UnJfFo3eaQrd7bDdAYwT9MZy3UHpUJGSbyDCFmflfRMwuXE7FYEeZ2vhzrTzfnEQFX7iC7wUBcvFfmwwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
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

On Tue, Oct 14, 2025 at 02:29:52AM +0900, Simon.Richter@hogyros.de wrote:
> 14 Oct 2025 02:14:44 Matthew Brost <matthew.brost@intel.com>:
> 
> > I'm not handling this but I believe CPU pages are at most 64k on ARM,
> > power, or longsoon. I could add an assert I suppose to make sure this
> > unhandled case never occurs.
> Hi,
> 
> POWER can also do 256kB, but that is a very uncommon configuration because
> it requires the complete userspace to be rebuilt with 256k segment
> alignment.
> 
> For that reason I'd expect even larger pages to be very unlikely.
> 

That's still considerably less than 2M so we are good here.

Matt

>    Simon
