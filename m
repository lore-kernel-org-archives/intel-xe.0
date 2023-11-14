Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6918EC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 14:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2919410E0A0;
	Tue, 14 Nov 2023 14:38:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF3F10E0A0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699972700; x=1731508700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yEgZP9cOm+fqHxWX4WeYvVFM2L1yx7/4tK6f0SlYFEc=;
 b=HnCo3HAPmKv0Kj6/DaSEFFzJxOfeIaxidTC6Q1IencLse2v68JNpWBZQ
 9CqxsoycrNBOxVhR9VWQMLbaJzOrumjiF+Z+zWgKQaBF6DrC7rBPnWFxf
 Fz6vFNx3vF7PJQjlAhZoALVeXDnjKWSkRd42uM0FqxTCjXAgBlTyrauRY
 Qxr0DNpIJIDYBFAxBwYHFZBfBE9nKgVyVWFHkg8AtLHJPlDHSU6plHIsB
 c8aYtcGQL8l5IPQhAlaqfFkoYGVfFhxBWFte5W+tylpxDACSbqCr/MAmR
 awcHjWErSC8LriUMSZfpp5LkA3/l6YKWWynxsarjJNwNfJosb+J7OA7V4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="394580162"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394580162"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 06:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="835040004"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835040004"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 06:38:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 06:38:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 06:38:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 06:38:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9bKSevs7H0pR1cO9F0AJWprqMFZInKgh7fFpL7DtTaegcSVbS44HfS9nqBnTa6rcT1z0nTypm4AU9YmV4ZFaYpmqwMxF0eDuTX71UcWER9ueilJrGdp66evgfyt5DHkRk8lGj5oTh2LO/krJvLs2GmRBx5TU4FJc9UQTGR12qmeIa+K4hlOaWe6hwF2BcPxsyTrXNOgyDK4eAXtAXtIneYno5VMmRVt2F9KsCweI/Cw8Izt91eN0L/vf1bz5Eaxg5iRctgVnaxb9cVTcx9MJZ7dSxFZAecQZ0Ywl/RWg9/IRFWW5Rmnapk+KcAiADwZUvbQYs0CPapPRpEs+1jlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DiKULHeb8rzWLfZ4KzCCNHgxEGPWLpOZnZNKlRJOWk=;
 b=iJM5a8HGXGt1gMAfLBC7cP+D6pWa9TtYEu60+RLZDlPzT2kw0L3RooMyA0+2tKI5nVFg6D2FgovJHjPDYfviHEeZa5rw5ay8HnoEtiBwg3/K0NOYiUTT+Xl91O5koq+CYkxtVgWrEYkhrt2aiXh03Uw/KbSn8dqefeKGS/YBRRoUvumHYrVLFD1zMxAeAL1bp5pGOaJ2J6TihvHRaKAvqjRi8nxynU5utFEp8i7uUKOyrOJPTnjAjQDXTTHVJT4q3VObMahExwOKyFKogZLMXfPmOIZcfMoVnayU8k9wZ4FI/ZImBn+4KAGjuxqxZbyem1DHe49Nj6wNUKohLfOXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 14:38:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 14:38:12 +0000
Date: Tue, 14 Nov 2023 08:38:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <2nmoyfurkpf7vgo47wyxyo7x2vek3rrnjmybs4rylryeqxeon6@55va7jegsvdr>
References: <2260c6b9-6d62-e8c4-a588-d7ec163ac166@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2260c6b9-6d62-e8c4-a588-d7ec163ac166@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: bad06765-b8e7-4100-7be2-08dbe51f5465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6jCHULjD1g06cxqcbkh8gIYkgMd+TclFmiZEQLnLSA3h14e8VjR9zCISA1j1xbNr7I2xuviYBYWJqDa0bRGUz5Sdd+/VT5vUJDON9yUPdHFkhOxwf6P1r48ZEibD/kgzNuEmR5F6KpEguoF+CfrYzDB14uhT8YUtZKxRpBNXqgOyEbIejm5ESvZlM4nfJcmd/gEimn7ugJsYTTC6ty1AFYCjDkgrI8foXPDrNytj5anAx3W0iKn1Oa9auIQw7R6V7nznfxy03lp1AWWnnvZVuZuLZvs+v6lxOgz67behC/pYk6XM4I0VmquSGNhTQgQv/SLhr7Wv6b7unE/L26HVPdvF46vXBrD3pLUn0ivD9Bn8KVyCBdX8JABJwk8eY2B+aseD7vdfq5v2p7fKhYC+rhTlmwSYR/t3hUnF2wRdZcRYfbv0zOoOUMQ24XL9pVlXOXrtxTw+yxiQST2VjZV5bOX6yAEMhOx571zGJ5m36gQUOTbIeM3MGiHkV2ey1J7OXw0hv4dD77EQUj72DTiFBmwwmf2sVlqODIN310RrHk/6AFn8sL5WsLsZGwThg7nfD19QHECIezJxdSfpArc/dNVlpBE7I+haLp0Qn2thY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(33716001)(3480700007)(26005)(478600001)(66574015)(6486002)(6506007)(66556008)(316002)(6512007)(9686003)(66946007)(66476007)(54906003)(38100700002)(6916009)(7116003)(5660300002)(82960400001)(8936002)(4326008)(8676002)(66899024)(2906002)(41300700001)(86362001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MPBZVXUJv2KtKwFWT/y/5KJjWJ7iXxXBh8pgPlCX4lSyw6EH8cjzsMRJVJ?=
 =?iso-8859-1?Q?iupAKzN3WVeU852WUuRXESHHQ3YYyX3dQc3KUaTUX49dQCyYaRBQB5r6oI?=
 =?iso-8859-1?Q?DRTBkMaFpAczb20vSaBhXNzlpGrPJsWGgCABDVDfefnagQTEDwBjHd0jxA?=
 =?iso-8859-1?Q?vgW8nIG/O5k8IGkOLNl7g+w7CkPUVDtemU+VSRQabIXyji/+G0m41TF//U?=
 =?iso-8859-1?Q?ztRQBQl1YsFu7Cn4QOhuc/2mTjnkdmuD1Rsa+xSeZYgJWISaPgTC6l+g3T?=
 =?iso-8859-1?Q?ZKDsdYmgZKMKb9oYx43MArl/x+RVV8/KqFO/2DkBfxnaM2lVCuwl55kRJu?=
 =?iso-8859-1?Q?TwR128lAU8FR8dbhTj/IHU3q6+iawMM8z7gS2BGDt6GLIPiOMxIcdkl6md?=
 =?iso-8859-1?Q?tKfIPVpQvE53t3hT2kiAL6OjaivarNvTwTrfFtVGMyKX8WG+9lb2Q0HXDU?=
 =?iso-8859-1?Q?6SQ7MWgGSbRVVFeQRqU3qM6KE81moO/MUnfkXgtT86RWOPh5yZKZztGEb9?=
 =?iso-8859-1?Q?DfvF/bcdEtdMU71SLwtYV/+qSRE6wOcHd8YJGodmB7ay9w24bKVlDYsrjR?=
 =?iso-8859-1?Q?rQMx10ZJP8iPDxO7B2InX35ajZQUQTgX/Wde9VrXMmfmihtiqsG+biwVW9?=
 =?iso-8859-1?Q?cGz5nYW1tVGKvp50hSO8DMmHqkgd1kgTYDy2tcbH3WsCjNQjEEZR3xYmLn?=
 =?iso-8859-1?Q?LuGrVTuuv8h4JdR3jynBqXZZ/LXDfKiyFkdnbqKe2L7Hkoxe0KZ971RTz1?=
 =?iso-8859-1?Q?yPuMQWom6JZcIN/XdLKY4XFy61xg9F+o7uQO/pY6WB/zoyXDXvU73UogFN?=
 =?iso-8859-1?Q?7YYo9s35+lTzZns4txdy0b1vwfWApN3for3KU9pZIbM85JLPNAeFRZ9bb3?=
 =?iso-8859-1?Q?qcrsBuL0yXVvqeRFEn6+XwnnRZhMk0CtXgV6jrV66ninW7pytvDH9+H/QS?=
 =?iso-8859-1?Q?gMHQGZFdhffx7mXbagSckC2YQh8wOk8GFoEBkpNvAaAgDE2xH0x0Xkd4AA?=
 =?iso-8859-1?Q?2TFyGTh7M2qklmPWgT96pWADP7ZfkRb7Gvo/fOlyEN44O4pD1YAvHhlzbk?=
 =?iso-8859-1?Q?gQYDVBTjY/pqt2nMRWcFZSJX5FrE/4Va3/k7PrpTq+0jd12At5xZb31O/g?=
 =?iso-8859-1?Q?c5JZp7ISJsP/bL6LgHac+lGdeExVdsLyK2Ny9v9q9m6R6KKbrIDIhCbQQo?=
 =?iso-8859-1?Q?huO1omb2x7Ppv0OLNrdXk5io7VoFHNyfIys2pIm9PIkYt64sGxxPtdY1La?=
 =?iso-8859-1?Q?CPSZ9hSWtvN+jWZ90BtfoyOI7WsvWw5zLCSpjePYWysfmfI3hBvOEs6lZg?=
 =?iso-8859-1?Q?Pke5bxNtpqbrg3Kh1RCTA3abBZHuLis7pDPjIMVURt5K2JPfp/V2swKTHb?=
 =?iso-8859-1?Q?bCAEXPD9PUJhCLdTNVlMf+owgB8goKptfeBHT8Pvsk2w9wTH+Do9LMaap0?=
 =?iso-8859-1?Q?3t7Zz9/fKsKq1hG6PnYqQrySVh+1pcfGNVWDWKMN26O7ZIh/6oA7O87Fpz?=
 =?iso-8859-1?Q?u9Kl9Z3USvBLBFuji8Vw9HvUZrNHYFZJ/DLkFb+PLEedDCWZF9zHtMFo55?=
 =?iso-8859-1?Q?THuGz+Kdxj5OpZC8lXCLKwyz3oTZDfaCxJurJVHWMYaE6mw2V9iGcFOQe3?=
 =?iso-8859-1?Q?OUlFMgIVTUP2XBQ4RiYfbyyIf2VPHx1AOyHOZK8/wM5MtdO3FLDuAmVw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bad06765-b8e7-4100-7be2-08dbe51f5465
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 14:38:12.7835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaaLkmSK6PcclbNOpPIc4LPS/NvFAKImVDB2Y3Mtz9lpBOyDk2Ks9SH77VqtVJYS4cxSZ+lCPK6I59I7JXjui61BjmmI8b2jwzvyLAMTAzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] PT encoding ops
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:48:42PM +0100, Thomas Hellström wrote:
>Hi, Lucas, Matt
>
>IMO ideally we should try to keep all page-table-encoding bit 
>definition usage in xe_pt.[ch] (or possibly a separate file if we 

note that ggtt also has a different encoding for the entries

>expect a lot of hardware variation). Currently it's in xe_vm.c, which 
>is intended for higher level vm stuff, although I didn't succeed in 
>separatating it completely. I sort of stumbled on this while looking 
>at encoding a single NULL mapping from the xe_migrate code.

I stopped the abstraction where it is since I knew there was already
work going on by Matt Auld wrt PAT indexes. I agree some of this stuff
is incomplete.

>
>Do you think it would be possible with only two ops:
>
>pte_encode_addr() and
>pde_encode_addr()

even pte_ vs pde_ is kind of a misnomer IMO... pte_ is about leaf nodes,
and also encodes a pde entry. 

>
>And the rest of the current ops would simply be non-hardware-specific 
>helpers that called one of the above. Those helpers could then be 
>placed in xe_vm.c and xe_bo.c
>
>That would mean a set of generic (non-device-specific) flags:
>
>XE_PT_ENCODE_RW
>XE_PT_ENCODE_NULL
>XE_PT_ENCODE_DEVMEM
>XE_PT_ENCODE_XXX

I will  take a look and get back to you

Lucas De Marchi
