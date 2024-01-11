Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D456C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 14:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2875F10E908;
	Thu, 11 Jan 2024 14:15:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA7F10E908
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704982513; x=1736518513;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=2Ns/ZYirA7nO7DMtyEtZzSkqak2QGpSrRV8t4SJAgPQ=;
 b=dMCrKz8JSVTeCwD91sBRw0k0n0dyoEo0h9fjnrormBDqsZ9YZ6POLhI2
 uaTCX/GDJ+THR8wPwn/khtAihD+VOu4zReNfl1GUs6d0Lzjn1mdTjlGiR
 5QwGrOdsty4TD3S2L4JVB9ikjy5RQjayKP2AN/FIiKxXkTTMBmW99R+U3
 dKOXmoKAxIPymCGHdCrR2K4d+FGB96RzE6pJN1BvKYsPOczfbWW59ARUM
 xZh68U4y70xIQtYGDZJET8v/eMHEWbWrs0Sh2HgZNIpbTcz22nYTQP84z
 BIALhyfcbQmYbZILJkl4iy4HvJR/4yHSbSdi4HUrkDeA8Ovn04ScrX1+c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="402630543"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="402630543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 06:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="17054446"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 06:15:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 06:15:11 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 06:15:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 06:15:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 06:15:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2sQ8siO1RuVpM+iOS7d8ezv8/jnWn2mlvoaeef0SRUNw4T9k9lTJhTd0ZrGCW1TXNqJj699NU5iQL1u09aSUKe2D0FrdVgS1yPjW0xPMiKg0JiWMa+7vB8f/xRPkBkFXkVSJiFHmDVVETuDH7lJ2r/g/2ppjBGYynm2KlH8Ci41/hbU9rRaXfVQs/xKUGfd3IQLsNRpOfuTkj1xNRN7x52CxkCM7fQJW0Q3akk5wmwqWwhJNbomyCHVEKlKutxDs0x5tEpehi0bGMy7LiPhhOCOtiYOBxKdr/rsjh2gMhPrjNhpRBw8Odao4HU3ijlrjDwn9iwoYPm8z1FnY7LEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtzaKoOlrsJHEGUgh6ogZdekOFMULSZRAvPg+wLesZg=;
 b=HqJ6wpfh72uUz/GdJKlHDhHfQCP7/PMFoeuILdc2+sDDc9DvtICyZC61TZUF9qBFD25aLULMz8WWhhSuBKZh904FoXUKVY9yDNcHc/MmjWbB79me7yOrbOq2qVD3s2+x/5d8Em0jrYqsE+5tLbAD48uxqMB7AKI2YuS2wx5AhMnFoczRz++YEWIO02tjT4et67b8XFTuCtvqQOFa591luQ7PtBxueVMcPYoIZcKni3o/vhxCVQVyH/kem48RHcQ7iRhw7UNOS/nJDFXlwvMsNF1BxVWANHt8NlkYEuHC/iXo1MbrORiYe/1S9SfR7U0/hKc/Iq/i53hZtgZLEPkcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 14:15:09 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::548d:406e:673:7c9a]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::548d:406e:673:7c9a%7]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 14:15:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240111091622.1110799-2-luciano.coelho@intel.com>
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
 <20240111091622.1110799-2-luciano.coelho@intel.com>
Subject: Re: [RFC v2 1/4] drm/i915/display: add support for DMC wakelocks
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 11 Jan 2024 11:15:03 -0300
Message-ID: <170498250383.2198.10326936404611559848@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR20CA0035.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: da30c247-1f58-40ed-a93f-08dc12afb784
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LaUrof7eNW4/grXFB1e/Z50ZLRFPl/KQKYfrGjGUmUQSTnAcOaQTzqlyZohhQt7+/MtnNmWVJKJLTpVWdgitXF7CIlokbDOZdLevuy4Ana3vD0cg8B6NLABWVf7X1Pr4N5GtkkbNenqUWmpJjfOsOLetOzeSZFQKLyivSUcEDoMLVnVIZMqOqiy6N3WwNS90KVLQo98P1WpIOhUYyhd3kZgBB+HdFahnjcyw0i5i3m6C3UwxVNZ1H3ZdGbyki0J7xfc4DJIJnJZIZqLjNllfa4aHS8gp4z/7mdnOuOltTOR6sr41zK3E0Yf+xcEFsaxFBOLIMtxqA7caYYCSZ6NeQoWjiKzCmbzV+K9nmQElKqQrZAop6ZsKSM7+QhbxBkhguw7VD63iTe2W7nGQaGwlJt3VWF7VhQruBKEDBUDT6DGjSM/MqyyGCF7J4STGcpp5nsqmKuRgfc5gr0mszoHuWDMPdLC/Mjpz0PRk1Sl4Ezfk86QAFN2grpDZqTDgRO4uDSMjF/HhlhCkWir++TxV5ZiDQ4TcrEK7200x0GX/nCKJTu74XWXTRAHWxg31q14j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(30864003)(2906002)(5660300002)(33716001)(41300700001)(107886003)(26005)(478600001)(83380400001)(6486002)(9686003)(6506007)(6512007)(6666004)(82960400001)(86362001)(38100700002)(8936002)(8676002)(66556008)(66946007)(66476007)(316002)(44832011)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW1VYTZUNDg2RDA3M2h6VzUzSHQzWG84T25JZ2NxSmpJdUwxN0JhUU5LMUE2?=
 =?utf-8?B?SnZTQW4velVUVFZ3R3lKVXVsdnNwbysyb0NjNkJyRFgzcHo5YzZnRmJZWWpC?=
 =?utf-8?B?SHN6aVE5ZGtCaUNNQjE3dzlXU1Vsb2p2RW55K2NVY0l1bFpjRjE0dlRldjlP?=
 =?utf-8?B?dnFiaGdLUlRsNy8zL1ljaDdIOCtXRGlZb2xoenBlN2xmVlVaUzZ1dU14V2dJ?=
 =?utf-8?B?ZjJEb0Nyd2w3Y0xtS0I4WCtleklWUEY2MFpKeTBEU2xma1VqTXRsVDRzWExp?=
 =?utf-8?B?ZnNNYXhkdmxLS3JJSW9rZVhFOG1VeEdVM0Y2dmtObWN3ajZWV0Nad3dpNHNn?=
 =?utf-8?B?cHF0UEY0clprNjVESmp5bXM5ckVtdC9LRDBpcjJpaVpyRU5CN1l4NmhYNWpv?=
 =?utf-8?B?ZzZocHQrd0s1V1ExUUo4TFh3cElXYkpSNG1YU2kxYVRmR3NSS1RCWmlaZjJm?=
 =?utf-8?B?Vk9HcnJmVUpmazBFMVU3cEd3WncvNXo5TTBDSmlLcTBueTlJdE8rcjFIVWRJ?=
 =?utf-8?B?bGJnZTFpQmttTm8zWEUrNEZqRXViZnJaU3RWdjlpbXcyaXJnbUZPeEV0OXA1?=
 =?utf-8?B?bnhrVUtpcXo5YS9zb2ljU0JPeGlkdkg5SGNHMFIzUzdVOFhrWnpKaWdaWW8w?=
 =?utf-8?B?TmZvQ1VsY29PNE9BZFlSNk5ZRjZGdmNJaTFIUHN5aEExYWd2U0trRG9oTmgw?=
 =?utf-8?B?bkZ0SHlvcmlnRC9GRDhmeFY0d3k2VzdVSkhVTkVDSUtUZ3cwSUZPdnI1cURk?=
 =?utf-8?B?NWc1QmZSNDVnUDlLSWEvSUNBNW0rWkhkVGMwa050Y0g3aDRLd0RrZmtPc0Z1?=
 =?utf-8?B?eFl4MmJWazh2L0FTcE8yNGNyZFhDWFlNbDVDSTE3SDVoTUZEbmpyVnZndThL?=
 =?utf-8?B?alVIWVhHRHdMd3dPVE8vTktuK0NESEZSOEN3ZVZDMzdRVWdHMUhPYkZRV3RQ?=
 =?utf-8?B?a0t2RHJGUlZRZ2VWMi9LdmpGLythUFVKYWVTRDZWZWYvQVVGUEN5QkRqWlFI?=
 =?utf-8?B?QURzY2VtVWxYanFvWHRybmdTUmdFcThuSWo4OWJQUFhxbUZEUWJubGlIeHZD?=
 =?utf-8?B?L0pXQmwwU0JoU3J4UHBhdm1BU2NCSU1JVmkySldWR3ByRldwTTFUWFlrT2NU?=
 =?utf-8?B?V2luY3U2Z3h0TXZSRDExb05VSmoyZWs3U3JxVEZlQmQ4cFRYT3dCWjFVVTRk?=
 =?utf-8?B?bHh2OUQ3REV5VWxhcjZXOEJSeCtFWjRlNUF4a0Z6c3VYVUhwbjdZRWpRcngz?=
 =?utf-8?B?SlA0d1BBL3JnWXd4bUYxS0lFejFqM2dDek93RzFmTDh6cE9HWkFRZy84YUJp?=
 =?utf-8?B?cDRJb0ZlVXMvY0NFd1JwYzVjMkp0WHFnSExsc1dpVTdocUtQR1VWLzdRSkJJ?=
 =?utf-8?B?dUhIa0NYSUtCeWxPNis4NUZyYTFwZzFrMnFPcEdESlU0RDBqd2thTDhwVmFY?=
 =?utf-8?B?YXBlc1JFaVRWNmJoa2RsQkdmL09kR0d0bkNQVkZqSFNjMGMwKzZ5Si9UbHpR?=
 =?utf-8?B?dFEzK3E5Z0hXQjB3dU9ISm9semdtSk5ldlFhRXVRM2FoMng0SXAvU2g3TEkx?=
 =?utf-8?B?Y0hQSERCcDJXYW1CUE0yYS9XK1Z5a3FNcTE0VW45aG5RQ1BHeDdiSjR0SFc1?=
 =?utf-8?B?TmdjYTkyNzJiVGhGaE9FWmNSTzZYYmxLUnBzMFB3SG5RdXFidDV2TEZHU2I2?=
 =?utf-8?B?eFQ3Q3luNlNBbllKd1FMZ3B6MGo2VHR0SzkzZGtNQmdCc0xCay91THplUURU?=
 =?utf-8?B?Z0dSWC83TVVGNTUxWVlMdkZGZHhmT1FRWThwRE0zUzNjN05hU3RUVjZmbjFr?=
 =?utf-8?B?K08rcWpDTjVIQldsRXNldktUNGNoZk1yTFZNL0FKSWpZUXE0WVZ5em5CT1NU?=
 =?utf-8?B?MjN0MGZyOS9KY1daSk5keDVsc1JGRDRWOWwxbWFaQ0xySWdHVWNqRVFOSita?=
 =?utf-8?B?cG8wZ21sSEdQanFnQ2taT2xkTjJHQXlnWkJwdG5tanhVUVRrMldKL3pSUVU5?=
 =?utf-8?B?Y0loWWw5UDVnbldNTHpmN3JKRFNBRGsrNHdkNW84MTk5cVBLZGpjQXg1dUpz?=
 =?utf-8?B?SWI5SkYxNUNMeUk4eUZQSGxLK21iSjkxeEVJMzhSeHlyVFdjaGZJS2c4Ujkr?=
 =?utf-8?B?TDNCd1FHazFPK2hmTkdIbFRjbmpDK2RJWUFoM1c3N0JoS2pPQ2VlVEpSYTds?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da30c247-1f58-40ed-a93f-08dc12afb784
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 14:15:09.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etQVIpQwFmEt7kn7UwRso/1XoRtVIIzG5m0/8Bq44cKwIvmKXaODBiyMUdBuz0iY5axP9tnOgv6fWTNi/lAL7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Luca.

Quoting Luca Coelho (2024-01-11 06:16:19-03:00)
>In order to reduce the DC5->DC2 restore time, wakelocks have been
>introduced in DMC so the driver can tell it when registers and other
>memory areas are going to be accessed and keep their respective blocks
>awake.
>
>Implement this in the driver by adding the concept of DMC wakelocks.
>When the driver needs to access memory which lies inside pre-defined
>ranges, it will tell DMC to set the wakelock, access the memory, then
>wait for a while and clear the wakelock.
>
>The wakelock state is protected in the driver with spinlocks to
>prevent concurrency issues.
>
>RFC: this is still very rough on the corners and, for now, we are
>only handling RMW cases.  The locking mechanisms still need to be
>fine-tuned and verified.  Additionally, there are loads of logs that
>will be removed and things like hardcoded delays when reading ACKs
>will be changed to proper waiting functions etc.  We are also using
>dummy ranges for now, but these need to be specified properly,
>according to the bspecs.

Some comments/questions:

1. DMC_WAKELOCK*_CTL registers

   I see that, with the current design, we use only DMC_WAKELOCK1_CTL.
   Do we plan on using the other available DMC_WAKELOCK*_CTL registers?

   I would agree that the refcounting approach seems to be a good one
   and maybe adding the complexity necessary in the code to use the
   other ones might not be worth it. I decided to ask anyway since you
   kept the definitions here.

2. Enabling and disabling

   I think we shouldn't enable DMC Wakelock as part of the modeset
   commit.

   I would assume that enabling DMC Wakelock should be part of the DC
   states enabling sequence, since the former should be done prior to
   the latter.

   Also, aren't we missing the disabling counterpart for
   intel_display_wl_enable()?


As an RFC, I guess we are more concerned on the overall design of the
thing at this point. Nevertheless, trying to help, I decided to provide
my 2 cents on the current implementation below. I hope it is helpful.

>
>Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>---
> drivers/gpu/drm/i915/Makefile                 |   1 +
> drivers/gpu/drm/i915/display/intel_de.h       |  16 +-
> drivers/gpu/drm/i915/display/intel_display.c  |   4 +
> .../gpu/drm/i915/display/intel_display_core.h |   4 +
> .../drm/i915/display/intel_display_driver.c   |   1 +
> drivers/gpu/drm/i915/display/intel_dmc_regs.h |  18 ++
> drivers/gpu/drm/i915/display/intel_wakelock.c | 191 ++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_wakelock.h |  34 ++++
> drivers/gpu/drm/xe/Makefile                   |   1 +
> 9 files changed, 269 insertions(+), 1 deletion(-)
> create mode 100644 drivers/gpu/drm/i915/display/intel_wakelock.c
> create mode 100644 drivers/gpu/drm/i915/display/intel_wakelock.h
>
>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>index f7d13a7dcd63..1738305b8c15 100644
>--- a/drivers/gpu/drm/i915/Makefile
>+++ b/drivers/gpu/drm/i915/Makefile
>@@ -312,6 +312,7 @@ i915-y +=3D \
>         display/intel_tc.o \
>         display/intel_vblank.o \
>         display/intel_vga.o \
>+        display/intel_wakelock.o \
>         display/intel_wm.o \
>         display/skl_scaler.o \
>         display/skl_universal_plane.o \
>diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i91=
5/display/intel_de.h
>index 42552d8c151e..0597ddf49f70 100644
>--- a/drivers/gpu/drm/i915/display/intel_de.h
>+++ b/drivers/gpu/drm/i915/display/intel_de.h
>@@ -42,11 +42,25 @@ intel_de_write(struct drm_i915_private *i915, i915_reg=
_t reg, u32 val)
> }
>=20
> static inline u32
>-intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u3=
2 set)
>+__intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, =
u32 set)
> {
>         return intel_uncore_rmw(&i915->uncore, reg, clear, set);
> }
>=20
>+static inline u32
>+intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u3=
2 set)
>+{
>+        u32 val;
>+
>+        intel_display_wl_get(i915, reg);
>+
>+        val =3D __intel_de_rmw(i915, reg, clear, set);
>+
>+        intel_display_wl_put(i915, reg);
>+
>+        return val;
>+}
>+
> static inline int
> intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
>                            u32 mask, u32 value, unsigned int timeout)
>diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/dr=
m/i915/display/intel_display.c
>index f15d238ce579..318757af3905 100644
>--- a/drivers/gpu/drm/i915/display/intel_display.c
>+++ b/drivers/gpu/drm/i915/display/intel_display.c
>@@ -115,6 +115,7 @@
> #include "intel_vdsc_regs.h"
> #include "intel_vga.h"
> #include "intel_vrr.h"
>+#include "intel_wakelock.h"
> #include "intel_wm.h"
> #include "skl_scaler.h"
> #include "skl_universal_plane.h"
>@@ -7359,6 +7360,9 @@ static void intel_atomic_commit_tail(struct intel_at=
omic_state *state)
>                  * the culprit.
>                  */
>                 intel_uncore_arm_unclaimed_mmio_detection(&dev_priv->unco=
re);
>+
>+                /* Enable DMC wakelock */
>+                intel_display_wl_enable(dev_priv);
>         }
>         /*
>          * Delay re-enabling DC states by 17 ms to avoid the off->on->off
>diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/g=
pu/drm/i915/display/intel_display_core.h
>index 7e82b87e9cde..ea7e5f4dfcea 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_core.h
>+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
>@@ -26,6 +26,7 @@
> #include "intel_global_state.h"
> #include "intel_gmbus.h"
> #include "intel_opregion.h"
>+#include "intel_wakelock.h"
> #include "intel_wm_types.h"
>=20
> struct drm_i915_private;
>@@ -523,7 +524,10 @@ struct intel_display {
>         struct intel_overlay *overlay;
>         struct intel_display_params params;
>         struct intel_vbt_data vbt;
>+        struct intel_display_wl wl;
>         struct intel_wm wm;
>+
>+
> };
>=20
> #endif /* __INTEL_DISPLAY_CORE_H__ */
>diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers=
/gpu/drm/i915/display/intel_display_driver.c
>index 62f7b10484be..bafea28e3343 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>@@ -196,6 +196,7 @@ void intel_display_driver_early_probe(struct drm_i915_=
private *i915)
>         intel_dpll_init_clock_hook(i915);
>         intel_init_display_hooks(i915);
>         intel_fdi_init_hook(i915);
>+        intel_display_wl_init(i915);
> }
>=20
> /* part #1: call before irq install */
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/d=
rm/i915/display/intel_dmc_regs.h
>index cf10094acae3..e68a2afcf14f 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>@@ -96,4 +96,22 @@
> #define TGL_DMC_DEBUG3                _MMIO(0x101090)
> #define DG1_DMC_DEBUG3                _MMIO(0x13415c)
>=20
>+#define DMC_WAKELOCK_CFG        _MMIO(0x8F1B0)
>+#define  DMC_WAKELOCK_CFG_ENABLE REG_BIT(31)
>+#define DMC_WAKELOCK1_CTL        _MMIO(0x8F140)
>+#define DMC_WAKELOCK2_CTL        _MMIO(0x8F144)
>+#define DMC_WAKELOCK3_CTL        _MMIO(0x8F148)
>+#define DMC_WAKELOCK4_CTL        _MMIO(0x8F14C)
>+#define DMC_WAKELOCK5_CTL        _MMIO(0x8F150)
>+#define DMC_WAKELOCK6_CTL        _MMIO(0x8F154)
>+#define DMC_WAKELOCK7_CTL        _MMIO(0x8F158)
>+#define DMC_WAKELOCK8_CTL        _MMIO(0x8F15C)
>+#define DMC_WAKELOCK9_CTL        _MMIO(0x8F160)
>+#define DMC_WAKELOCK10_CTL        _MMIO(0x8F164)
>+#define DMC_WAKELOCK11_CTL        _MMIO(0x8F168)
>+#define DMC_WAKELOCK12_CTL        _MMIO(0x8F16C)
>+#define DMC_WAKELOCK13_CTL        _MMIO(0x8F170)
>+#define  DMC_WAKELOCK_CTL_REQ         REG_BIT(31)
>+#define  DMC_WAKELOCK_CTL_ACK         REG_BIT(15)
>+
> #endif /* __INTEL_DMC_REGS_H__ */
>diff --git a/drivers/gpu/drm/i915/display/intel_wakelock.c b/drivers/gpu/d=
rm/i915/display/intel_wakelock.c
>new file mode 100644
>index 000000000000..63ec2976a8f7
>--- /dev/null
>+++ b/drivers/gpu/drm/i915/display/intel_wakelock.c
>@@ -0,0 +1,191 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright (C) 2023 Intel Corporation
>+ */
>+
>+#include <linux/kernel.h>
>+
>+#include "intel_de.h"
>+#include "intel_dmc_regs.h"
>+#include "intel_wakelock.h"
>+
>+static struct intel_display_wl_range lnl_wl_range[] =3D {
>+        { .start =3D 0x60000, .end =3D 0x7ffff },
>+};
>+
>+static void __intel_display_wl_release(struct drm_i915_private *i915)
>+{
>+        struct intel_display_wl *wl =3D &i915->display.wl;
>+
>+        WARN_ON(refcount_read(&wl->refcount));
>+
>+        drm_info(&i915->drm,
>+                 "DMC_WAKELOCK1_CTL to be released (refcount =3D %d)\n",
>+                 refcount_read(&wl->refcount));
>+
>+        queue_delayed_work(i915->unordered_wq, &wl->work,
>+                           msecs_to_jiffies(2000));
>+}
>+
>+static void intel_display_wl_work(struct work_struct *work)
>+{
>+        struct intel_display_wl *wl =3D
>+                container_of(work, struct intel_display_wl, work.work);
>+        struct drm_i915_private *i915 =3D
>+                container_of(wl, struct drm_i915_private, display.wl);
>+        unsigned long flags;
>+        u32 ctl_value;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL work running (refcount =
=3D %d)\n",
>+                 refcount_read(&wl->refcount));

Shouldn't we bail out if wl->refcount > 0?

>+
>+        ctl_value =3D __intel_de_rmw(i915, DMC_WAKELOCK1_CTL,
>+                                   DMC_WAKELOCK_CFG_ENABLE, 0);

s/DMC_WAKELOCK_CFG_ENABLE/DMC_WAKELOCK_CTL_REQ/?

>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL 0x%0x before\n", ctl_valu=
e);
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x immediately af=
ter\n",
>+                 intel_de_read(i915, DMC_WAKELOCK1_CTL));
>+
>+        udelay(100);
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x after delay\n"=
,
>+                 intel_de_read(i915, DMC_WAKELOCK1_CTL));
>+
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+}
>+
>+static bool intel_display_wl_check_range(u32 address)
>+{
>+        int i;
>+        bool wl_needed =3D false;
>+
>+        for (i =3D 0; i < ARRAY_SIZE(lnl_wl_range); i++) {
>+                if (address >=3D lnl_wl_range[i].start &&
>+                    address <=3D lnl_wl_range[i].end) {
>+                        wl_needed =3D true;
>+                        break;
>+                }
>+        }
>+
>+        return wl_needed;
>+}
>+
>+void intel_display_wl_init(struct drm_i915_private *i915)
>+{
>+        struct intel_display_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+
>+        spin_lock_init(&wl->lock);
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+        refcount_set(&wl->refcount, 0);
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+}
>+
>+void intel_display_wl_enable(struct drm_i915_private *i915)
>+{
>+        struct intel_display_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        if (wl->enabled)
>+                goto out_unlock;
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK_CFG refcount %d\n",
>+                 refcount_read(&wl->refcount));
>+
>+        INIT_DELAYED_WORK(&wl->work, intel_display_wl_work);
>+
>+        /*
>+         * Enable wakelock in DMC.  We shouldn't try to take the
>+         * wakelock, because we're just enabling it, so call the
>+         * non-locking version directly here.
>+         */
>+        __intel_de_rmw(i915, DMC_WAKELOCK_CFG, 0, DMC_WAKELOCK_CFG_ENABLE=
);
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK_CFG read 0x%0x\n",
>+                 intel_de_read(i915, DMC_WAKELOCK_CFG));
>+
>+        wl->enabled =3D true;
>+
>+out_unlock:
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+        return;
>+}
>+
>+void intel_display_wl_get(struct drm_i915_private *i915, i915_reg_t reg)
>+{
>+        struct intel_display_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+        u32 ctl_value;
>+
>+        if (!intel_display_wl_check_range(reg.reg))
>+                return;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        if (!wl->enabled)
>+                goto out_unlock;
>+
>+        if (refcount_inc_not_zero(&wl->refcount)) {
>+                drm_info(&i915->drm,
>+                         "DMC_WAKELOCK1_CTL refcount is now %d -- wakeloc=
k already taken\n",
>+                         refcount_read(&wl->refcount));
>+                goto out_unlock;
>+        }
>+
>+        refcount_set(&wl->refcount, 1);
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL refcount is now %d\n",
>+                 refcount_read(&wl->refcount));
>+
>+        /* TODO: split this to a separate function to align with _release=
() */
>+        ctl_value =3D __intel_de_rmw(i915, DMC_WAKELOCK1_CTL,
>+                                   0, DMC_WAKELOCK_CFG_ENABLE);

s/DMC_WAKELOCK_CFG_ENABLE/DMC_WAKELOCK_CTL_REQ/?

>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL 0x%0x before\n", ctl_valu=
e);
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x immediately af=
ter\n",
>+                 intel_de_read(i915, DMC_WAKELOCK1_CTL));
>+
>+        udelay(100);
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x after delay\n"=
,
>+                 intel_de_read(i915, DMC_WAKELOCK1_CTL));
>+
>+out_unlock:
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+}
>+
>+void intel_display_wl_put(struct drm_i915_private *i915, i915_reg_t reg)
>+{
>+        struct intel_display_wl *wl =3D &i915->display.wl;
>+        unsigned long flags;
>+
>+        if (!intel_display_wl_check_range(reg.reg))
>+                return;
>+
>+        spin_lock_irqsave(&wl->lock, flags);
>+
>+        if (!wl->enabled || !refcount_read(&wl->refcount))

Shouldn't we warn if wl->refcount is zero?

>+                goto out_unlock;
>+
>+        if (refcount_dec_and_test(&wl->refcount)) {
>+                drm_info(&i915->drm,
>+                         "DMC_WAKELOCK1_CTL refcount is now ZERO\n");
>+
>+                __intel_display_wl_release(i915);
>+
>+                goto out_unlock;
>+        }
>+
>+        drm_info(&i915->drm, "DMC_WAKELOCK1_CTL refcount is now %d\n",
>+                 refcount_read(&wl->refcount));
>+
>+out_unlock:
>+        spin_unlock_irqrestore(&wl->lock, flags);
>+}
>diff --git a/drivers/gpu/drm/i915/display/intel_wakelock.h b/drivers/gpu/d=
rm/i915/display/intel_wakelock.h
>new file mode 100644
>index 000000000000..a47205e1ea32
>--- /dev/null
>+++ b/drivers/gpu/drm/i915/display/intel_wakelock.h
>@@ -0,0 +1,34 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright (C) 2023 Intel Corporation
>+ */
>+
>+#ifndef __INTEL_WAKELOCK_H__
>+#define __INTEL_WAKELOCK_H__
>+
>+#include <linux/types.h>
>+#include <linux/workqueue.h>
>+#include <linux/refcount.h>
>+
>+#include "i915_reg_defs.h"
>+
>+struct drm_i915_private;
>+
>+struct intel_display_wl {
>+        spinlock_t lock;
>+        bool enabled;
>+        refcount_t refcount;
>+        struct delayed_work work;
>+};
>+
>+struct intel_display_wl_range {
>+        u32 start;
>+        u32 end;
>+};
>+
>+void intel_display_wl_init(struct drm_i915_private *i915);
>+void intel_display_wl_enable(struct drm_i915_private *i915);
>+void intel_display_wl_get(struct drm_i915_private *i915, i915_reg_t reg);
>+void intel_display_wl_put(struct drm_i915_private *i915, i915_reg_t reg);
>+
>+#endif /* __INTEL_WAKELOCK_H__ */
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 0292b79852a0..387eccab28ae 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -279,6 +279,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>         i915-display/intel_vdsc.o \
>         i915-display/intel_vga.o \
>         i915-display/intel_vrr.o \
>+        i915-display/intel_wakelock.o \
>         i915-display/intel_wm.o \
>         i915-display/skl_scaler.o \
>         i915-display/skl_universal_plane.o \
>--=20
>2.39.2
>

--
Gustavo Sousa
