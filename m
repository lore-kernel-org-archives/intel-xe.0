Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5804C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 17:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A5B10E0BE;
	Thu, 12 Jun 2025 17:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFWhC1kq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3372210E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749748234; x=1781284234;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gs2I7xh28lIVinE3Xvxu8fpo7xp3yH6NaymQG9In4wo=;
 b=nFWhC1kqZ2VTzsr0xN0DDfnoGkhgWGUfb6Jqd8nPwngC0sX77MC0jydO
 XTqSsdyM13rZwJjyBshk5FDorRnFG1B2Cmg9Gmyh7YdvURxBrgNoe+ytF
 q/sjqsdswllLbwNJjiZ7n+I8OylvuFauI1MDhkaRzgN/nwy/ShQ22Y5aj
 ZCh9zml76z8R1dLRG9DbdzC7CUnmqVvUPHanjdlv8EqWBnS09nTcPYAii
 SVLFWcxuBT1aLVMBAZ7v7vZF9SAzD5ejgb/ckbTygOSOsr2//DRBmuRik
 i/gdbI2CxoeFXjEO7DZYwuqxT0Rb9Ex1pTlgXJIFdEGQ1SxPBI7aLU4IK A==;
X-CSE-ConnectionGUID: cfP0OfWlRY2F/6d0As7i2Q==
X-CSE-MsgGUID: TKNOXahKTg6RCnKJvyeUOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62594752"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="62594752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:10:33 -0700
X-CSE-ConnectionGUID: OjMEYGU+QqK6nGmxGjHKbQ==
X-CSE-MsgGUID: r570qCGSRYGD38Y/V6ZAOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="184823731"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:10:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:10:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 10:10:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbItq8jndlViNGq9K+eO2oZxeek/JZvLp5mN6Hb98qQFOUfCB8uqAmqm3EorskElW8faYjmfQ3i7Ybjzqh/2Vj7N1Qg7PvsVG21G5vQfmdcnyRKQCrAHpqDfs5tu6c/xELe3ExVfRVfju8iszqo9VzcIpvAEmxoN0yHKm7IVuxeOFPQJYI5czFszmOUMDsdoaII0lQbTOOStVBjC2hrNL6RG2WVMbAoig8fCq4lFtkW9/tnWAITYKWllApzvoGnfFs8vJEaMR+XPT2E7Z4nXiSLOg6lSKHF+p+ViN3CC7Tk2hf7/bEkU7/tus5jd5oXJdtK871Gvsw9RSoWZcUYWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=runiEbTRWTMpOs7hKJ4rBzYdZM4yQ9jmJtD1YvUB51U=;
 b=Wk+BSSZK02oeghjF9LZoTxENlaqv1eZ6BAH7293EVSK22feQpY7B4jk0eL7gqXupCd8nDenPRuaNEVkgS/0GtkoJ+Uind6SfX7T/OtmmqdYQF6aFEGBcioznA2kvXFF5BD94Zlm0jNYYiOv/Vsjq2bW5KXqEe1Oma6G/XdtL+IGDuXHQGlq9ZC++6ZGd9ifF2tSMqkNXHdHs8UmZ1bFsuBGuxjlF4jHT9NCf7TJvexu9TUtQ8/XJcvUPfoAFl0cTxkB+WB0NsAb+RhnlrBhsOvZWnjcA6NReANAoQy1Bf4cAhiVvd14t/qI9P/UcZBl893RDx44fnpeo8hGpl3Py2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 17:10:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 17:10:12 +0000
Date: Thu, 12 Jun 2025 10:11:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aEsKU2LliY6JmG6a@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c80e29-2154-403b-b37b-08dda9d3fdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4TWPL5sXprP4SllKTptd2Psbu5OBPXnlBE5B5hJNfvI9j2eRLtAbhQEfaE?=
 =?iso-8859-1?Q?mQQEqEeX1Ygj3fq0dPtuh2KNyfBdFwMlFnAFvQkVH4Yxnp0JlMtE5Ee6nK?=
 =?iso-8859-1?Q?JC4qG/MFrZYT0rzmOquMfEUK4QT5RbcrFucdKK9hsp2D/FkrDCH3tK/6Go?=
 =?iso-8859-1?Q?de6k8yg07OFrBZwrZE/Jj0IGpFPuMCNE3VfFn1hgkP0Zy9hQDsKuMBL5E1?=
 =?iso-8859-1?Q?AxD/aN+l0PoAs7EPqQMLk8jxYbQUS9A1bmrOqi9BXKgF+3a8Fgm6AX3Mrc?=
 =?iso-8859-1?Q?cFzjbYEDbZ+CGVGT0WT5c2Io7bhIcJQFhpTp6XOIqJZmgK+PwjmgTz4K7g?=
 =?iso-8859-1?Q?75CBRI2h97TKcvTPFwtfuVog8mnog4Fp1i5xwSCTxX7TIi5ylQki58LVrT?=
 =?iso-8859-1?Q?2GFLMGN6XGxIL2JFRIcD7/Us2CgVPX5uHL4dHIzQJ8gP25g6u+4qvvn6F4?=
 =?iso-8859-1?Q?SjJhhlzjEfE7LrGVugfpHhJB8FiSOMtwUqACJxQi58yMNGj+eiou3khfJ/?=
 =?iso-8859-1?Q?Tvj6Gz4YYKivqabYCVimkrejdhngLY4kl9pU0dc+nJaHxmXIUTrgQn2NTE?=
 =?iso-8859-1?Q?a99yQg0L7eR5zYarVlY3LP3Ickibo/Lew2ZVpL3V3BMwp0bn73PUmgfx5p?=
 =?iso-8859-1?Q?3dHwXyndkj/Q1iiPF8Yl1gRbYlo+o/RtBYMhQK/HX58TBtXnncUJGTWvDc?=
 =?iso-8859-1?Q?s4BzvLqlIffReMUhzb9aZDuWTP0UFniHjIG+YxNpEQijuURsgyE3vDeu5k?=
 =?iso-8859-1?Q?CGo6phw2lsCY7KyTJtaohcCO7L3hQ1q2PlEA4zAZVffUJbrLZP6x0MNPd3?=
 =?iso-8859-1?Q?fe5Cl7FJ+fQHAlRUREls6gv8sC/oXYvMQ5iHSSiC9qN0L2AKXg7yipJ4hL?=
 =?iso-8859-1?Q?tGlq3JBfCXed5mQeY8uuZ+rt26RGuPxAypjiqX9ImdrnD70JMe+wKIoAr6?=
 =?iso-8859-1?Q?vBS6KOc/k8iNn22OGRQwwQiyHPOMn7Jsx7l25lSeQPWPot6HhKPA6yiF3T?=
 =?iso-8859-1?Q?STLS5iY+vb10pR6FFX4GAD0qEsp78d9wLQvstzSm5PB1PvHE86JxVU4m0k?=
 =?iso-8859-1?Q?NSUkSRwq5Mlrdo5sKBQD/l+u4HQsA6TpXeZnKRJUXId/SrgqF/d2Gcbxs+?=
 =?iso-8859-1?Q?DLzOh71qSmknAaScONjJMzv75jUikGUUVSKzcFWsOogP9oHBk7ZSgMiPny?=
 =?iso-8859-1?Q?slxi0+IP8ixvCTaAqhWV4zAndXUt7Xf1SXCoXPb6rhiVnjH83AX2qRgfPq?=
 =?iso-8859-1?Q?VxdUlW4VcuPHZty2tB3lX4Qzid5NnhrPQ2mNhrGD0TiEyQ4DznrUxcLFwq?=
 =?iso-8859-1?Q?3Rxm8oWJAaOUHlyMK7aM+9a7fGR73y/DxxrxnbdSCmB+A35GzBkMNoneX3?=
 =?iso-8859-1?Q?yogHgZpZ/tG19lTkrFuAqJnO/uJ/Ejwy/SNVSq+m+mi/WwP6RiGs6sc1Qd?=
 =?iso-8859-1?Q?2s1nYQH8XdrfwFCBC8l5uOV7WZCS/H7WzAJqbmu6cOyf2hDTve0Z0/xutF?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qYyYqzY9gEGOFIjfLcEsQsHgDG8mMou8OfbKwimUrs8cC06l4V9AzN7P07?=
 =?iso-8859-1?Q?pqM9u/6/Hx3hHYrialTWI5Uqf20uZEk8ztBPdSrJBFSWgIgo2fvluYYXKj?=
 =?iso-8859-1?Q?DLB7gZ919fsb0+UL4xyQZR8qiovtxZ+5QzYm8T1DEvoM/ixezujWSfAqwQ?=
 =?iso-8859-1?Q?pWIu/tj17+DkCAwAW3HVBwo9Rp0nZi7/ePXp4gaygke27m2WzGqBGlBnGA?=
 =?iso-8859-1?Q?GRpEzGCMINeLxUDHaTdld8I4ZNJhO23oEU1hqsuiTq2o8QYdI58/DDQV8G?=
 =?iso-8859-1?Q?RGUml+yiQiMB4DFr5x8/HTdftHqIYiG1sO0S+V2/E+jH278LKWxg6qE/IY?=
 =?iso-8859-1?Q?QhTvYR0CeDc71ZheqALaoG4HcV0JhYaVl9Pxb5TUxcf1xkQKat1mFkwkuj?=
 =?iso-8859-1?Q?/4wUJyuwt/mjYitEMNhSjLH8ZXWX51S5Ul9HhxCqgjo3zfYRDygQQPy0+H?=
 =?iso-8859-1?Q?El1T5t+rskG3DB6pe5VDe5erZn75aBAnIWoh/7QLyFkT9f9awvBmnDC6/8?=
 =?iso-8859-1?Q?akkSqMG0Ln8ZF8nnMEr90QaA7DiXvzHwg9h4XQgyWr0SgzQmbZSiGyElBv?=
 =?iso-8859-1?Q?Y8Vyjxqpd6Am3iYj9DnPRAlqQijdh9mHdaznXkxyJDTFQMhfVZw3b0+DAK?=
 =?iso-8859-1?Q?kvXpxeX5k4mKDe/7e8q8LELWtff6WOg1ZjwIkazvL6BRvwvkj3dqhacQOD?=
 =?iso-8859-1?Q?5A1K1ylphihG+pp+u5ZvhpGzl4tA2cQ3kRy/oa9KSyuMkP6sdOkotAcJBf?=
 =?iso-8859-1?Q?embQNyZZK/4aYWTkJkItG8RmyBlGn7J/tGzmGmzbF7ZVT0uqF0jhyLDXpS?=
 =?iso-8859-1?Q?2ADvSHFkK9PigCedf+s17YHqlnIfUoAmFBHO8H6bpW9AaQ5Ei8mGo0Canh?=
 =?iso-8859-1?Q?ra+p8wyOrDtdSOPEwHDIPbMMHWPh1XyM8JevU8HgXmxBDl897JGWiOwKyy?=
 =?iso-8859-1?Q?wXcOhKrulnaujnPk5IRSobPdwW0z5uBCPw653Zp7Cj1SDsOFluHkB19JuU?=
 =?iso-8859-1?Q?Eh7+XwmlfvVfaxzZ+zKLMOJ0Kiu6hUq0uZ5lIga4O9+Kxulue3aMsK+KA6?=
 =?iso-8859-1?Q?PLa9w+TiZ0gVuALowus85+yPcU7jPNoItzKFyicuoeHZBjuZkFYhj5Z1d0?=
 =?iso-8859-1?Q?l2FF80NvwpfQOjvBwNnnL8rcA0YRKkru88/Wiu2AOX5mlG7pxwi8Tu6OPY?=
 =?iso-8859-1?Q?V9j+xPz79y+W/LfgasL3286/WqzhtCsoZTZNlfsQvyc/98AlRlWjW5IXB7?=
 =?iso-8859-1?Q?PpUKJ5U8CrFmPcHvr+IEz7dFBeC4+OK15E+ZbrV4ic4c/xctoDqrbZ1jyr?=
 =?iso-8859-1?Q?Zas6xTHSFWqaT05R0ipi2XS4wp5xFnm+vuyALjVNIy9EqRS1Qyr8Xpoigl?=
 =?iso-8859-1?Q?7n+EX+HBxLx8jTpNQMoYUvP2vMHxLvDZmD9rY3qGtr6QiDTaVjV0PF9KnI?=
 =?iso-8859-1?Q?UZrjx4CeMUmkzhzqWwTP6KWA1vdaQbScqZpJyWhJn404H6wB6MkcfXYsA2?=
 =?iso-8859-1?Q?mVq0Xm7ffTUPDdoJ8wPc0vxAYGm1e+eTGi7vS/cXW+sdO76S3hvlPNfANp?=
 =?iso-8859-1?Q?7kPJ56PqIO4obPQ3387BP5OHKxKr4tpbu1aJnirhrnIw+KTpDKAKDkRZiL?=
 =?iso-8859-1?Q?2wyzSVJczQ0ljMKV4uDmVNDsa8McXd54lz95n9YhIKDoYRPGCDc1a6vQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c80e29-2154-403b-b37b-08dda9d3fdd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:10:12.0547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oY9xP4zyWsZtJSBcRZhnL34q3xvyWVfQ0jV2Y6maidyHooSO/M5Q+S9OLKUIFq5MT83wIavbD/1Ca1Jh+yEakg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
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

On Thu, Jun 12, 2025 at 02:53:16PM +0200, Thomas Hellström wrote:
> On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > Clearing on free should hide latency of BO clears on new user BO
> > allocations.
> > 
> > Implemented via calling xe_migrate_clear in release notify and
> > updating
> > iterator in xe_migrate_clear to skip cleared buddy blocks. Only user
> > BOs
> > cleared in release notify as kernel BOs could still be in use (e.g.,
> > PT
> > BOs need to wait for dma-resv to be idle).
> 
> Wouldn't it be fully possible for a user to do (deep pipelining 3d
> case)
> 
> create_bo();
> map_write_unmap_bo();
> bind_bo();
> submit_job_touching_bo();
> unbind_bo();
> free_bo();
> 
> Where the free_bo and release_notify() is called long before the job we
> submitted even started?
> 
> So that would mean the clear needs to await any previous fences, and
> that dependency addition seems to have been removed from
> xe_migrate_clear.
> 

I think we are actually ok here. xe_vma_destroy is called on unbind with
the out fence from the bind IOCTL, so we don't get to
xe_vma_destroy_late until that fence signals, and xe_vma_destroy_late
(possibly) does the final BO put. Whether this follow makes sense is a
bit questable - this was very early code I wrote in Xe and if I rewrote
today I suspect it would look different.

We could make this 'safer' by waiting on DMA_RESV_USAGE_BOOKKEEP in
xe_migrate_clear for calls from release notify but for private to VM
BO's we'd risk the clear getting stuck behind newly submitted (i.e.,
submitted after the unbind) exec IOCTLs or binds. 

> Another side-effect I think this will have is that bos that are deleted
> are not subject to asynchronous evicton. I think if this bo is hit
> during lru walk and clearing, TTM will just sync wait for it to become
> idle and then free the memory. I think the reason that could not be
> fixed in TTM is that TTM needs for all resource manager fences to be
> ordered, but if a check for ordered fences which I think requires here
> that the eviction exec_queue is the same as the clearing one, that
> could be fixed in TTM.
> 

I think async eviction is still controlled by no_wait_gpu, right? See
ttm_bo_wait_ctx, if a deleted BO is found and no_wait_gpu is clear the
eviction process moves on, right? So the exec IOCTL can still be
pipelined albeit not with deleted BOs that have pending clears. We also
clear no_wait_gpu in Xe FWIW.

> Otherwise, this could also cause newly introduced sync waits in the
> exec() and vm_bind paths where we previously performed eviction and the
> subsequent clearing async.
> 
> Some additional stuff below:
> 
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> >  6 files changed, 94 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4e39188a021a..74470f4d418d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1434,6 +1434,51 @@ static bool
> > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> >  	return locked;
> >  }
> >  
> > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> > *ttm_bo)
> > +{
> > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > +	struct dma_fence *fence;
> > +	int err, idx;
> > +
> > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > +
> > +	if (ttm_bo->type != ttm_bo_type_device)
> > +		return;
> > +
> > +	if (xe_device_wedged(xe))
> > +		return;
> > +
> > +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo->resource-
> > >mem_type))
> > +		return;
> > +
> > +	if (!drm_dev_enter(&xe->drm, &idx))
> > +		return;
> > +
> > +	if (!xe_pm_runtime_get_if_active(xe))
> > +		goto unbind;
> > +
> > +	err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > +	if (err)
> > +		goto put_pm;
> > +
> > +	fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo-
> > >resource->mem_type),
> > +				 ttm_to_xe_bo(ttm_bo), ttm_bo-
> > >resource,
> 
> We should be very careful with passing the xe_bo part here because the
> gem refcount is currently zero. So that any caller deeper down in the
> call chain might try to do an xe_bo_get() and blow up.
> 
> Ideally we'd make xe_migrate_clear() operate only on the ttm_bo for
> this to be safe.
> 

It looks like bo->size and xe_bo_sg are the two uses of an Xe BO in
xe_migrate_clear(). Let me see if I can refactor the arguments to avoid
these + add some kernel doc.

Matt

> /Thomas
> 
> 
> > +				 XE_MIGRATE_CLEAR_FLAG_FULL |
> > +				 XE_MIGRATE_CLEAR_NON_DIRTY);
> > +	if (XE_WARN_ON(IS_ERR(fence)))
> > +		goto put_pm;
> > +
> > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > +			   DMA_RESV_USAGE_KERNEL);
> > +	dma_fence_put(fence);
> > +
> > +put_pm:
> > +	xe_pm_runtime_put(xe);
> > +unbind:
> > +	drm_dev_exit(idx);
> > +}
> > +
> >  static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> > *ttm_bo)
> >  {
> >  	struct dma_resv_iter cursor;
> > @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct
> > ttm_buffer_object *ttm_bo)
> >  	}
> >  	dma_fence_put(replacement);
> >  
> > +	xe_ttm_bo_release_clear(ttm_bo);
> > +
> >  	dma_resv_unlock(ttm_bo->base.resv);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 8f8e9fdfb2a8..39d7200cb366 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  	struct xe_gt *gt = m->tile->primary_gt;
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	bool clear_only_system_ccs = false;
> > -	struct dma_fence *fence = NULL;
> > +	struct dma_fence *fence = dma_fence_get_stub();
> >  	u64 size = bo->size;
> >  	struct xe_res_cursor src_it;
> >  	struct ttm_resource *src = dst;
> > @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> >  		clear_only_system_ccs = true;
> >  
> > -	if (!clear_vram)
> > +	if (!clear_vram) {
> >  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> > -	else
> > +	} else {
> >  		xe_res_first(src, 0, bo->size, &src_it);
> > +		if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > +			size -= xe_res_next_dirty(&src_it);
> > +	}
> >  
> >  	while (size) {
> >  		u64 clear_L0_ofs;
> > @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > clear_only_system_ccs,
> >  				 &src_it, clear_L0, dst);
> >  
> > +		if (clear_vram && !(clear_flags &
> > XE_MIGRATE_CLEAR_NON_DIRTY))
> > +			size -= xe_res_next_dirty(&src_it);
> > +
> >  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> >  		update_idx = bb->len;
> >  
> > @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  		}
> >  
> >  		xe_sched_job_add_migrate_flush(job, flush_flags);
> > -		if (!fence) {
> > +		if (fence == dma_fence_get_stub()) {
> >  			/*
> >  			 * There can't be anything userspace related
> > at this
> >  			 * point, so we just need to respect any
> > potential move
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index fb9839c1bae0..58a7b747ef11 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct xe_migrate
> > *m, struct xe_bo *bo,
> >  
> >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> >  #define
> > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> >  					XE_MIGRATE_CLEAR_FLAG_CCS_DA
> > TA)
> >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index d1a403cfb628..630082e809ba 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > xe_res_cursor *cur, u64 size)
> >  	}
> >  }
> >  
> > +/**
> > + * xe_res_next_dirty - advance the cursor to next dirty buddy block
> > + *
> > + * @cur: the cursor to advance
> > + *
> > + * Move the cursor until dirty buddy block is found.
> > + *
> > + * Return: Number of bytes cursor has been advanced
> > + */
> > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > +{
> > +	struct drm_buddy_block *block = cur->node;
> > +	u64 bytes = 0;
> > +
> > +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > +		   cur->mem_type != XE_PL_VRAM1);
> > +
> > +	while (cur->remaining && drm_buddy_block_is_clear(block)) {
> > +		bytes += cur->size;
> > +		xe_res_next(cur, cur->size);
> > +		block = cur->node;
> > +	}
> > +
> > +	return bytes;
> > +}
> > +
> >  /**
> >   * xe_res_dma - return dma address of cursor at current position
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 9e375a40aee9..120046941c1e 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > ttm_resource_manager *man,
> >  	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> >  		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> >  
> > +	if (tbo->type == ttm_bo_type_device)
> > +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > +
> >  	if (WARN_ON(!vres->base.size)) {
> >  		err = -EINVAL;
> >  		goto error_fini;
> > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > ttm_resource_manager *man,
> >  	struct drm_buddy *mm = &mgr->mm;
> >  
> >  	mutex_lock(&mgr->lock);
> > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> >  	mgr->visible_avail += vres->used_visible_size;
> >  	mutex_unlock(&mgr->lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > index cc76050e376d..dfc0e6890b3c 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct ttm_resource
> > *res)
> >  	return container_of(res, struct xe_ttm_vram_mgr_resource,
> > base);
> >  }
> >  
> > +static inline void
> > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > +{
> > +	to_xe_ttm_vram_mgr_resource(res)->flags |=
> > DRM_BUDDY_CLEARED;
> > +}
> > +
> >  static inline struct xe_ttm_vram_mgr *
> >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> >  {
> 
