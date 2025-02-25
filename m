Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCDAC021B8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 17:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A6810E0C7;
	Tue, 25 Feb 2025 17:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KP3HSCJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5726F10E0C7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740505446; x=1772041446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7glDfd8Z2GyiDN0R/uEVY853bRjQ0iIdicP8Fsshlik=;
 b=KP3HSCJ6ZzH19bpuWuEkfev/uvL1G29sMtSqTNkiWOz8cALZL69N1ga3
 06Nr1paxtlrO1iyV7QNEXHp9R2BM/1AIAGK5cvgBx2UrtRoRzovJK4Im4
 poezW26bzIBxRtMGKWz895MV+k2j22Scib0sqJJZgUDbeSrSiwi3SKWYP
 Rbnkzr0eXh2l0USTljQfkuyJ6GXzWzL4I5T+IuV57x0t7MrFhMIyxDpuU
 60PRsLh/QroitAXXtvQTr4v4t0C0AmxYeOdWRrcey/0ZO2+Fm923aNyFk
 ioCUrFhcSKiWKxsYfwR4K8vwpImBWhzboJ5KW+xDRiNPkQ9NAitmAB4W2 w==;
X-CSE-ConnectionGUID: kyD+ONCnQCu+Rs1ozngTvw==
X-CSE-MsgGUID: MSXiATsjR7mxJ6e3iYTgxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41344085"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41344085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:44:06 -0800
X-CSE-ConnectionGUID: tRlzN865RNOVho08fuwlPw==
X-CSE-MsgGUID: +BzyW6LLRSuHIolV7E1Ubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117386173"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:44:06 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 09:44:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 09:44:05 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 09:44:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giS+nOulmY+TAKEDYHYagJ4lXXHRFQawQGT+cTCt9WJWVbhLvG3R0FDS9Su2ZqeB6vl+zWX1y3aGNEwCFXENAqrP4fLDYjGPvOf2LlXFFOx4yfh62aWNFnS7+TbGAeViDyyrwOst3jVl+fonavZf1uOIEvClUH+y4C7hCenLTHlqaS1vQbmf3StBY/NobNAIqIuJm+ncHcvZ1JD1M3te8giDrxxHqDMSJCmpvgfnRQWsYQBiyVA6jCMVimRFaQL3o8aBHSTqw67tB1Rszsh9j3EiTUeBIVDh0Rm+F9qEHaNLfpVMHXSef+fF92QeFd8kwbs/hZ/Zpr9aPKJiGzPvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFzq+nM5f7wFKAD/7Bmp4+D/4Ta/E8p+R1M3eFnL4pw=;
 b=jXDkNi38Br3W6AhCSsd57MIMCaU9d9wciGAn+Xs/EH3unhCQ8JVNyqfDoPHTtvY9fT3zURfpps9R4QIoIuzStvQo/XDMYH70RC1kbBsoCdUGNMvVziPT7QgUJfsJu/OpiR3Bughw+3VIkwhqZttCITnIzz53h81ruHD/srUtQSm21QISA3nzUgNaD0uCAFbayTLMZltc51sN4vWHWXF6XiGFMUqNHZ4GZ8Q+2kyiBT0GVvccC+AAUXrrSuEuv5hvARBwH1VMN9E/eP0j4ljj+3mX7QkU2fBf+Hz6owAgTeDyMbQGVVqYMRJ8XLt4PY0LljIDB9ftXxX8lkcOXoApBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 17:44:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 17:44:02 +0000
Date: Tue, 25 Feb 2025 09:45:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z74Bo0no06PmV87O@lstrano-desk.jf.intel.com>
References: <20250224170109.3078314-1-matthew.brost@intel.com>
 <20250224170109.3078314-2-matthew.brost@intel.com>
 <7c58c04c73e217e5cdcb473876b368c47b60bc6f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c58c04c73e217e5cdcb473876b368c47b60bc6f.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:303:8e::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6cb6c0-f1ca-4c46-0cfe-08dd55c3fe2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?euF9ILhDjQE85FL2be9TfalxdLl3sc5tNzFfDhofirDOZr5bNHEgiAwuZE?=
 =?iso-8859-1?Q?NbjeIn0SlMR2Ets1Cs7fiKWE0sgvOrhsrnoxZgsOQaRM5ds9sj/1sOHqDi?=
 =?iso-8859-1?Q?2wtWdsAgBJqr1mvPtVy2Q0KnlRKBZPy085edoVBuJTYDKcONnMPW4MCl/u?=
 =?iso-8859-1?Q?JaQ7IKmvgN3AYvX+mBuRcwQRmn9+m6Di2d6Nob7dnawYpunP6MyXpjCd0g?=
 =?iso-8859-1?Q?JFE2C0srPzFSlWzCEzLrPrG7uXHry798c2hIKzupzmmJOtqsMYYZa5Hb6G?=
 =?iso-8859-1?Q?FYn8GRbVF+idcQ69fAp6i+9i7ld3rB81r44+4X+MSlS+VtfTYoHl1WC1KF?=
 =?iso-8859-1?Q?Ba+9i5PuVkTiqSRp+jmV7ad86sA3K/MD8UYfLQGeWuDnIqWmAOGLcS2xv5?=
 =?iso-8859-1?Q?YfbUmVKCidO6X+2ycvOCKwrt2BvOu+fQnyEwtuibjrjC3LsEeFYypouR2p?=
 =?iso-8859-1?Q?QztXs7JAWScBzYa9Q7PubPbBxblJETKDqEOaK2POEm2Vom6NCav/a1AAeP?=
 =?iso-8859-1?Q?6TgP5y9xp2PD/Asg55LXJoJNUIy2epG7nKKCv+9x6G5B/cgo2Nj+qvLWJX?=
 =?iso-8859-1?Q?fKFJ9mYCG1M/jwFtUVwgelpNy1ZYzEQ5REfTdOVmtWLu6jkw0QZKFkvdCD?=
 =?iso-8859-1?Q?UWEvi/ZkRCVLWH5d0EK2jvejxLlOjWh9ou2MjdrrgZPJLF7n+JJcBjTOa3?=
 =?iso-8859-1?Q?H6dkgNvqM0ZxqKCMc4DW117yylz0fR5Dg9hQavIQ+52psZvhwULMISxECt?=
 =?iso-8859-1?Q?uVji0w9RW3W+hXOS0Aj4w6Df38pnh9l63fohqZnYtQHKILniuaLA772sml?=
 =?iso-8859-1?Q?CYKF8m/zgNK3X/Pgk4eKYQRDYmIPzOIl3KnXj8HbeVXOB3e84RNYxswRUy?=
 =?iso-8859-1?Q?0YvrWPNKWbjqzJrJ+VGrpdWsa91QJAf4Bba0OdVAjJIOEi8DL3/roE+Vtu?=
 =?iso-8859-1?Q?95DBVVunHqAWrwsQcxq+tx4oR1Eu5HeU6+902dPePDnw70lTEEIKXHycfg?=
 =?iso-8859-1?Q?FKF4mg7Kp4Xsy9Dn5onJ6TzP1fLw+h+xqk6epZgYgxbn3a1GxhlGPaos7b?=
 =?iso-8859-1?Q?+Ce3Panictk8F7mB6+Z0ZBtzkTSVfRsJ3jk48opRIZC6lLBcxikfsriSAE?=
 =?iso-8859-1?Q?HrjOuPY/rLcHZxbVXYzkUKjh17IcJXtYRivkW43b2B4Rjdtjsihm3//Xs8?=
 =?iso-8859-1?Q?xPZrbPjHPaVGcRiYLh+stxG4zHX76POnfpm1q6K9RL9zIDRTHd30sZqMWg?=
 =?iso-8859-1?Q?wrAEapNZb/3se8I1jhczDg/J9hmtrzTPE0jlFmFeuBYtY8Dn1MExMF5S0B?=
 =?iso-8859-1?Q?ZbXjJpxAw6+uiaRwWUX7++ZrsYbr/w1FFbx0JyGFd+Pv1ZbRTJR7p+qB2s?=
 =?iso-8859-1?Q?RHWizq5zV8XZqsEbF/t5RgR6seA+D0IA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TmV9iRKXcUQBZR72SyfXsCnv+F9asmOqsUdF6JMK40LfzT48fzl2I2cTwZ?=
 =?iso-8859-1?Q?4J7rhMP7NEEUcwWmZ12nzWMBZOl2pGf1QogDwm1jbyocL6nmeg2Y74TXol?=
 =?iso-8859-1?Q?t87NZn52OQtG+pLZ/yCWY93iuaVcmXge/axEg+yGCTC959375+VIWuX9ek?=
 =?iso-8859-1?Q?U/VyBND/BQ187Jv9jZKqHqxJHaZcL3VRooxRpUWk/p1l9DQ0lH5zRPGpvz?=
 =?iso-8859-1?Q?w4JaDbG8RL8wOoVGXVgrjSPx0k8ahjg5hx+oX3Rbi81kputb5BhiS5NqE1?=
 =?iso-8859-1?Q?TiCkIc3k/d9mDwXybXsZDW/4U6XR8hL3cwUm5Hv7cC8nh21007o3QdJZ1t?=
 =?iso-8859-1?Q?Vt+gn0isulSW3Wj7coEcHPVP0gAWvZ2fQWvv5kdHWExknonChVx5lPrCY4?=
 =?iso-8859-1?Q?him0ffFL0alOqDOF/erdu9C1bDCmzxgcVAoPG2nn9vZXT4agOVjovoLNZP?=
 =?iso-8859-1?Q?bTYMJqMztri1AX/0eOggDgy0vht1wglp0bA5zTgaVMdRhhgf6UcSHJzTQb?=
 =?iso-8859-1?Q?4coCexQ2HzF19VRCcLczmocHsdo0V2OTDPtAkDQQ92FgPwMhUgVwvi4iaP?=
 =?iso-8859-1?Q?0QQrp0p4bNpGGmhJ3uQLymkCFvmbxtXM/Ftg1tNPeqymmgA3tD0nhiHPPd?=
 =?iso-8859-1?Q?wifnGdRDCQ/aZmiDzthWULKWj1IgmZGqB0djuzv0rQl1GoBXbZH5+ExQLB?=
 =?iso-8859-1?Q?97+Gbu1sOwblOnQD5uHabWr91GHRHFrwrO4HdY6EdZIYX4vzxmAqPtqCaq?=
 =?iso-8859-1?Q?urvRuJkiOxjXi8o0ujsohy8WePL6sh5iVxSFFcUSz/M0FKCMXulbpZuZpF?=
 =?iso-8859-1?Q?t1xd6TJqkq/TJOoddNCVfHuBvf/iuwLEsMBhVitNF7E4voledcfSWCROoV?=
 =?iso-8859-1?Q?L5P76MF3uf63GW38jdMrgkKcmmFxmJZkdjtaw3NfeYQiRxiU0tey4K9FXk?=
 =?iso-8859-1?Q?dWGOREbpu/u9V9bSGWyO3//7cspF9uyBl8hIgBUxE3zP30iHITGIDHFKW3?=
 =?iso-8859-1?Q?Zb4vpfP0ZZS3ulF7uns+A/Fvw4oK4nlaZFsqrZ0egsdMSkhMabaSag4MD7?=
 =?iso-8859-1?Q?/c5n0mTj2Mj2AJ6GrU/czb+iZylpQFyTf/g3mZ/X2s6EIIsTuo1MV5mYut?=
 =?iso-8859-1?Q?lRCmEnORRz3onb4C/Z7Y+qYPDIXX4u70ADnRKNKlWhdtwFV3HxIniFXlbc?=
 =?iso-8859-1?Q?7C7NOgC/Esow+Xi2Rk64AIEbst1Pa05K9tsNIpLnBnrhZ9c5zWuKbDXc1q?=
 =?iso-8859-1?Q?vNp+xKCVNv3qcDX8Hv2kaVNC7i5JCmlC5pjC2x/quyZOPJDVUXXW4ngs43?=
 =?iso-8859-1?Q?NsRSOFDdLpVkUYuB38c96uiuQrJKZ/n7ub7gJK8nAG8PDbmieq56Cd7Eok?=
 =?iso-8859-1?Q?3F8Ud7KFkGAV42ZTs+8/dtr+6sTB/TOnCb/r3Ns/B8Er79ox/mwo3McEiN?=
 =?iso-8859-1?Q?7vcpuY1ToJVz9QGNO/1oo42zNjta4SLb7tXt00/1dQG8RKETVm9oeouJOl?=
 =?iso-8859-1?Q?6cGFG339JBobQ5wUVfOVF+RM+MmTnt3DleGtrGOBb8PkFOaY0Ej1xBtXih?=
 =?iso-8859-1?Q?rYyL/ZUIeJ4Inq2znKuI84LAGK7FXfZ7bLilEp9rR5AwEgtxP9Fnuf0Jnh?=
 =?iso-8859-1?Q?tK0M4eO0Jjonq2du1PviCY60JNiKikKoxGwYgZKR++8kcrdgh16a+jcw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6cb6c0-f1ca-4c46-0cfe-08dd55c3fe2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:44:02.8829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 020Ni5ekVtOqJZjfBfYYfIelK/btmQrGhFfc47c43AOwAME6AGU0ssETqcarfW97V3F8RRnKfRGMA7r50i6HLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
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

On Tue, Feb 25, 2025 at 03:30:54PM +0100, Thomas Hellström wrote:
> Hi, Matt,
> 
> On Mon, 2025-02-24 at 09:01 -0800, Matthew Brost wrote:
> > Always wait on dma-resv bookkeep slots if userptr invalidation has
> > raced
> > with a bind ensuring PTEs temporally setup to invalidated pages are
> > never accessed.
> > 
> > Fixup initial bind handling always add VMAs to invalidation list and
> > wait dma-resv bookkeep slots.
> > 
> > Always hold notifier across TLB invalidation in notifier to prevent a
> > UAF if an unbind races.
> > 
> > Including all of the above changes for Fixes patch in hopes of an
> > easier
> > backport which fix a single patch.
> > 
> > v2:
> >  - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> >  - Support scratch page on invalidation (Thomas)
> > v3:
> >  - Drop clear of PTEs (Thomas)
> 
> This was what I actually meant.
> 

Ok, I presented this as option and it wasn't clear to me this was
preferred.

> https://patchwork.freedesktop.org/patch/639489/?series=145409&rev=1
>

This patch is doesn't work.
xe_vm.munmap-style-unbind-userptr-one-partial hangs due the error
injection always firing on a single user bind, so we'd have to fix the
error injection too.

Matt
 
> /Thomas
> 
> > v4:
> >  - Remove double dma-resv wait
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: <stable@vger.kernel.org>
> > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single
> > job")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 21 ++++++++++++---------
> >  drivers/gpu/drm/xe/xe_vm.c |  4 ++--
> >  2 files changed, 14 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 1ddcc7e79a93..ffd23c3564c5 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1215,9 +1215,6 @@ static int vma_check_userptr(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	uvma = to_userptr_vma(vma);
> >  	notifier_seq = uvma->userptr.notifier_seq;
> >  
> > -	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
> > -		return 0;
> > -
> >  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> >  				     notifier_seq) &&
> >  	    !xe_pt_userptr_inject_eagain(uvma))
> > @@ -1226,6 +1223,8 @@ static int vma_check_userptr(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	if (xe_vm_in_fault_mode(vm)) {
> >  		return -EAGAIN;
> >  	} else {
> > +		long err;
> > +
> >  		spin_lock(&vm->userptr.invalidated_lock);
> >  		list_move_tail(&uvma->userptr.invalidate_link,
> >  			       &vm->userptr.invalidated);
> > @@ -1234,19 +1233,23 @@ static int vma_check_userptr(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  		if (xe_vm_in_preempt_fence_mode(vm)) {
> >  			struct dma_resv_iter cursor;
> >  			struct dma_fence *fence;
> > -			long err;
> >  
> >  			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> >  					   
> > DMA_RESV_USAGE_BOOKKEEP);
> >  			dma_resv_for_each_fence_unlocked(&cursor,
> > fence)
> >  				dma_fence_enable_sw_signaling(fence)
> > ;
> >  			dma_resv_iter_end(&cursor);
> > -
> > -			err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > -						   
> > DMA_RESV_USAGE_BOOKKEEP,
> > -						    false,
> > MAX_SCHEDULE_TIMEOUT);
> > -			XE_WARN_ON(err <= 0);
> >  		}
> > +
> > +		/*
> > +		 * We are temporally installing PTEs pointing to
> > invalidated
> > +		 * pages, ensure VM is idle to avoid data
> > corruption. PTEs fixed
> > +		 * up upon next exec or in rebind worker.
> > +		 */
> > +		err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > +					    DMA_RESV_USAGE_BOOKKEEP,
> > +					    false,
> > MAX_SCHEDULE_TIMEOUT);
> > +		XE_WARN_ON(err <= 0);
> >  	}
> >  
> >  	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 996000f2424e..9b2acb069a77 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> >  	}
> >  
> > -	up_write(&vm->userptr.notifier_lock);
> > -
> >  	/*
> >  	 * Preempt fences turn into schedule disables, pipeline
> > these.
> >  	 * Note that even in fault mode, we need to wait for binds
> > and
> > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> >  		XE_WARN_ON(err);
> >  	}
> >  
> > +	up_write(&vm->userptr.notifier_lock);
> > +
> >  	trace_xe_vma_userptr_invalidate_complete(vma);
> >  
> >  	return true;
> 
