Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6598CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 19:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6240110E059;
	Fri, 13 Oct 2023 19:39:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591AF10E059
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697225970; x=1728761970;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mSBQbgK0LtuXHhrR5Ka9uF/i6urrhBck05dYFuAvs5E=;
 b=jmMxmyCoZn868tduf4t2NRcAjskvCeMp32CLdHHc1Q1kpkWxzXdsMPf1
 Ja5JU9eeWSJcibIhe6QzUzixanCcIlp3Lp5zYCQjRDSsiEwN/7X1DuJuW
 Xd0S84TZQw9OsoxNXcoqID5kbf4JNbP2dKeOhi3F7T6km5K3AIrpDZ2M5
 SCFOzxdKRNPfPIOkX8qvBLpLWVuikGZUuYSKTduMXSYvXVD3P0LXEtvMq
 vF/5wUH3O4YDrrpl4gXZcpaVPeYgDXk8b/JsNHwkwjMjTmuGSYCItkfXu
 gzNdOA8jlIVUw7pyOle/WrOkmF+HaYdKmtYtxUaCB8i1vYZ2l66zqYArN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416309357"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="416309357"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 12:39:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086264283"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="1086264283"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 12:39:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 12:39:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 12:39:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 12:39:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 12:39:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0GHRzmhmZZf9QYOxhGHgiyEq5kMlK+tXGVz/8vFMGL/7oR04hVu5Jmjv0FRTrVVcua6jAxalooiEAT9KkroFrj88iSWaN3M9eJw3O13GnV9Nc1+8ZAzdYpXUa1kJgVeOUOalP3NNt+FXNRAY8nODvTSSBH/6uUELCZL5F7PkAVgGaZ2OqA6C3FHbBz9XgD+bS0j9pUqfWtIw+Isw5qcyZHkfEPR2wi/3T0uJdjJG5KtV+94SoNHTSye7G7g8oGm+6rmDEosP8RRIiXfJtpUHgzc+0XvNJ9ij1hzwsZ9y/7HBDH/gp3z8L0UhlCby7sdEiQRvmxwBr+Ze/4+yucjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1lVAHB3WHNeFoaabOBDSZIc+g8HcwtMKhZelNBouxk=;
 b=P6GGtbBDG4kWTNmSPsnDV/84UTtIjaJXVWDrePNbkIdLHzMhH8Od2/0Q85cHsB820+/L+fEf6GZaKmHCUMkW28pfDOVoZ7OIViTwjkOESpvdYnYm5ncsxx20o8yeJDrDkGdomoRFzk7v7sUQ18RtqEn0oBhZnUzK+FqaQV+XsstYeUqqVN4CEN1TQ7h3Te4IHlq3dyv8EWHlD+rN1igYIZvVD3tspxo7aWkK4sm/EAb/DYchY18/KCbH+Ket43Y99jJFQOUlzOb5P4ZXn0MxfpookJv6yD4Zb3RzkT0BDlnyhUwlo8qBwIX/KCwmpHIZ9nXJ9C3tGFc4kOlr22iPPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 19:39:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 19:39:20 +0000
Date: Fri, 13 Oct 2023 14:39:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <aps7rhxga42isxpjz2sliie2qui4qvrbv44ldyy7s2ijy4h524@j23azart4ca3>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-5-daniele.ceraolospurio@intel.com>
 <im557nhivgzgh4nqea4gczfkwqjh2trwrsfl45fensii6p54fq@2csdpghuqrep>
 <40bae1cb-dd9c-4028-94b7-0343b73bd6a9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40bae1cb-dd9c-4028-94b7-0343b73bd6a9@intel.com>
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d37e675-7352-458d-ad12-08dbcc241879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J8VC4HyXgoo3QEXj/fhtEubeb096oiT8A6k6jtm1cJhBFsiZ4oG75rGFoBW7JQGuGWMmRGrAP7K42uOXQftuNL+Xlk2Y2ulCC9yZNcJTgYGsLMopkwrxsKuJMcf/l37gaokIFULlPQ1EXQr3ws91nd5sZ9/7htfneAnZ7iREzFRwOvdW687L6RSw594kESmsjoeiouWoNHtf0sXO1vfDBfC3q3hH5tovfZShBVgrVOV3ZX8fNI+5ydalqOcCUlxWjKpwDm2YuO9ufd3DIKeIuJG6eD8Vp2hbl64aJE3roJu0OcZiZSNyzqqqjVA7YvoArqx9Y6+mnM27G70t4XKByZi223zun70v7AYZgtV0suhg71CObHvNHICWjRk3j9lcz6/FDHMQlVSU+AtKGzazltMBAoBE3O8OUUdZWka4dLgr3L2MIFEt7ZxlIHQ/ddTriCn5NI7KecKwgBKq5DxN0R8YCCOxSUUGNa+w/0ChSxmYxv9utZA+dHL7UfUtcS/Jnkq/Rj2V9UX9oLt1fTgVzAck5XKx8iaWPI6yVRXG/kBCykVkacWa1Y7IIYVtqRQ5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(136003)(396003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(26005)(6666004)(6506007)(6512007)(9686003)(83380400001)(2906002)(5660300002)(4326008)(8676002)(8936002)(33716001)(478600001)(6862004)(6486002)(66476007)(41300700001)(316002)(6636002)(66556008)(66946007)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RoLtelMEktU2U0Q8u2IsEEF7qHAR9msp+NM/ghNuGNmMrvqA+rPMItJyon?=
 =?iso-8859-1?Q?OgztVv5DZUCDwa6iwdClFukkuxOVd2lDXVRUk5ldbrJDkTIFBbSsXq+NSX?=
 =?iso-8859-1?Q?sOji6T8XmAZH2faIxbHLYVWVOwNd6tXzlC9l33ZjmR2s5J8IXiq2Ia+56z?=
 =?iso-8859-1?Q?YW+xiA1bR0scQaVvsfP4Dm77MWE3jzGZvfux8/u6jPVoT5cITHs2Tzb77S?=
 =?iso-8859-1?Q?h+5Y7dixr7fCGCF9goTMZC7sFAJ/HRC/fCn2YNfznO7ZAxoSRUAmJI+bbK?=
 =?iso-8859-1?Q?vYPYBZRvx5EwYONuffoU1aysZ5j7Rjk0dnBBNJBtuRVVswI5DBBORoMs3o?=
 =?iso-8859-1?Q?aoc19uR9HcLibrbAZFdTSQ05DYos20HGq0UOQhUztzczcvVoFQEUzBapIT?=
 =?iso-8859-1?Q?RRND7m06XMOB2xT7G8AM6OfIyY/LNpBUhEltMwbTwxmnztuZF/h04C0wEI?=
 =?iso-8859-1?Q?MpyWjGGPOGrRq8XfsK1a5/q6NwUbh3e47ISmBT3ZoN92r7EhzFJr1zgi1G?=
 =?iso-8859-1?Q?+GFl8zZ6V7lDwRA2ErWbeJVdMeydWOpZbb+oLaYXy8NPIPpBK5iB8gcY49?=
 =?iso-8859-1?Q?+aYgcJpvL6CS5TJHGOTrQOsU+lW3/X0c4NCQ+w1G07RHjQdjG/LdJ0tWct?=
 =?iso-8859-1?Q?SY0iFLdzLEpCHoEEsoHtytNmd6GOIZQ2+MNTXGZDN2ghyr0CTFx3cV9M+e?=
 =?iso-8859-1?Q?oOoH9IEDNBllrl2neSdM4mZvcMVu2xK+It7EByHH294rBdaxhKGwugj9t6?=
 =?iso-8859-1?Q?OZbRkvkIn0PFobhE/NhefuNerQ+9EdqjpfKf436OHPnnz2QUqqh0VcfcGF?=
 =?iso-8859-1?Q?8ci37WP1aYyB5BM/gFHF+c9Pdf9BAHE53HDSatZnQGWMzD9ymWl2ai/ufZ?=
 =?iso-8859-1?Q?lSg0rEMDfteYTGygFyE5QU0k6raj+R01mpkpoaLR0x/c59ajNeKl7mpcD4?=
 =?iso-8859-1?Q?W1Xr061RVTfaR677l5m+zDJr3p8uzOahZ6a5vyK//+DySeAoj5ezQ9kHhs?=
 =?iso-8859-1?Q?+HxO2Q3AmhSRtzgSpO0xitbbpmBG2nuI/rJEAmtzyitfN3N2RmIt4Byfcj?=
 =?iso-8859-1?Q?eKyoHN1V0PgMQ1nrA/+gDf/x6tZtVdzuXUfNMu59JjyMoimB2MxjAqK52T?=
 =?iso-8859-1?Q?Bx7riocYLJwJCuKL71SUAd4sQm/MLel/O1UsuDR4Su3J6moTqX6USd7UD2?=
 =?iso-8859-1?Q?W5f3vRH9yAq+/mifxhmxa6g11pVxO+G/voggcMSj0ICFTPkl2NabGgtAW2?=
 =?iso-8859-1?Q?OrLm7RxI+zAaArO4fxY8hCIFWEaDq7fRbnRaqQ9rZ7OAbrRYZ2XzK+xW1e?=
 =?iso-8859-1?Q?JDTkxs5hHJD4GEgKI7yU8WC1Hu4qYnbOyQmOccxeRWyxhrsnwBbQ6oMdeZ?=
 =?iso-8859-1?Q?B+swUeHuzrIJ1498lAUngj8b768uy99btQk6pgmwtXwvd+oRbdkYQMmFUY?=
 =?iso-8859-1?Q?qSM4y7LE+iBra7vm2QcF+alVQgye51FnJGPOTux2Zdkv6C2Idz7TiS7W5Y?=
 =?iso-8859-1?Q?BXGAeZ1Fo/4tKpz9F4F8MZQ30wa2pIau/q/ZuYJOMmRIXGtXoaBC1ePmBW?=
 =?iso-8859-1?Q?oEeXoEoHKljUkW9PByZ8T48WZfA+dlBFLWEmPj43n/JNJUltADF2aXJRiC?=
 =?iso-8859-1?Q?jSqcon4n9aJjdqqGnmqYcY7920n8ddhkbRjCeCnOH3NGCg4/plYkuN3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d37e675-7352-458d-ad12-08dbcc241879
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 19:39:20.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maHnD501LDhbhCsDQVMDGSirLy0WD01+RzhIYSnPnEfGFtsH3XrcP0jOhQHp9ITDhlsGQxhUSCfxI4p3OFO6A/qKpXi54MlE5RsQmDwwCAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/huc: Define HuC for MTL
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 11:28:28AM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 10/13/2023 11:14 AM, Lucas De Marchi wrote:
>>On Fri, Sep 15, 2023 at 03:34:58PM -0700, Daniele Ceraolo Spurio wrote:
>>>MTL uses a GSC-enabled binary. We expect all GSC-enabled binaries to be
>>>defined with a "_gsc", so we can check for that in the name to
>>>determine if the binary has the GSC headers or not.
>>>
>>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_uc_fw.c | 17 +++++++++++------
>>>1 file changed, 11 insertions(+), 6 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>index f956457d0b11..4e43b16a61d5 100644
>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>@@ -113,12 +113,13 @@ struct fw_blobs_by_type {
>>>    fw_def(ROCKETLAKE,    major_ver(i915,    guc,    tgl,    70, 
>>>5))        \
>>>    fw_def(TIGERLAKE,    major_ver(i915,    guc,    tgl,    70, 5))
>>>
>>>-#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)                \
>>>-    fw_def(DG1,        no_ver(i915,    huc,    dg1)) \
>>>-    fw_def(ALDERLAKE_P,    no_ver(i915,    huc, tgl))            \
>>>-    fw_def(ALDERLAKE_S,    no_ver(i915,    huc, tgl))            \
>>>-    fw_def(ROCKETLAKE,    no_ver(i915,    huc, tgl))            \
>>>-    fw_def(TIGERLAKE,    no_ver(i915,    huc,    tgl))
>>>+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)        \
>>>+    fw_def(METEORLAKE,    no_ver(i915,    huc_gsc, mtl))        \
>>>+    fw_def(DG1,        no_ver(i915,    huc,        dg1)) \
>>>+    fw_def(ALDERLAKE_P,    no_ver(i915,    huc, tgl))        \
>>>+    fw_def(ALDERLAKE_S,    no_ver(i915,    huc, tgl))        \
>>>+    fw_def(ROCKETLAKE,    no_ver(i915,    huc, tgl))        \
>>>+    fw_def(TIGERLAKE,    no_ver(i915,    huc,        tgl))
>>>
>>>#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)            \
>>>    __stringify(dir__) "/" __stringify(shortname__) "_" 
>>>__stringify(uc__) version__ ".bin"
>>>@@ -207,6 +208,10 @@ uc_fw_auto_select(struct xe_device *xe, 
>>>struct xe_uc_fw *uc_fw)
>>>            uc_fw->major_ver_wanted = entries[i].major;
>>>            uc_fw->minor_ver_wanted = entries[i].minor;
>>>            uc_fw->full_ver_required = entries[i].full_ver_required;
>>>+
>>>+            if (strstr(uc_fw->path, "gsc"))
>>>+                uc_fw->has_gsc_headers = true;
>>
>>can we rather get this from the headers / magic or whatever from
>>*inside* the firmware? Relying on the filename IMO is not a good
>>practice.  If we don't have a proper way to identify, then I think it
>>would be better a try/fail approach starting with MTL: try with gsc
>>headers starting on MTL and fallback on error.
>
>There is no "official" way of knowing what type of headers are on top 
>of the FW, but the GSC headers start with a marker, so I can check if 
>that's there and if it is not we can assume it is a CSS header. The 

that sounds like the normal way to identify file types... check a marker
and adapt the parser according to it.

>cons of this approach is that if the binary gets corrupted (which can 
>rarely happen) we might get an unclear error through the fallback.

I don't think there's much problem with that... if the file is
corrupt, returning an error in the gsc or ccs format handler would be
sufficient, it doesn't matter which.

>Would this work for you?

yes, it seems better.

thanks
Lucas De Marchi

>
>Daniele
>
>>
>>Lucas De Marchi
>>
>>>+
>>>            break;
>>>        }
>>>    }
>>>-- 
>>>2.41.0
>>>
>
