Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5E2C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 17:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977BC1128F5;
	Wed,  8 May 2024 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVMOyJOr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256CA1128F9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715187607; x=1746723607;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qSu/6yrdJDs0qQcSGmk/D6q4YxGWu2ACiR9TxBT2GlU=;
 b=gVMOyJOr1wE97ASj4u0IoXzD5RDJ1Nd87JcR/Q4qdJgLiaMB4fYSX74Q
 h3aQ4N5xAAvJOAaBQOHEBlUHTdA7fuUqwNtbDexk5jnDgBnatEOKUBBlB
 4BzQR08Yxc6b4hyenamzyLJcL4HhkhkeJ8YK8GyT7O8Py7bJ9MPasWs3j
 +Jet5+BkcMaKrUZl3tHsH/AzIipW7vx9MGkCU4O8sziMh3xNpUIhmGF6u
 TVX70FQwpcdlkIBLiEZAL2X77xF7x7JMNTwiddS953IYKPMyha4S+/swW
 BmXF5pBs4flPTfxKeZG5OW6WmGb+5amsblMaJ6sY4cZsKh804SBDdBaUJ w==;
X-CSE-ConnectionGUID: BrFkZ7cSRn2YFqF0P385jw==
X-CSE-MsgGUID: p3oOaJjRQKeOcWmm6WF0Ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36443239"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="36443239"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:00:03 -0700
X-CSE-ConnectionGUID: 3vZvuUbYTGKVnyYEj2bXVA==
X-CSE-MsgGUID: ux8cXRO3RRqqDpb6W/CAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29330745"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 10:00:03 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 10:00:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 10:00:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 10:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yax5IxrBiuB+GB4xDnItFKz1DPr6A5MA6pj+MG5Ojde2F0MdSrNZVxT4CBxleYLXcD1ImnR7ktsw7gFy3UyOa+jH+m3YfVS1iozJRNLA9MWjGmZqfkh2BlE9AZPXMEh8CIpCr7wtbIbOPJ3+LH2X8C6OxScQeM+jw1tekDk8vpoyuCWz2mnqlF8XZtMr3KVYSaCjoysucj918mGUCB47gUdzDMprjZFS2OtuKNz3IWQuj/dDnb/weJ5W+E1CS5WsVrAeTa2sUwJPW2i0xK45UYatmsVuHNG30wSHvzv7Zm60/2A+0uRsCm+97toZg04EBE8GZdeKtZgYZu/w09lsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcYL9YtHksXXEM+usPkQVPOyhN31sjWvtCmoVL+s8xg=;
 b=ZGm3n2JVlM5k3T20LahzMH82V5MQ3JKznHnPqUCQESOEckJVeApp3L8DXZ5qALW+Hm1NyYuOlAuIcTh1u1pUjk82Aj6AT/HxqgzRLjRfntXlFd2TupfoUitGhBQhN61lsioF2+me7KWcNSmg4bnbuNRSSNbA8ycFKfluPSilpw2mzxuAQOYG496pkJ13UD8999mQUq8H5H7C5udxucMg/Ja7NV2pnmv3Rc8qBsjF1PHQArEDFDgZUHDCEVYmKKyKQVub4EwJV3k6V8/YdOMZG+d1scrvDLYgpo8BhYL5u5KvzKFztMlOMrfV4dZ9F3Y+11J4HlXZIa+I6HJ5ooL7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 17:00:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 17:00:00 +0000
Date: Wed, 8 May 2024 11:59:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Rename few xe_args.h macros
Message-ID: <weeehpeficgwk4jdkq6gjpmu5m7cplsg7hqv72ri6oh54qb2x4@u6riaowrbh3h>
References: <20240507152246.2791-1-michal.wajdeczko@intel.com>
 <fxdlgaucjd6kx4neblyphiz5bnxyzmxkd2flcnoajr36ltwuvn@hmiv55qd4syh>
 <98feb089-d392-4dd0-9b0f-d307e2deba37@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98feb089-d392-4dd0-9b0f-d307e2deba37@intel.com>
X-ClientProxiedBy: MW4PR04CA0364.namprd04.prod.outlook.com
 (2603:10b6:303:81::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3758c2-926b-4372-f7ed-08dc6f804bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?h9KIP0cTBBlIlSVPV3QP74toUI3CE6D1OWBxhVpaCHUZQRU129grZdsifz?=
 =?iso-8859-1?Q?BoioNNtG2WjlZwkrHsmQSq0tHfQWEgsjvuvhcrsw64OJ5qCVGDUphuRPRi?=
 =?iso-8859-1?Q?/VsuEOiww3PH+cz7MRLlZ+8Mc2aHs58qWvnM3u6wTokKLj6DOVVXKXTzSy?=
 =?iso-8859-1?Q?84u7G75Jo1qDDR4DbqY9IG3H9GfpPUFA8VK8NXIdLqXFzvXgzWjMlMiUy1?=
 =?iso-8859-1?Q?686Bk9YhyY9ox07xwvFHrAs13eSgeJArnWpP3NKR8QYOy4FMAEA9fg95IO?=
 =?iso-8859-1?Q?nlyqo6278ur/PYzaNBBfAKPN7rOvxsw6CERtmfJf0aAdxivBnaFtt/lcO5?=
 =?iso-8859-1?Q?BbhxdEbQI2JHF2fElVcX42x7GhQikBcl+Dgf1roukwEp8WRhu9/6DUKuYj?=
 =?iso-8859-1?Q?f13mJ+ENwQWvmPWe+a6y+tuCQqPVCgIDByXjzd597Xzbu0ZGSoNluGkfZS?=
 =?iso-8859-1?Q?it1zOGTMfWdQyul57r6zI603fDyd0odsOb8JT9VcxX54RXe7qYC4E9pcZ5?=
 =?iso-8859-1?Q?vVsojpPlrkofU1R7l7cQisv+7eEp2kjsUEVtRs3xck98WiXMLkJU7O0KtF?=
 =?iso-8859-1?Q?vm0kc79ZRnTe3rojpI4soSjEaEcra4hA3OV1tGtRq7hFY+ziad8M+h9CLN?=
 =?iso-8859-1?Q?4MyiKFGBcyej95qNgRJ3VYzWZinv61wX67R+EdfvO9rQCG3iMz4TlctdWb?=
 =?iso-8859-1?Q?MH8C0dU9Ckq/BjkGxF98FChvSQ+RgqyMfBSelzUT+Me8JABgfn82nBheNF?=
 =?iso-8859-1?Q?jKrbomk7jP4ZwEgf1YMnoGGNJvLyNgzeCGouPoG3G2W91OYaBuadIb+RvM?=
 =?iso-8859-1?Q?KGNNAL+ZiW2YP+idTzAuuHjHzpZc7oPlFENtRdSVkuXnM1CnljidRmtAg7?=
 =?iso-8859-1?Q?I4quWwtZkSgyBpAhx8p68OQ+3GirT0L4KDeow8ev5VrAi7jGbXuhDrT9h5?=
 =?iso-8859-1?Q?h7uL0hxEGRE7KvvCJTnbDi3d0FfimNqxUO9CFvm6CWJ+NIrVfQVallvdC3?=
 =?iso-8859-1?Q?3whFu1+3QoJSfjpFKh0t2yMoAjpEKeAsFXs0tmF0C8GdqeU2zYtMojY6uy?=
 =?iso-8859-1?Q?UxMGhIOneprajHlmH/kuTV3DWTyCW8FXGjvwcOVWOCn9I6XFwNq+PjQmL1?=
 =?iso-8859-1?Q?EchXyVWDm15+WS1AnSOskIF312wZ4D4r6GSvsqEhp4ZOQk4Iy19SahFFzQ?=
 =?iso-8859-1?Q?AmDycdZ+0TMFfCtb+783XfOYDPPVX3ODVorihTb7SALmYhiq7yLP/r91ec?=
 =?iso-8859-1?Q?R7MXTrmuBm7gfn4qzze75sclzjltTWl/8WGttiCv6f5MeVXiAJhqRQcuh+?=
 =?iso-8859-1?Q?X8tOwhFcglhDhPeHskXj+fuq+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PJIcIwN5ejKgFABTuFn1tHRZBcbgVzlVr5ng+0FRgzEC4gyCwpOfQWPCkx?=
 =?iso-8859-1?Q?VO9bnQbY3buGLDJUJzvNQWQ3UpEnFU+wkfXmYVX18NqXn0cb6glAy5/mIR?=
 =?iso-8859-1?Q?tTsn1MNRs14TvCywzcwUeJ1N81qsCQmz0DIRUYZgeGhhEW0TBoucwpt3to?=
 =?iso-8859-1?Q?qyQqftY3fGaJ/10tRRSEkHNImQ0P9aeXUW61ozOiTFWOtgpFeKHTCqu438?=
 =?iso-8859-1?Q?KxIKSpzgLTGWscir39W/wMWB4uGwYEAPp/o3TsFRUsJVBVS904ZshoLJid?=
 =?iso-8859-1?Q?i/N797KeW2U2zxzRswUpb1XMww0hR+QdTni2ulwQKtj+h1r5INx3gNPRDp?=
 =?iso-8859-1?Q?VN9Yp4NHPLiMJGAwPdIHSeioLb5bKLQnXsbTOqIVYED7agKFkQnJKF3DaA?=
 =?iso-8859-1?Q?NU4yk734wDfLfrja/qypzZdkNtSqDcdLd7kgnW334lrdDSg1rRqND8+W7s?=
 =?iso-8859-1?Q?DVZ9N26/js/6sG52UkN/aDKscMHmbQdwSR8qomJPcDYLbgMRobRirqqQHH?=
 =?iso-8859-1?Q?f/JAnhN/aTnFpuuKNyIg41VlQNh0K9z4QWJGwD+Xy6cAPuvAnLcqQaCNKU?=
 =?iso-8859-1?Q?w1JT6Wfx3z5c/t9Sw4A/FQlg7q/i/eMWXEgZQ/fR7g08m7wCu98KScgVM4?=
 =?iso-8859-1?Q?I7RGvmU9ZVIMBjy76NVrvZosA4DFhboGEr+ZiVFYrdJoRyB8RlUqZUWUSB?=
 =?iso-8859-1?Q?PuynVf538NC0ymXiKc9yNr3+dVD3AjIA4cG8HgclDG0NKpyrvFqZBxSed8?=
 =?iso-8859-1?Q?2ApJ4JTROpU0rRe8doSC0fVipkkkGBaKAGM7FxcUf8w1tnKr3w/jhn7E7w?=
 =?iso-8859-1?Q?1ONPdBaETzlE1WkjV5+6qUnlyVnj4I99TrntjfbvmSnmJJq3GxKQwAsHgg?=
 =?iso-8859-1?Q?0+VD491ZOru2sbE1QGW3jyZdqeTLifbHkf9Dg8ccb2rbArz+tSly9U6DDK?=
 =?iso-8859-1?Q?p+xIkSP6LAca6x5YqOk2pDUf6fvSdw4TP4fcrTUJNy3lIi/CDSDjkEDce+?=
 =?iso-8859-1?Q?n4iduJuJNDoyNHaODNtJ0ESOUXBny+JyTnO7iI58BWMCbnxjxkb7g/CYLb?=
 =?iso-8859-1?Q?Lsy0DjojXK8y68C0RW1Or8zHQMINf5GhtCbOyyIO4xiFZyOZ2DsoGrnscG?=
 =?iso-8859-1?Q?fKv4m8uR4ArBgtBS3MeM/Bhcw48P3EIRKk3yB8pFf04QizbQRen+goANNu?=
 =?iso-8859-1?Q?rM3bDijtNVZpOi3tjHywZN38a3NtS33UjDZTp/FhEagWXoewV/i1+ntq/g?=
 =?iso-8859-1?Q?KKzxhYnUEqeZldgPk+AnTiJa8UolOporsljv6u2vgqlLmnuWa2WjDAH4Ns?=
 =?iso-8859-1?Q?Fq6HvHIDLu0sF9tMCLzRzMq6ZfqObR1SpnTLiW/UKT67wiV6Ookk6SLFRH?=
 =?iso-8859-1?Q?EE9YLcAjGvJPiu+w+rc59ejm0f2IY2jsDArufLegahYnlZVOL0pxMFQKx3?=
 =?iso-8859-1?Q?hN2sFNX3GfQqGarF80OqCLjN7au82Oh2EFFyirHe6ze67SOBuo7I64pU/V?=
 =?iso-8859-1?Q?AHrizstxlmuucszZpJCjzKnC3qKhHEjlSkA0YCdWVO/bjFxuTr4ZmamCCg?=
 =?iso-8859-1?Q?DcEExVcFJiSb7jplR5d3wqnVmxd6MUDOKUfIUJ7we6gJykq3ISoVRJuCn3?=
 =?iso-8859-1?Q?9+dIk2tzcFJACDYe9UyfkX96l+S58+Njzp9IkZBtXcKfo82m9zswcT1Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3758c2-926b-4372-f7ed-08dc6f804bef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 17:00:00.2340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPs3rhcr5uv8nvZMHrB1r5Vnea3IqtlcE4KdLa78G0FKZsUGr5WP6FdRC0UGOyebbPxYis2qPtWfAr0hVfBG/4peYpDBlzbQSOlvA8Uai0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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

On Wed, May 08, 2024 at 06:33:02PM GMT, Michal Wajdeczko wrote:
>
>
>On 08.05.2024 05:33, Lucas De Marchi wrote:
>> On Tue, May 07, 2024 at 05:22:46PM GMT, Michal Wajdeczko wrote:
>>> To minimize the risk of future name collisions, rename macros to
>>> always include the ARG or ARGS tag:
>>>
>>>  DROP_FIRST to DROP_FIRST_ARG
>>>  PICK_FIRST to FIRST_ARG
>>>  PICK_LAST to LAST_ARG
>>>
>>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> v2: s/ARGS_TAIL/DROP_FIRST_ARG (Lucas)
>>> ---
>>> drivers/gpu/drm/xe/tests/xe_args_test.c | 82 ++++++++++++++-----------
>>> drivers/gpu/drm/xe/xe_args.h            | 50 +++++++--------
>>> drivers/gpu/drm/xe/xe_rtp_helpers.h     | 12 ++--
>>> 3 files changed, 78 insertions(+), 66 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c
>>> b/drivers/gpu/drm/xe/tests/xe_args_test.c
>>> index 9b44c1ab6364..a30d439713b7 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_args_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
>>> @@ -21,10 +21,10 @@ static void call_args_example(struct kunit *test)
>>> #undef buz
>>> }
>>>
>>> -static void drop_first_example(struct kunit *test)
>>> +static void drop_first_arg_example(struct kunit *test)
>>> {
>>> #define foo    X, Y, Z, Q
>>> -#define bar    CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>>> +#define bar    CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo))
>>>
>>>     KUNIT_EXPECT_EQ(test, bar, 3);
>>>
>>> @@ -32,12 +32,12 @@ static void drop_first_example(struct kunit *test)
>>> #undef bar
>>> }
>>>
>>> -static void pick_first_example(struct kunit *test)
>>> +static void first_arg_example(struct kunit *test)
>>> {
>>>     int X = 1;
>>>
>>> #define foo    X, Y, Z, Q
>>> -#define bar    PICK_FIRST(foo)
>>> +#define bar    FIRST_ARG(foo)
>>>
>>>     KUNIT_EXPECT_EQ(test, bar, X);
>>>     KUNIT_EXPECT_STREQ(test, __stringify(bar), "X");
>>> @@ -46,12 +46,12 @@ static void pick_first_example(struct kunit *test)
>>> #undef bar
>>> }
>>>
>>> -static void pick_last_example(struct kunit *test)
>>> +static void last_arg_example(struct kunit *test)
>>> {
>>>     int Q = 1;
>>>
>>> #define foo    X, Y, Z, Q
>>> -#define bar    PICK_LAST(foo)
>>> +#define bar    LAST_ARG(foo)
>>>
>>>     KUNIT_EXPECT_EQ(test, bar, Q);
>>>     KUNIT_EXPECT_STREQ(test, __stringify(bar), "Q");
>>> @@ -63,8 +63,8 @@ static void pick_last_example(struct kunit *test)
>>> static void sep_comma_example(struct kunit *test)
>>> {
>>> #define foo(f)    f(X) f(Y) f(Z) f(Q)
>>> -#define bar    DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>>> -#define buz    CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
>>> +#define bar    DROP_FIRST_ARG(foo(ARGS_SEP_COMMA __stringify))
>>> +#define buz    CALL_ARGS(COUNT_ARGS,
>>> DROP_FIRST_ARG(foo(ARGS_SEP_COMMA)))
>>>
>>>     static const char * const a[] = { bar };
>>>
>>> @@ -123,61 +123,73 @@ static void call_args_test(struct kunit *test)
>>>     KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, MAX_ARGS), 12);
>>> }
>>>
>>> -static void drop_first_test(struct kunit *test)
>>> +static void drop_first_arg_test(struct kunit *test)
>>> {
>>>     int Y = -2, Z = -3, Q = -4;
>>> -    int a[] = { DROP_FIRST(FOO_ARGS) };
>>> +    int a[] = { DROP_FIRST_ARG(FOO_ARGS) };
>>>
>>> -    KUNIT_EXPECT_EQ(test, DROP_FIRST(0, -1), -1);
>>> -    KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(0, -1, -2)), -2);
>>> +    KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(0, -1), -1);
>>> +    KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(DROP_FIRST_ARG(0, -1, -2)),
>>> -2);
>>>
>>> -    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS,
>>> DROP_FIRST(FOO_ARGS)), 3);
>>> -    KUNIT_EXPECT_EQ(test,
>>> DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS))), -4);
>>> +    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS,
>>> DROP_FIRST_ARG(FOO_ARGS)), 3);
>>> +    KUNIT_EXPECT_EQ(test,
>>> DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))), -4);
>>>     KUNIT_EXPECT_EQ(test, a[0], -2);
>>>     KUNIT_EXPECT_EQ(test, a[1], -3);
>>>     KUNIT_EXPECT_EQ(test, a[2], -4);
>>> -    KUNIT_EXPECT_STREQ(test,
>>> __stringify(DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS)))), "Q");
>>> +
>>> +#define foo    DROP_FIRST_ARG(FOO_ARGS)
>>> +#define bar    DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))
>>> +#define buz    DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS)))
>>> +
>>> +    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, foo), 3);
>>> +    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, bar), 2);
>>> +    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, buz), 1);
>>> +    KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
>>> +
>>> +#undef foo
>>> +#undef bar
>>> +#undef buz
>>> }
>>>
>>> -static void pick_first_test(struct kunit *test)
>>> +static void first_arg_test(struct kunit *test)
>>> {
>>>     int X = -1;
>>> -    int a[] = { PICK_FIRST(FOO_ARGS) };
>>> +    int a[] = { FIRST_ARG(FOO_ARGS) };
>>>
>>> -    KUNIT_EXPECT_EQ(test, PICK_FIRST(-1, -2), -1);
>>> +    KUNIT_EXPECT_EQ(test, FIRST_ARG(-1, -2), -1);
>>>
>>> -    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS,
>>> PICK_FIRST(FOO_ARGS)), 1);
>>> -    KUNIT_EXPECT_EQ(test, PICK_FIRST(FOO_ARGS), -1);
>>> +    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FIRST_ARG(FOO_ARGS)),
>>> 1);
>>> +    KUNIT_EXPECT_EQ(test, FIRST_ARG(FOO_ARGS), -1);
>>>     KUNIT_EXPECT_EQ(test, a[0], -1);
>>> -    KUNIT_EXPECT_STREQ(test, __stringify(PICK_FIRST(FOO_ARGS)), "X");
>>> +    KUNIT_EXPECT_STREQ(test, __stringify(FIRST_ARG(FOO_ARGS)), "X");
>>> }
>>>
>>> -static void pick_last_test(struct kunit *test)
>>> +static void last_arg_test(struct kunit *test)
>>> {
>>>     int Q = -4;
>>> -    int a[] = { PICK_LAST(FOO_ARGS) };
>>> +    int a[] = { LAST_ARG(FOO_ARGS) };
>>>
>>> -    KUNIT_EXPECT_EQ(test, PICK_LAST(-1, -2), -2);
>>> +    KUNIT_EXPECT_EQ(test, LAST_ARG(-1, -2), -2);
>>>
>>> -    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_LAST(FOO_ARGS)),
>>> 1);
>>> -    KUNIT_EXPECT_EQ(test, PICK_LAST(FOO_ARGS), -4);
>>> +    KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, LAST_ARG(FOO_ARGS)), 1);
>>> +    KUNIT_EXPECT_EQ(test, LAST_ARG(FOO_ARGS), -4);
>>>     KUNIT_EXPECT_EQ(test, a[0], -4);
>>> -    KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(FOO_ARGS)), "Q");
>>> +    KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(FOO_ARGS)), "Q");
>>>
>>> -    KUNIT_EXPECT_EQ(test, PICK_LAST(MAX_ARGS), -12);
>>> -    KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(MAX_ARGS)), "-12");
>>> +    KUNIT_EXPECT_EQ(test, LAST_ARG(MAX_ARGS), -12);
>>> +    KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
>>> }
>>>
>>> static struct kunit_case args_tests[] = {
>>>     KUNIT_CASE(count_args_test),
>>>     KUNIT_CASE(call_args_example),
>>>     KUNIT_CASE(call_args_test),
>>> -    KUNIT_CASE(drop_first_example),
>>> -    KUNIT_CASE(drop_first_test),
>>> -    KUNIT_CASE(pick_first_example),
>>> -    KUNIT_CASE(pick_first_test),
>>> -    KUNIT_CASE(pick_last_example),
>>> -    KUNIT_CASE(pick_last_test),
>>> +    KUNIT_CASE(drop_first_arg_example),
>>> +    KUNIT_CASE(drop_first_arg_test),
>>> +    KUNIT_CASE(first_arg_example),
>>> +    KUNIT_CASE(first_arg_test),
>>> +    KUNIT_CASE(last_arg_example),
>>> +    KUNIT_CASE(last_arg_test),
>>>     KUNIT_CASE(sep_comma_example),
>>>     {}
>>> };
>>> diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
>>> index 40b9eb4151d8..5efd3f9ea669 100644
>>> --- a/drivers/gpu/drm/xe/xe_args.h
>>> +++ b/drivers/gpu/drm/xe/xe_args.h
>>> @@ -35,7 +35,7 @@
>>> #define __CALL_ARGS(f, args...)        f(args)
>>>
>>> /**
>>> - * DROP_FIRST - Returns all arguments except the first one.
>>> + * DROP_FIRST_ARG - Returns all arguments except the first one.
>>>  * @args: arguments
>>>  *
>>>  * This helper macro allows manipulation the argument list before
>>> passing it
>>> @@ -44,15 +44,15 @@
>>>  * Example:
>>>  *
>>>  *    #define foo    X,Y,Z,Q
>>> - *    #define bar    CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>>> + *    #define bar    CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo))
>>>  *
>>>  *    With above definitions bar expands to 3.
>>>  */
>>> -#define DROP_FIRST(args...)        __DROP_FIRST(args)
>>> -#define __DROP_FIRST(a, b...)        b
>>> +#define DROP_FIRST_ARG(args...)        __DROP_FIRST_ARG(args)
>>> +#define __DROP_FIRST_ARG(a, b...)    b
>>>
>>> /**
>>> - * PICK_FIRST - Returns the first argument.
>>> + * FIRST_ARG - Returns the first argument.
>>>  * @args: arguments
>>>  *
>>>  * This helper macro allows manipulation the argument list before
>>> passing it
>>> @@ -61,15 +61,15 @@
>>>  * Example:
>>>  *
>>>  *    #define foo    X,Y,Z,Q
>>> - *    #define bar    PICK_FIRST(foo)
>>> + *    #define bar    FIRST_ARG(foo)
>>>  *
>>>  *    With above definitions bar expands to X.
>>>  */
>>> -#define PICK_FIRST(args...)        __PICK_FIRST(args)
>>> -#define __PICK_FIRST(a, b...)        a
>>> +#define FIRST_ARG(args...)        __FIRST_ARG(args)
>>> +#define __FIRST_ARG(a, b...)        a
>>>
>>> /**
>>> - * PICK_LAST - Returns the last argument.
>>> + * LAST_ARG - Returns the last argument.
>>>  * @args: arguments
>>>  *
>>>  * This helper macro allows manipulation the argument list before
>>> passing it
>>> @@ -80,24 +80,24 @@
>>>  * Example:
>>>  *
>>>  *    #define foo    X,Y,Z,Q
>>> - *    #define bar    PICK_LAST(foo)
>>> + *    #define bar    LAST_ARG(foo)
>>>  *
>>>  *    With above definitions bar expands to Q.
>>>  */
>>> -#define PICK_LAST(args...)        __PICK_ARG(COUNT_ARGS(args), args)
>>> +#define LAST_ARG(args...)        __PICK_ARG(COUNT_ARGS(args), args)
>>
>>                     ^
>>
>> I think you forgot to rename this (and others below), like you did with
>> FIRST_ARG()/__FIRST_ARG()
>>
>
>ok for rename s/__PICK_ARG/__LAST_ARG
>
>but regarding the others: the initial idea was that series of
>PICK_ARGn() macros would not be strictly internal for the LAST_ARG()
>macro but could also be used independently if needed (they just weren't
>documented as such until now)
>
>so maybe better to keep PICK_ARGn() as-is?
>and promote __PICK_ARG to PICK_ARG(n, args) with proper comment?

yeah, that would be great.

thanks
Lucas De Marchi

>
>>
>> with that, lgtm
>>
>>
>>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> thanks
>> Lucas De Marchi
>>
>>> #define __PICK_ARG(n, args...)        CALL_ARGS(CONCATENATE(PICK_ARG,
>>> n), args)
>>> -#define PICK_ARG1(args...)        PICK_FIRST(args)
>>> -#define PICK_ARG2(args...)        PICK_ARG1(DROP_FIRST(args))
>>> -#define PICK_ARG3(args...)        PICK_ARG2(DROP_FIRST(args))
>>> -#define PICK_ARG4(args...)        PICK_ARG3(DROP_FIRST(args))
>>> -#define PICK_ARG5(args...)        PICK_ARG4(DROP_FIRST(args))
>>> -#define PICK_ARG6(args...)        PICK_ARG5(DROP_FIRST(args))
>>> -#define PICK_ARG7(args...)        PICK_ARG6(DROP_FIRST(args))
>>> -#define PICK_ARG8(args...)        PICK_ARG7(DROP_FIRST(args))
>>> -#define PICK_ARG9(args...)        PICK_ARG8(DROP_FIRST(args))
>>> -#define PICK_ARG10(args...)        PICK_ARG9(DROP_FIRST(args))
>>> -#define PICK_ARG11(args...)        PICK_ARG10(DROP_FIRST(args))
>>> -#define PICK_ARG12(args...)        PICK_ARG11(DROP_FIRST(args))
>>> +#define PICK_ARG1(args...)        FIRST_ARG(args)
>>> +#define PICK_ARG2(args...)        PICK_ARG1(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG3(args...)        PICK_ARG2(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG4(args...)        PICK_ARG3(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG5(args...)        PICK_ARG4(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG6(args...)        PICK_ARG5(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG7(args...)        PICK_ARG6(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG8(args...)        PICK_ARG7(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG9(args...)        PICK_ARG8(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG10(args...)        PICK_ARG9(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG11(args...)        PICK_ARG10(DROP_FIRST_ARG(args))
>>> +#define PICK_ARG12(args...)        PICK_ARG11(DROP_FIRST_ARG(args))
>>>
>>> /**
>>>  * ARGS_SEP_COMMA - Definition of a comma character.
>>> @@ -109,8 +109,8 @@
>>>  * Example:
>>>  *
>>>  *    #define foo(f)    f(X) f(Y) f(Z) f(Q)
>>> - *    #define bar    DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>>> - *    #define buz    CALL_ARGS(COUNT_ARGS,
>>> DROP_FIRST(foo(ARGS_SEP_COMMA)))
>>> + *    #define bar    DROP_FIRST_ARG(foo(ARGS_SEP_COMMA __stringify))
>>> + *    #define buz    CALL_ARGS(COUNT_ARGS,
>>> DROP_FIRST_ARG(foo(ARGS_SEP_COMMA)))
>>>  *
>>>  *    With above definitions bar expands to
>>>  *        "X", "Y", "Z", "Q"
>>> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h
>>> b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>>> index 8129d6d9ef37..7735f217ba71 100644
>>> --- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
>>> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>>> @@ -17,7 +17,7 @@
>>>  */
>>> #define _XE_ESC(...) __VA_ARGS__
>>>
>>> -#define _XE_TUPLE_TAIL(...) (DROP_FIRST(__VA_ARGS__))
>>> +#define _XE_TUPLE_TAIL(...) (DROP_FIRST_ARG(__VA_ARGS__))
>>>
>>> #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
>>>
>>> @@ -54,10 +54,10 @@
>>>  *    XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
>>>  */
>>> #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_)
>>> _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
>>> -#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> PICK_FIRST args_)
>>> -#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_,
>>> sep_, _XE_TUPLE_TAIL args_)
>>> -#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_,
>>> sep_, _XE_TUPLE_TAIL args_)
>>> -#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_,
>>> sep_, _XE_TUPLE_TAIL args_)
>>> +#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> FIRST_ARG args_)
>>> +#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_,
>>> sep_, _XE_TUPLE_TAIL args_)
>>> +#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_,
>>> sep_, _XE_TUPLE_TAIL args_)
>>> +#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_,
>>> FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_,
>>> sep_, _XE_TUPLE_TAIL args_)
>>>
>>> /*
>>>  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a
>>> initializer
>>> @@ -70,6 +70,6 @@
>>>  *
>>>  *    { .a = 10 }
>>>  */
>>> -#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST _XE_ESC __VA_ARGS__)
>>> +#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST_ARG _XE_ESC
>>> __VA_ARGS__)
>>>
>>> #endif
>>> -- 
>>> 2.43.0
>>>
