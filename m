Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28ADC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 14:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79410E673;
	Wed, 28 Feb 2024 14:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RajPwTXj";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B188610E126
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 13:43:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41SDe2Qc012073; Wed, 28 Feb 2024 13:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=gbbaIjKyJYqdiJn3LCuTCwFTxGo+XR59Kj1/OOErhfk=; b=Ra
 jPwTXjsRX23YHsuwKQ3s0tKtcBH8rGAfIDCf5hw0PrgKaJXahj10wk/B14U+T2dS
 pNOYvJ0mXRHI04MBDWZa90wuznxC3OoyqYIpbo8UaIxItAezyrz7k4wvdZUcQwRg
 znrR75nd7kb4oFQCM4iE8hTgOHjWocGE1QkfKCRN+ZlWxfpghdEFLxWt9ITzNVJ4
 Lm8CxgRerdON0W3WGdKs5uzfpvBmYX16dq1o1TaHhgPFsrtO0OUx1fVZ2fceuSX+
 4wYfob+rSnkltURFsO5iP7MzvsF1kmFSfExC9i2UWyXWZMtKAbMNyxIsBl/oDwCg
 awS2JATXPlQN0hqbmBZg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj5wc8093-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 13:43:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SDh0sc004702
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 13:43:00 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 05:42:58 -0800
Message-ID: <d8b52875-1eea-5eba-55d0-d6acedf206ef@quicinc.com>
Date: Wed, 28 Feb 2024 19:12:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] devcoredump: Add dev_coredump_put()
Content-Language: en-US
To: =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Johannes Berg
 <johannes@sipsolutions.net>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20240227210008.182904-1-jose.souza@intel.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240227210008.182904-1-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: c4sVrRvDN_S1dI-labytC-2CfvTIQqnA
X-Proofpoint-ORIG-GUID: c4sVrRvDN_S1dI-labytC-2CfvTIQqnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_06,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=928 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280108
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:37:51 +0000
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



On 2/28/2024 2:30 AM, José Roberto de Souza wrote:
> This is useful for drivers that don't want to keep a coredump
> available after unloading.
> Otherwise, the coredump would only be removed after DEVCD_TIMEOUT
> seconds.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Mukesh Ojha <quic_mojha@quicinc.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/base/devcoredump.c  | 22 ++++++++++++++++++++++
>   include/linux/devcoredump.h |  5 +++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
> index 7e2d1f0d903a6..e96427411b87c 100644
> --- a/drivers/base/devcoredump.c
> +++ b/drivers/base/devcoredump.c
> @@ -304,6 +304,28 @@ static ssize_t devcd_read_from_sgtable(char *buffer, loff_t offset,
>   				  offset);
>   }
>  
[...]

> +/**
> + * dev_coredump_put - remove device coredump
> + * @dev: the struct device for the crashed device
> + *
> + * If giving device has a coredump this removes it from file system and free
> + * associated data otherwise does nothing.
> + * This is useful for drivers that don't want to keep a coredump
> + * available after unloading.
> + */

[...]

Slight rephrasing..

""
dev_coredump_put() removes coredump, if exists, for a given device from 
the file system and free its associated data otherwise, does nothing.

It is useful for modules that do not want to keep coredump
available after its unload.
""

Overall, LGTM..

-Mukesh

> +void dev_coredump_put(struct device *dev)
> +{
> +	struct device *existing;
> +
> +	existing = class_find_device(&devcd_class, NULL, dev,
> +				     devcd_match_failing);
> +	if (existing) {
> +		devcd_free(existing, NULL);
> +		put_device(existing);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(dev_coredump_put);
> +
>   /**
>    * dev_coredumpm - create device coredump with read/free methods
>    * @dev: the struct device for the crashed device
> diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
> index c008169ed2c6f..c8f7eb6cc1915 100644
> --- a/include/linux/devcoredump.h
> +++ b/include/linux/devcoredump.h
> @@ -63,6 +63,8 @@ void dev_coredumpm(struct device *dev, struct module *owner,
>   
>   void dev_coredumpsg(struct device *dev, struct scatterlist *table,
>   		    size_t datalen, gfp_t gfp);
> +
> +void dev_coredump_put(struct device *dev);
>   #else
>   static inline void dev_coredumpv(struct device *dev, void *data,
>   				 size_t datalen, gfp_t gfp)
> @@ -85,6 +87,9 @@ static inline void dev_coredumpsg(struct device *dev, struct scatterlist *table,
>   {
>   	_devcd_free_sgtable(table);
>   }
> +static inline void dev_coredump_put(struct device *dev)
> +{
> +}
>   #endif /* CONFIG_DEV_COREDUMP */
>   
>   #endif /* __DEVCOREDUMP_H */
