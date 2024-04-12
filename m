Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A9C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 12:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C8E10E130;
	Fri, 12 Apr 2024 12:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkZW2SRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAFD10E130
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712926346; x=1744462346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mz2S+f+GFangE6wxQA68u6kLWjpHes8l90D8PR5Ypj4=;
 b=HkZW2SRa7RrBOrqTgMPRiqTkJrBJlEHF4c4ypuSq+4zJFovWoS1dhRTo
 xaCE3pjYpvec09bHNJDFJuJfQXUkU3BNaTetMR0lI9RREN8NNQAoJV4fq
 q7z3PQ+Ny6YvR1pnLYkQlIC4hdpmYeZc+WfCYMR9QfQXNA9G4vrkQ5v40
 NUfYprEYk+kNN4wFBLxiWzUovFGJxwHmId6/hY/HklAtXe6NLzwIxxPLO
 ABt0a4oXX4KH++WMoU1UODdkCvDjgSgFcgzQvUw9nqi2CwmVLvxT8BcQE
 q9wvvLNpan99gMNgF8XW88zaSzd3n5qRqlvf5mTq0KQyWTGxu5JuzjuhL w==;
X-CSE-ConnectionGUID: /36vWjxoQX2Am/fMqqElyQ==
X-CSE-MsgGUID: j86DuQ01Tcay3A4EukjgFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8546797"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8546797"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 05:52:26 -0700
X-CSE-ConnectionGUID: y9phg3jPSYyKt3TizCi+3A==
X-CSE-MsgGUID: rTojTpg0RES0MecV3LoIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21718788"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 05:52:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 05:52:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 05:52:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 05:52:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 05:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZEt/uWFa9Sf8vFIry7WDZ/jMAbQaHNhoin/nN1/+zrn+j0BQ5hi8E9iaPFxghL9V/dc/spaFU2Y+gCP/qHveT/AypE6ednRS/FuEMkqTXR23KMLztFgwIMYl7pNaWLPlDlRBpWdHhNP8oDC+o35xKhzKiQ4jDMj2yHcI0QK/V7QjNSrYaXWfvMbIsKuZMcX6F4zamri6Q0xGUeEmb4fe11YKYA00wcpJjgv7KXpZgWNJf2o53ZInytC9FiGI/idpg27iDy4OVgMxmaRu3Q47Pya8zJAh4omYOl47MmZRK4weIsGcEkX/Yn3uBxLV3AixG9N4VUHmjbIhiTGysrSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz2S+f+GFangE6wxQA68u6kLWjpHes8l90D8PR5Ypj4=;
 b=EDrYgMbvq5bKdl9juagylzrEPz8qbp9RK0TaFECyQ7gX7YFDS+7jGSqyHTwpN7zai0jWeCCr/DhYCFka1FuvwpCIK1XYqT6pZ099950AueqB3fZSmj1B15JatJT2EmNBvxEBYRAVm+0xFf1VZMA/SgjFGaD1Zcgy9y7SWual83Mji2OIn9VCVMrEmDU+aDvVEGpFtlWowL+TRrWTTJwVh+XeYcDgfJKHm4NUpaJwB4yJIz1FiZwDXG+EakT4sMJoXAZgZWI3/AnbSZkiimeYWkX3TZaAshD6JLNek/UzW6zXkwVBGCRlDWKqlpvIphu7hSgQay1YjMY13vpe4LEAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 12 Apr
 2024 12:52:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 12:52:18 +0000
Date: Fri, 12 Apr 2024 07:52:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 1/7] drm/xe: Simplify function return using
 drmm_add_action_or_reset()
Message-ID: <mhkrjisvy5xjgcupsgck2ps3efpjfsq3jgf3buawdj3ji2ogqi@he4rysy6eg7a>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412080245.1044902-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 559535f4-c0aa-4740-ee2a-08dc5aef6300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hqa4sgrTIN7GYjv3npaf+9LjOHK2Hkc3XjEpEHHoYVsFPU5Il9o7UM6jYZPW2PL32YWO3qpOA35b2cyC1YdH7GvxS+djFwGCvqst/N1wyeW7dIUyeS0QkLK9y+4/dWtMVUSyRETNYRwxORvmp+HH2R5S8BZ7ZxwWrmgQwHgDK5a5la621bsd0OYik8FjdO/JAHCi3X71YbX+Angqa0CTny1SD1Ll4c5TQzw87w+clANAspdK6VFQRiKUINQODxZ/Y0hDBU1yFejP8QHPPY52v/yZEEHnZ4qTn8Z1XqFjhZ1yNlAWvXTFVn7fBOHuG0qcvl/T3Fz5IeH/AIcZ6wN770a3UgkIgZbM9YmpJoSfFZON8wjDyUTfo6fLYT38SL/mTN4Y29q+HEfqTcbW69IXuK8L1WgZE415IBpBJ7URg0wIz2vrm+w+6rl+hr8ifC4YwkJxJrVYJRIdPPL1t7IeEQ3HEunHhTwzWoIl4DnXvwie5ClpARs0lhU2Ut5hF4OhZwau1V1fNyf8Sy3HJlegXlIT3ZMpKKzOHMzwK+7cjvxO0gK5lCzzfoEfoNrGxYkV3xW6BITVWPZV80cZxtTOLAERdmuyKoDqOPRBCX8hHpL3nbEfqc0/ywY3j0dREKt80Nu7n4/e81BcNpvABEW9nsUj6A5zMEPjWuGEwsCu2AQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IeQv+teSPGr0UIn9ua7hmrPF73hMmANLvkjXUPiSUnWf9WRALJMrdP4oB1Rb?=
 =?us-ascii?Q?TdOojLLx4+zft+Qc4C5R9EDusy+VBxH6rT/BlrAYbqLotT5J80b45ZrP/LDh?=
 =?us-ascii?Q?ROdXq2jccodLp0Tg5gpP94bhZrsJL5I5WLIqam/9V68+Z0vqR0QzyFQO/2ZX?=
 =?us-ascii?Q?titLE2Z6ZyATdGnxSAGbigm8QnA8VgvZJafoeiAJjQa2iiH4xDRviiwJxDrl?=
 =?us-ascii?Q?ywKzdyjGqnVQgzJYsfHsPxC7bZgqlroTLmpZ/6ZmEtU+zXWRYGina+qvHlly?=
 =?us-ascii?Q?pVCRyd8N2yGF6kRwrNOk47x4PHqUTjVLJTzzOCi59VeOJ782cBwM3SoQ0kyS?=
 =?us-ascii?Q?YdAZWCJVfr3oyKhuyOBksAYBtULn00k/H5QCQ/XtoiOvH+zh8Qb9xUfVDPgF?=
 =?us-ascii?Q?OvVNRJ9rp5U1mhaAXtWOgQy3/jVnn54pDOt931uAHOFW48FIo03CRcOnSCbK?=
 =?us-ascii?Q?a9ZJC3xnrckiVClbf96Kcob8qmgM5yFl/oBsFq1vwK9VuQrAvv7rPfzeaicr?=
 =?us-ascii?Q?o5/PjnVu5aJamGe13HvCEflwodDd+WFMs0UOkqvTSr0+wYb6uxYNczdhvIDR?=
 =?us-ascii?Q?IsGm/PHKa+NkgyHNPLlaR3ABZCkJQWzulpuJr/IJerEgGNYPT+hv/ss+9LHz?=
 =?us-ascii?Q?qq6QI1tVvGr4ieXHShfnZUZaXV0BQT82tsGmPZT04pZgILZfi1K4TmBPNd4L?=
 =?us-ascii?Q?3qsqxJk8OQTKXHiCzEvn8fcKoMzGemx8G9WXrgu+8Iu7mFq6AOCj8VeW2LYw?=
 =?us-ascii?Q?ODA2J/yGcOhwvMd6lLPNO6qm/quPspSZ7y5/+CsiBL+wSs3QfC1VVS/aEth/?=
 =?us-ascii?Q?yB6JVARB2N1MWaILrdPsXPg2bO04R0fZfHz9ieh26E99HwBFpvF5yTRRvK2d?=
 =?us-ascii?Q?OSew5g4YnZyO0RFXjatyB7ApOSUKn2HkdyeJXwuTjfSM0FiLQvUUr42Xleav?=
 =?us-ascii?Q?tYV1OjGOkY6jyWpeQ65RV+DA5go3vn4eXNWkacMTm4Wm6Y1y8dpsBO4qsQQj?=
 =?us-ascii?Q?rFfxZOqFYBVAGlw/Y0dAZuSbsjEzfGmfkCch7aP6iEy9eApis90tO2W5YyhT?=
 =?us-ascii?Q?3lF2o3HhfXqhUoX569/vroe2043kTMvyWrIn0AoR+bXyjtlJQmoVXJJk/7q1?=
 =?us-ascii?Q?F8VQrz5OCuVEttx8sqrvm1neSGgLAuKsSLEpGSSj1aeMgWrW26YABdvMmBx0?=
 =?us-ascii?Q?nJGV0EtXf0UBMpuRatAivUm1x6yaHhlQssrZQRxq5PNEm/lskFJMiGS0D/B9?=
 =?us-ascii?Q?YXSJDWUgpjwDJuXZVX++W7Lhd0NfqoWKexvoV9EzdTjOVZNCD6V4hC1ccIxW?=
 =?us-ascii?Q?MJOdcQsMNvrmNeP+1evsqNaYLuj9hRVnBxqLSVmtlOvQ+U7+y8tMO+tAUGoF?=
 =?us-ascii?Q?3Dt9THHs4IS/DwZsKg3UY0CGHmGyOp9SUzf7NhUigxkE+3Jg6fd8mHatJPI+?=
 =?us-ascii?Q?58Pfr0p0/6VLvEku4pp11DaQpBl/IjvsBDWAB0t/v7Uh51GnjG7MOrgE957D?=
 =?us-ascii?Q?KYhvv009epCi+GQzHw1nvet+JC/ms+8lIP+yLpwmuyEov6C3QYi9ABMwwBlI?=
 =?us-ascii?Q?FDSpY3S30tEeuguk90w2nFSihlElkXNOF3ko6jM4ayVqWwhrFVvR1LZw7SzV?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 559535f4-c0aa-4740-ee2a-08dc5aef6300
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 12:52:18.5845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlS2lJzJGVJTfevnTcmyy+1h9CnLO8KYv+ZeAqMunnmT37dhQf5rUt70fS72RgVnHDjQ992UXJf4hrwRorQp1tfAydDLs/z+tyH7hcGxpVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
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

On Fri, Apr 12, 2024 at 01:32:39PM +0530, Himal Prasad Ghimiray wrote:
>Instead of assigning the value of drmm_add_action_or_reset() to err and
>returning err in case of failure and 0 in case of success, simply return
>the result of drmm_add_action_or_reset().
>
>-v2:
>cleanup in xe_display too.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
