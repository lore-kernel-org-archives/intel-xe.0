Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E632C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC8010E814;
	Sat, 27 Jul 2024 01:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrDjRNl7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB6210E8D2
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045198; x=1753581198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sgWJi0mXrnQcwAGhwrHfypdobX3eIA8IyML/2nCsvUo=;
 b=WrDjRNl7caEgANQlksCzLUG2lHbT99C5344W0geetaWi8DCo+mqIkzz/
 SZLuXGqKxQ9I2XfHUkVlwOauiVDJim4WdGVQ5BGObqsxrykc7BUz4ncGy
 sjHYjNhO0Ko0gU6XnyZCUUWfHh0SamVSZ/JjXkvtttDdYGqdK7wJQm/A9
 0e3RokHpOD1XafsxxLPl7/xKd92yL07kYb+zb3idiXvCakVV61/VRT34a
 LC0KClBa3mfOYgoI2GIyxx7sy8IEtr/WpCPzYfterfh8HjxGaLTm3ySX6
 kW0wxW9pIEDIJdsoRLhke3SUkxrEI9bWCts/VBsuk+iqf2Mq15K3s+yYp A==;
X-CSE-ConnectionGUID: fE7J7qwnRFK3WL0mcikQiw==
X-CSE-MsgGUID: 1nGvN0+mRmS6iRof4HnTNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="20042387"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="20042387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:53:18 -0700
X-CSE-ConnectionGUID: Fwz0ZY+6SKSyEtqbKGmi6w==
X-CSE-MsgGUID: 5ogw5HvUR2+wkooD1qhH1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53361351"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 18:53:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 18:53:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 18:53:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 18:53:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjWeG2MTR8lB2V/FJg3MeYmSDYlfDUjSsmiVxEeNGn8fnZUwp8mP5UkqFeZRLacOwWKpT2+S5MSMZufgWKIqA0kbCDxKSP0Hym6A24p8YQG4VEuB11xIINNSd3tZveoc20EEtAMDVHlJnC7f61TP1QKZ9btZ+8Jx99j/wyFvdzmHmndVNjE8ac8XFsgoYh4DxTwYBgSFWxooM4dGqKcyhVQJ8UReii3pYJ4lgK8IN8NproX+Ga7tyhSQiHvSYyPundDWOw0eSz7uLZfyfwwtJMqfL6FHAfmOrzjryV5TdMRicefmh/sMfZQzqrLy0KV3Mz8lZ11bTHDOV410423SEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/luoi+JFCorrS8J0Vbd4jHaG1HVIryq7qgWz77bBBI=;
 b=O8JBJ6JOLiybiN+VhalQDYl/VptyKK+PI4JlwwZSBoheS8dUmTYP7N48SBmDG5umpF1mlqoLF4oTcr1oAgccDmVAOxvzUGLQWakFiAP2G4mmEUpGKntXFi/k4QteK4nn7+aLQV74t/TpA/7ke614CuINxq1NAQvA/rp2P0aBVQsxtnJMfvuKUBwYGdp050lvbpYiAQkCrLR+7qrrZU5XB6mgPvmt4q2x7XMVb/s6tPOlXS6bYQvt7oioPCO/sCIGyDNeE7yBgBP1lcvL65KntfQjZEI1kghxDAvumb4lvKiRDnNnSR4IcBWN/bwpKuxrKS5C9kuYwX3l213NG1saQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sat, 27 Jul
 2024 01:53:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.009; Sat, 27 Jul 2024
 01:53:13 +0000
Date: Fri, 26 Jul 2024 20:53:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>
CC: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Message-ID: <ef5dvhi4wchv5h6d56men5tsyw5wli6f75sqwrlqkn5dntzj2c@bg6zifx3biau>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
 <ZpAaK5OjjziS3S88@intel.com>
 <iuknmfhu2anc6f7sqfalijhaws6mmx5djfu3vhv5j4frhnxin7@2jqs23zqm5kn>
 <oidc3dwrlj4rlm4yczudf4uqy442a77o35bvr2zai7fnxnfhl7@7jjaergakoxn>
 <ddb6a30acade05a9e1a95c934d4201d68a89a990.camel@intel.com>
 <zin6leryq7xgs5vmlfmubo43g5iirhuohvxemxc4liukjufp4w@mjquccbaogwr>
 <172203482291.323134.1548881068994911540@jljusten-skl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172203482291.323134.1548881068994911540@jljusten-skl>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c344ab9-d09b-4c91-c97e-08dcaddee020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/U6nD8NINpZItV3Tq3MtIN6+8W/EBdxwEm/80ScZmaIMOspuMElrd2/qEPcX?=
 =?us-ascii?Q?lX5pjC99qdzjJgOlL68l6dWV/M67sm/BD/kTYhhAtBuPAMgvjymg++5rl02x?=
 =?us-ascii?Q?3IDp3c2olW8tUeLsJzo4hPLfc+B8ZZM/K7bm2k0Xzw2DUkE2cpivlPW8+aWx?=
 =?us-ascii?Q?G2WPhNPaxgnHIHgUNL6bdWpu78/uOx8PmKOTkUe6gxCbpHpoulUizhgnMybJ?=
 =?us-ascii?Q?lTfpPvdw/5DeDW4pqZsGFS9X/cs/+UGVgQ4BkTMFSKGjl3vIEzsMhbyUxws6?=
 =?us-ascii?Q?fadFJvo1E5nIMaeIRVfvXM7/grceuF9TJHAcYOMqWsH0DM0k7D0uhMl/Bxvm?=
 =?us-ascii?Q?TartNoZ4oJ1In41QilJ8bbo/NqmTmH0L5z0nvH2FUoQXINhqGN+tRKPUH1iB?=
 =?us-ascii?Q?JrFPK47SYq+VsSKqSXoUohk5LdDZFGDrzabZCNlZTv/JNDrUfGALB/ynNF0E?=
 =?us-ascii?Q?rTM+IR7fU4NjzCtxGNi+hmZazYqnk1rHghXKXbPMtsJN7UXzxxYqBD4sx7I4?=
 =?us-ascii?Q?LBAzo8GCQQ/djsV3IR1BHpZdQoaePjlrj7kC3yQiM6jsGO0w+yUQT+R2QKiz?=
 =?us-ascii?Q?GLJhQ8TG0fqkABhJ10fORHi0XFaekaJHFF7n745dCTrzkP2bJ/dBGqdRgMR3?=
 =?us-ascii?Q?ORiPHMEuhD6GfMClygzm5nBFenFeMr5WVP6sqb6iRGdeUBbgrFHX08WGQSdG?=
 =?us-ascii?Q?NCCTu3h0TSg2ReTDl8BH2JkjgrWBaAiqBYLB1o+G9LLxb6Wh+6KIUt7c3iTY?=
 =?us-ascii?Q?VFWVS0yhuJunspUqNYezDrVeWXcKxcgDXG+Z0cimNfrQA/2kT+bdWtmnlARx?=
 =?us-ascii?Q?63PghiJ15fgqvyqqHg4kx4YrCH2Fax9BuJLOET7fpsRQwk3t1z+l2X+02MQ4?=
 =?us-ascii?Q?qO67kXdPYaOfM67rAqhHj+ylMgYyLxPbCwLSdeeUfw50h/TOzMf9GX9YgbOv?=
 =?us-ascii?Q?TNZnTzVjG127sbor1lValXgVB5Fq3UleMROs7NKYdUqfzxcb3AMEzIf3noHp?=
 =?us-ascii?Q?KcKpdvOPoTESeigeYp43wYTa8OK2XkZKk7RfNh0tzS2B5yWfx+vx1kIdYyB3?=
 =?us-ascii?Q?X+veiKP3Ek8VoNPLiAxcMTHBRRmkCK/pehMLYW4nsXUFav8vuPa6oNBjHItG?=
 =?us-ascii?Q?Vx/u1yQAa27TLlHC9sVKAH7JhJ1R/79vUTlQy0dNl8OYwA1oyviRiqJWr2v1?=
 =?us-ascii?Q?1PRaKrcj9WkHbwvO46SdAoBrgS3TkQYT1D5emTsLsLTO5SLjE2gVYrXdDgZX?=
 =?us-ascii?Q?LvyAJA2IlBDP0BwwxYvJKG+6FdYppKZHeO80KWE5V8bOaXh81MpSj2X4tJs8?=
 =?us-ascii?Q?l2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pf+LT30QALWzIsTHHenwuQGrPFXkhWIQXtInb4uHdm5pQUz5qOhCB6XxnkZf?=
 =?us-ascii?Q?DF4lWcUXZ05RZ4EJBBqewYQss8FCD39BCT0nqYw+ie3Y7+8BAR6+XGDJZvBq?=
 =?us-ascii?Q?U2daXhZVFxBqYmFADIWPDDv6Vvyf0UFYN+xGg+yyy/aZS20S0Z/PCS7a+w+n?=
 =?us-ascii?Q?Z58NwHuudOvgHxKk0nyXp1TADCDVxtQapAtLVSgQt2z4frdOWXG8sbFpuDDZ?=
 =?us-ascii?Q?gw2FCXwoRWAglLM2AwwksyMwETuHy7YNJG3W86yEezYZpxw8naQJl3/Ql8DX?=
 =?us-ascii?Q?9UEGmm0bAAf3KeTG4W1sj4OjfYQyRwHkgrRJVdgTe1BiepiCtwViS3IzHgEj?=
 =?us-ascii?Q?tf4RsK9TcA72O0Fb/XfU8+LXr4WjOqfTtjHAIy2ZWtB05Wcc0QliZogKSDix?=
 =?us-ascii?Q?f0xiTM8C2nSZzzVQ6e9g8gqxQFaX302lfvemXa61Q+y3HWCf6sZC6nmfe1wE?=
 =?us-ascii?Q?CnutfWrYlaWTZUTPtetRG17AABBFCzMnIxbCNqdcWS9Lu4fZqs/QFKwF9j/m?=
 =?us-ascii?Q?bTBcGKcXNqo4/WrcX5h+qqPzO1g9YP8+9eMM5cWLQ3/P/ssmcmcFzhaje7/x?=
 =?us-ascii?Q?gi1wZdCIsQC0zpL4njq9qzV8I51OBleC8H9B0Pxz2voA2CwE/u444TxmZNpk?=
 =?us-ascii?Q?bIR3YnZ/DWvtzmEAa01nhoz9E94zngUwI0C84pVQoodRrgVSW261uJbz8iU3?=
 =?us-ascii?Q?p/LN9HNSOV2/TN9WOC/NXALc+KiOhetIn+uM3ZYT/xQKg0i9tK1zC/PH/1GI?=
 =?us-ascii?Q?0yO/hnpqgpgkDY+m1LQwheHV5CdlrfM24nlM6MDP12qjrOHGWbq1dIB176XM?=
 =?us-ascii?Q?dadfntuB8VrAjovklvKoW/47IsodRD6EtPfurU3uQ9Zc9lRnox0pVc71T+dh?=
 =?us-ascii?Q?nt90/czlKWB15kwFC7iqken/c3HfCMwfFot7HkA/KXN5wWwU6Sikfsmi9vhS?=
 =?us-ascii?Q?Filc0arbkOJm+oqqAeJpkJw0GETVWLovWriuWb8POOX2+hPTEsmivW6FPJYD?=
 =?us-ascii?Q?Z6saMVmDZAHeUOM2MM/UvtD/WmgyO5acQ8UFpA2IxPry+8CBQq2c4ND9ajKz?=
 =?us-ascii?Q?v5rmODjm0BSN7hmfWAAgYovGDWvWMBE3LWpAGEncunzUENOBp45c1cMRT2aJ?=
 =?us-ascii?Q?Z67JEVx7gxdcNrKALRZ3VZRKrpl/rehGU0LVir8+en+itt6DefDfnPHA28Dt?=
 =?us-ascii?Q?lgJlCo4FLULS2SvV/UsmiQOj9lA31BFrKSn/hOzaRa3fRHk8p2cJHbg1iNBY?=
 =?us-ascii?Q?I65tTDk9sTlOtcHSeq8zVW4i8l143/XFGl131XytwI3Z4djsAtbV986yJY9R?=
 =?us-ascii?Q?9fp0pLryXeZRxhZ9oL4OXclIIQqaDA3IEOlG7++eHSm/SA6veOjIwNLkEz99?=
 =?us-ascii?Q?ChHYhpmTcXD4soAp7cPibJXchcAgJSbNQVrTjaWHJ+3cKx7Az+IPewYs+LBF?=
 =?us-ascii?Q?lkABWKhUshC4J9VPSusqSSCcoLeepp1YKy7J6sv4NbiMDDE7/xWBKiHEM0sZ?=
 =?us-ascii?Q?LijJY/chjnBgWg3NQEFGwXCRvOjEdu2r6Y12m0+ZBLt/eEgIqRbazBO+kDMf?=
 =?us-ascii?Q?Bkt5CAWBCoR9UQeVssWpJrIZqSUU9vNfI0FWbtYoazNL29jTSfF7qOpl+cZr?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c344ab9-d09b-4c91-c97e-08dcaddee020
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 01:53:13.5974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIVDMg2bEhYBLFtpzOiD87t9k5hWZGmGzlWi6qOUJ+Le63B6RIxOgFNFq9lJZvJiOkQZElqPkbHCtRMiBblcczaauST/LuuQ7nm0/pkx9Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
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

On Fri, Jul 26, 2024 at 04:00:22PM GMT, Jordan Justen wrote:
>On 2024-07-18 15:32:47,  wrote:
>> On Tue, Jul 16, 2024 at 06:39:26PM GMT, Jose Souza wrote:
>> >> humn... if we decide to set both for backward compatibility, why not
>> >> rather go with v1 of the patch?  v1 of the patch documents that the EU
>> >> reported in EU_PER_DSS is of type X. Having both masks here doesn't
>> >> answer that question and requires that we always convert back to the
>> >> simd8 number (and eventually to the simd16 number) for newer platforms.
>> >>
>> >> so suppose 5 years from now we have simd123 (using arbitrary/absurd name
>> >> on purpose to avoid people jumping to conclusions):  would we keep
>> >> exposing the simd8, simd16, simdX, fooY numbers for the sake of
>> >> backward compatibility with previous HW?  On the other hand, the
>> >> alternative means: if userspace X really supports platform Y, it has to
>> >> know about that type of EU if it's using that mask for anything.
>> >>
>> >> So my preference would be, in order:
>> >>
>> >> 1) v2
>> >> 2) v1
>> >> 3) v2-with-forever-bc-between-platforms
>> >>
>> >> Both (2) and (3) have the silent misbehavior in userspace if userspace
>> >> didn't adapt to new UAPI.
>> >
>> >option 1) v2 is better in my opinion.
>>
>>
>> great. I fixed a typo in the kernel-doc, added a few more
>> Acked-by's received offline and pushed to drm-xe-next.
>>
>> [1/1] drm/xe/uapi: Expose SIMD16 EU mask in topology query
>>        commit: 7108b4a589cd6d3a2c1276fd610b3500f46de66a
>
>Mesa 24.2.0 will support LNL using only DRM_XE_TOPO_EU_PER_DSS, since
>this new uapi is not in the upstream drm tree.
>
>After this change, Mesa 24.2.0 will be broken on LNL. Isn't this the
>sort of breakage that the kmd is supposed to avoid for platforms in
>the upstream drm tree?
>
>Unless this uapi can be added to the upstream drm tree before Mesa
>24.2.0 (August 7th), I think LNL should advertise either
>DRM_XE_TOPO_EU_PER_DSS only, or both.

We have been through this discussion a couple times. It's just the
enabling for a new platform under force_probe. I had commented on that
in the relavant mesa MR, but forgot to click the button "submit review".
I just did. See https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30127

There's no support really in kernel 6.10, 6.11 etc to LNL. There will be
in 6.12 and distros wanting to support earlier version may bring the
needed patches back as backport, which includes this.

When we can support a new platform with the existing uapi we do, but in
this case we needed this introduce a new one.

We don't advertise both simd8 and simd16 because the platform doesn't
have both. What happens if it did?  Also in future there may not be a
1:1 conversion from one type of the EU to another, so requiring the
kernel to convert it for compatibility with previous platforms is not
very future-proof.

We can't advertise only DRM_XE_TOPO_EU_PER_DSS because then when we do
support the platform for real, we wouldn't be able to change it anymore
due to having a stable uabi.


Lucas De Marchi

>
>-Jordan
